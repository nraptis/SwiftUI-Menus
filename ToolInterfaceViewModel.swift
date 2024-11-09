//
//  ToolInterfaceViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import Foundation
import Observation
import Combine

@MainActor var toolNodeBaseID = UInt16(0)
@MainActor func getToolNodeID() -> UInt16 {
    toolNodeBaseID += 1
    return toolNodeBaseID
}

@Observable class ToolInterfaceViewModel {
    
    @MainActor @ObservationIgnored var rowRecipeTable = [ToolRowSlot: RowRecipe]()
    @MainActor func isRowRecipeOnSlot(recipe: RowRecipe, slot: ToolRowSlot) -> Bool {
        rowRecipeTable[slot] == recipe
    }
    @MainActor func storeRowRecipeOnSlot(recipe: RowRecipe, slot: ToolRowSlot) {
        rowRecipeTable[slot] = recipe
    }
    @MainActor func getNodesFromRecipe(recipe: RowRecipe) -> [ToolNode] {
        ToolInterfaceFactory.generateNodes(orientation: orientation, inrs: recipe.inrs)
    }
    
    @MainActor func reloadAllRows() {
        let interfaceConfiguration = getCurrentInterfaceConfiguration()
        let allRows = getAllRows()
        for row in allRows {
            snapRowContent(configuration: interfaceConfiguration, toolRow: row)
        }
    }
    
    @ObservationIgnored var darkModeDidChangePublisher = PassthroughSubject<Void, Never>()
    @ObservationIgnored var purchasedDidChangePublisher = PassthroughSubject<Void, Never>()
    
    @MainActor let layoutRelay = ToolInterfaceLayoutRelay()
    
    //
    // So, per this thought, we want the category for ALL POSSIBLE rows...
    // ONLY re-calculate it when the WIDTH OR SAFE AREA changes... (That could be frequent)
    // ...
    //
    
    @ObservationIgnored weak var jiggleViewController: JiggleViewController?
    
    @MainActor func getRow(slot: ToolRowSlot) -> ToolRow? {
        if Device.isPad {
            for row in rowsDraggable {
                if row.slot == slot {
                    return row
                }
            }
        } else {
            for row in rowsTop {
                if row.slot == slot {
                    return row
                }
            }
            for row in rowsBottom {
                if row.slot == slot {
                    return row
                }
            }
        }
        return nil
    }
    
    @MainActor private func generateRow(slot: ToolRowSlot) -> ToolRow {
        let result = ToolRow(slot: slot)
        //result.configuration = .unknown
        return result
    }
    
    @MainActor static func calculateLayoutStackingCategory(width: Int,
                                                height: Int,
                                                nodes: [ToolNode],
                                                centerPinnedElement: ToolInterfaceElement?,
                                                slot: ToolRowSlot) -> ToolInterfaceLayoutStackingCategory {
        
        let orientation: Orientation
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            orientation = jiggleDocument.orientation
        } else if let rootViewModel = ApplicationController.rootViewModel {
            orientation = rootViewModel.orientation
        } else {
            orientation = .portrait
        }
        
        return calculateLayoutStackingCategory(orientation: orientation,
                                               width: width,
                                               height: height,
                                               nodes: nodes,
                                               centerPinnedElement: centerPinnedElement,
                                               slot: slot)
    }
    
    @MainActor static func calculateLayoutStackingCategory(orientation: Orientation,
                                                width: Int,
                                                height: Int,
                                                nodes: [ToolNode],
                                                centerPinnedElement: ToolInterfaceElement?,
                                                slot: ToolRowSlot) -> ToolInterfaceLayoutStackingCategory {
        let categories = ToolInterfaceLayoutStackingCategory.getAllInPriorityOrderExceptLeast()
        
        if ApplicationController.FORCE_LONG_ALL {
            return .large(.init(isButtonLong: true, isModeSwitchLong: true, isCheckBoxLong: true, isSegmentLong: true, isStepperLong: true))
        } else if ApplicationController.FORCE_STACKED_ALL {
            return .large(.init(isButtonLong: false, isModeSwitchLong: false, isCheckBoxLong: false, isSegmentLong: false, isStepperLong: false))
        }
        
        return calculateLayoutStackingCategory(orientation: orientation,
                                               width: width,
                                               height: height,
                                               nodes: nodes,
                                               centerPinnedElement: centerPinnedElement,
                                               categories: categories,
                                               slot: slot)
    }
    
    @MainActor static func calculateLayoutStackingCategory(orientation: Orientation,
                                                width: Int,
                                                height: Int,
                                                nodes: [ToolNode],
                                                centerPinnedElement: ToolInterfaceElement?,
                                                categories: [ToolInterfaceLayoutStackingCategory],
                                                slot: ToolRowSlot) -> ToolInterfaceLayoutStackingCategory {
        
        //let centerPinnedNode = ToolRow.getCenterPinnedNode(centerPinnedElement: centerPinnedElement, nodes: nodes)
        let rowStackingCategoryCalculator = RowStackingCategoryCalculator(orientation: orientation,
                                                                          nodes: nodes,
                                                                          slot: slot)
        
        var result = ToolInterfaceLayoutStackingCategory.allVerticalSmall
        for layoutStackingCategory in categories {
            let isSupported = rowStackingCategoryCalculator.doesSupportLayoutStackingCategory(layoutStackingCategory: layoutStackingCategory,
                                                                                              width: width,
                                                                                              height: height)
            if isSupported {
                result = layoutStackingCategory
                break
            }
        }
        return result
    }
    
    @MainActor func calculateLayoutStackingCategory(width: Int,
                                         height: Int,
                                         categories: [ToolInterfaceLayoutStackingCategory],
                                         calculators: [RowStackingCategoryCalculator]) -> ToolInterfaceLayoutStackingCategory {
        
        var result = ToolInterfaceLayoutStackingCategory.allVerticalSmall
        for layoutStackingCategory in categories {
        
            var isSupported = true
            for rowStackingCategoryCalculator in calculators {
                
                if rowStackingCategoryCalculator.doesSupportLayoutStackingCategory(layoutStackingCategory: layoutStackingCategory,
                                                                                   width: width,
                                                                                   height: height) == false {
                    isSupported = false
                    break
                }
            }
            
            if isSupported {
                result = layoutStackingCategory
                break
            }
            
        }
        
        return result
    }
    
    //@ObservationIgnored var toolConfigurationIdiomPrevious = ToolConfigurationIdiom.unknown
    //@ObservationIgnored var toolConfigurationIdiomCurrent = ToolConfigurationIdiom.unknown
    
    @ObservationIgnored var rowsTop = [ToolRow]()
    @ObservationIgnored var rowsBottom = [ToolRow]()
    @ObservationIgnored var rowsDraggable = [ToolRow]()
    
    @ObservationIgnored var rowsVideoRecord = [ToolRow]()
    @ObservationIgnored var rowsVideoExport = [ToolRow]()
    
    @ObservationIgnored var rowsZoom = [ToolRow]()
    
    
    
    @MainActor var isRowAnimationActive: Bool {
        for row in getAllRows() {
            if row.isRowAnimationActive {
                return true
            }
        }
        return false
    }
    
    @ObservationIgnored let orientation: Orientation
    
    //TODO: Nick Hook
    //@ObservationIgnored unowned var jiggleViewModel: JiggleViewModel!
    @ObservationIgnored weak var jiggleViewModel: JiggleViewModel?
    
    @MainActor init(orientation: Orientation, jiggleViewModel: JiggleViewModel) {
        
        self.orientation = orientation
        self.jiggleViewModel = jiggleViewModel
        
        layoutRelay.rowHeight = ToolInterfaceTheme.getRowHeight(orientation: orientation)
        layoutRelay.orientation = orientation
        
        ApplicationController.shared.toolInterfaceViewModel = self
        
        if Device.isPad {
            rowsDraggable.append(generateRow(slot: .top_Primary))
            rowsDraggable.append(generateRow(slot: .top_Secondary1))
            rowsDraggable.append(generateRow(slot: .top_Secondary2))
            
            rowsDraggable.append(generateRow(slot: .bottom_Secondary2))
            rowsDraggable.append(generateRow(slot: .bottom_Secondary1))
            rowsDraggable.append(generateRow(slot: .bottom_Primary))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsDraggable.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsDraggable.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsDraggable.append(generateRow(slot: .top_Test_3))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
            
        } else {
            
            let topMenuStandardRowCount = ToolInterfaceTheme.getTopMenuStandardRowCount(orientation: orientation)
            let bottomMenuStandardRowCount = ToolInterfaceTheme.getBottomMenuStandardRowCount(orientation: orientation)
            
            if topMenuStandardRowCount > 0 { rowsTop.append(generateRow(slot: .top_Primary)) }
            if topMenuStandardRowCount > 1 { rowsTop.append(generateRow(slot: .top_Secondary1)) }
            if topMenuStandardRowCount > 2 { rowsTop.append(generateRow(slot: .top_Secondary2)) }
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsTop.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsTop.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsTop.append(generateRow(slot: .top_Test_3))
            }
            
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsBottom.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsBottom.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsBottom.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
            
            if bottomMenuStandardRowCount > 2 { rowsBottom.append(generateRow(slot: .bottom_Secondary2)) }
            if bottomMenuStandardRowCount > 1 { rowsBottom.append(generateRow(slot: .bottom_Secondary1)) }
            if bottomMenuStandardRowCount > 0 { rowsBottom.append(generateRow(slot: .bottom_Primary)) }

        }
        
        if Device.isPad {
            rowsVideoRecord.append(generateRow(slot: .video_record_1))
            rowsVideoRecord.append(generateRow(slot: .video_record_2))
            rowsVideoRecord.append(generateRow(slot: .video_record_3))
            rowsVideoRecord.append(generateRow(slot: .video_record_4))
            rowsVideoRecord.append(generateRow(slot: .video_record_5))
            rowsVideoRecord.append(generateRow(slot: .video_record_6))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsVideoRecord.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsVideoRecord.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsVideoRecord.append(generateRow(slot: .top_Test_3))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
            
        } else {
            rowsVideoRecord.append(generateRow(slot: .video_record_1))
            rowsVideoRecord.append(generateRow(slot: .video_record_2))
            rowsVideoRecord.append(generateRow(slot: .video_record_3))
            rowsVideoRecord.append(generateRow(slot: .video_record_4))
            rowsVideoRecord.append(generateRow(slot: .video_record_5))
            rowsVideoRecord.append(generateRow(slot: .video_record_6))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsVideoRecord.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsVideoRecord.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsVideoRecord.append(generateRow(slot: .top_Test_3))
            }
            
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
        }
        
        if Device.isPad {
            rowsVideoExport.append(generateRow(slot: .video_export_1))
            rowsVideoExport.append(generateRow(slot: .video_export_2))
            rowsVideoExport.append(generateRow(slot: .video_export_3))
            rowsVideoExport.append(generateRow(slot: .video_export_4))
            rowsVideoExport.append(generateRow(slot: .video_export_5))
            rowsVideoExport.append(generateRow(slot: .video_export_6))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsVideoExport.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsVideoExport.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsVideoExport.append(generateRow(slot: .top_Test_3))
            }
            
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsVideoExport.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsVideoExport.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsVideoExport.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
            
        } else {
            rowsVideoExport.append(generateRow(slot: .video_export_1))
            rowsVideoExport.append(generateRow(slot: .video_export_2))
            rowsVideoExport.append(generateRow(slot: .video_export_3))
            rowsVideoExport.append(generateRow(slot: .video_export_4))
            rowsVideoExport.append(generateRow(slot: .video_export_5))
            rowsVideoExport.append(generateRow(slot: .video_export_6))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsVideoExport.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsVideoExport.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsVideoExport.append(generateRow(slot: .top_Test_3))
            }
            
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsVideoExport.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsVideoExport.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsVideoExport.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
        }
        
        if Device.isPad {
            rowsZoom.append(generateRow(slot: .zoom_1))
            rowsZoom.append(generateRow(slot: .zoom_2))
            rowsZoom.append(generateRow(slot: .zoom_3))
            rowsZoom.append(generateRow(slot: .zoom_4))
            rowsZoom.append(generateRow(slot: .zoom_5))
            rowsZoom.append(generateRow(slot: .zoom_6))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsZoom.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsZoom.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsZoom.append(generateRow(slot: .top_Test_3))
            }
            
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsZoom.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsZoom.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsZoom.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
            
        } else {
            rowsZoom.append(generateRow(slot: .zoom_1))
            rowsZoom.append(generateRow(slot: .zoom_2))
            rowsZoom.append(generateRow(slot: .zoom_3))
            rowsZoom.append(generateRow(slot: .zoom_4))
            rowsZoom.append(generateRow(slot: .zoom_5))
            rowsZoom.append(generateRow(slot: .zoom_6))
            
            if ApplicationController.TEST_ROW_TOP_1 {
                rowsZoom.append(generateRow(slot: .top_Test_1))
            }
            if ApplicationController.TEST_ROW_TOP_2 {
                rowsZoom.append(generateRow(slot: .top_Test_2))
            }
            if ApplicationController.TEST_ROW_TOP_3 {
                rowsZoom.append(generateRow(slot: .top_Test_3))
            }
            
            
            if ApplicationController.TEST_ROW_BOTTOM_1 {
                rowsZoom.append(generateRow(slot: .bottom_Test_1))
            }
            if ApplicationController.TEST_ROW_BOTTOM_2 {
                rowsZoom.append(generateRow(slot: .bottom_Test_2))
            }
            if ApplicationController.TEST_ROW_BOTTOM_3 {
                rowsZoom.append(generateRow(slot: .bottom_Test_3))
            }
            if ApplicationController.TEST_ROW_BOTTOM_4 {
                rowsDraggable.append(generateRow(slot: .bottom_Test_4))
            }
        }
        
        // So many of the rows... Video Record, Video Export, Zoom, Graph...
        // Only need to be slotted one time... These do not change content...
        
        let interfaceConfiguration = getCurrentInterfaceConfiguration()
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsZoom)
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsVideoExport)
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsVideoRecord)
        
        publisherLinkUp()
    }
    
    var resetZoomActiveUpdateCancellable: AnyCancellable?
    var weightCurveGraphEnabledUpdateCancellable: AnyCancellable?
    var jigglesDidChangeCancellable: AnyCancellable?
    
    @MainActor var controlPointsDidChangeCancellable: AnyCancellable?
    
    
    var creatorModeUpdateCancellable: AnyCancellable?
    
    //var createJiggleCentersModificationUpdateCancellable: AnyCancellable?
    //var createGuideCentersModificationUpdateCancellable: AnyCancellable?
    
    //var createJigglesStandardUpdateCancellable: AnyCancellable?
    //var createJigglesDrawingUpdateCancellable: AnyCancellable?
    //var createPointsUpdateCancellable: AnyCancellable?
    //var removePointsUpdateCancellable: AnyCancellable?
    //var createGuidesStandardUpdateCancellable: AnyCancellable?
    //var createGuidesDrawingUpdateCancellable: AnyCancellable?
    //var createGuidePointsUpdateCancellable: AnyCancellable?
    //var removeGuidePointsUpdateCancellable: AnyCancellable?
    
    var selectedJiggleDidChangeCancellable: AnyCancellable?
    var selectedTimeLineSwatchDidChangeCancellable: AnyCancellable?
    
    @MainActor func publisherLinkUp() {
        
        guard let jiggleViewModel = jiggleViewModel else {
            return
        }
        
        jigglesDidChangeCancellable = jiggleViewModel
            .jiggleDocument
            .jigglesDidChangePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.handleJigglesDidChange()
                    }
                //}
            }
        
        controlPointsDidChangeCancellable = jiggleViewModel
            .jiggleDocument
            .controlPointsDidChangePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.handleControlPointsDidChange()
                    }
                //}
            }
        
        
        resetZoomActiveUpdateCancellable = jiggleViewModel
            .resetZoomActiveUpdatePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.handleResetZoomActiveDidChange()
                    }
                //}
            }
        
        selectedJiggleDidChangeCancellable = jiggleViewModel
            .jiggleDocument
            .selectedJiggleDidChangePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.handleSelectedJiggleDidChange()
                    }
                //}
            }
        
        
        selectedTimeLineSwatchDidChangeCancellable = jiggleViewModel
            .jiggleDocument
            .selectedTimeLineSwatchUpdatePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.handleSelectedTimeLineSwatchDidChange()
                    }
                //}
            }
        
        creatorModeUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .creatorModeUpdatePublisher
            .sink { [weak self] in
                //Task { @MainActor [weak self] in
                    if let self = self {
                        self.handleCreatorModesDidChange()
                    }
                //}
            }
        
    }
    
    @MainActor func layoutAllRowsPhone(menuWidthWithSafeArea: Int, rowHeight: Int, safeAreaLeft: Int, safeAreaRight: Int) {
        if menuWidthWithSafeArea != layoutRelay.menuWidthWithSafeArea ||
            rowHeight != layoutRelay.rowHeight ||
            safeAreaLeft != layoutRelay.safeAreaLeft ||
            safeAreaRight != layoutRelay.safeAreaRight {
            
            layoutRelay.menuWidthWithSafeArea = menuWidthWithSafeArea
            layoutRelay.rowHeight = rowHeight
            layoutRelay.safeAreaLeft = safeAreaLeft
            layoutRelay.safeAreaRight = safeAreaRight
            
            //print("layoutAllRowsPhone(menuWidthWithSafeArea: \(menuWidthWithSafeArea), safeAreaLeft: \(safeAreaLeft), safeAreaRight: \(safeAreaRight))")
            
            for row in rowsTop {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
            
            for row in rowsBottom {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
            
            for row in rowsVideoRecord {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
            
            for row in rowsVideoExport {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
            
            for row in rowsZoom {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
        }
    }
    
    @MainActor func layoutAllRowsTablet(menuWidthWithSafeArea: Int, rowHeight: Int, safeAreaLeft: Int, safeAreaRight: Int) {

        if menuWidthWithSafeArea != layoutRelay.menuWidthWithSafeArea ||
            rowHeight != layoutRelay.rowHeight ||
            safeAreaLeft != layoutRelay.safeAreaLeft ||
            safeAreaRight != layoutRelay.safeAreaRight {
            
            layoutRelay.menuWidthWithSafeArea = menuWidthWithSafeArea
            layoutRelay.rowHeight = rowHeight
            layoutRelay.safeAreaLeft = safeAreaLeft
            layoutRelay.safeAreaRight = safeAreaRight
            
            for row in rowsDraggable {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: 0,
                           safeAreaRight: 0)
            }
            
            for row in rowsVideoRecord {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: 0,
                           safeAreaRight: 0)
            }
            
            for row in rowsVideoExport {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: 0,
                           safeAreaRight: 0)
            }
            
            for row in rowsZoom {
                row.layout(orientation: orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: 0,
                           safeAreaRight: 0)
            }
        }
    }
    
    @MainActor var isBlocked: Bool {
        
        if isBlockedExceptForHistory {
            return true
        }
        
        /*
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            if jiggleViewController.enqueuedHistoryState !== nil {
                print("Action Blocked - jiggleViewController.enqueuedHistoryState")
                return true
            }
        }
        */
        
        return false
    }
    
    @MainActor var isBlockedExceptForHistory: Bool {
        
        /*
        switch jiggleViewModel._storedDocumentModeTransitionState {
        case .pendingRemesh:
            print("Action Blocked - pendingRemesh")
            return true
        case .pendingTransition:
            print("Action Blocked - pendingTransition")
            return true
        default:
            break
        }
        
        if jiggleViewModel._storedDisplayTransition.isActive {
            print("Action Blocked - jiggleViewModel._storedDisplayTransition.isActive")
            return true
        }
        */
        
        guard let jiggleViewModel = jiggleViewModel else {
            print("Action Blocked - jiggleViewModel not exist")
            return true
        }
        
        if jiggleViewModel.jiggleDocument.isWakeUpComplete == false {
            print("Action Blocked - isWakeUpComplete not ready")
            return true
        }
        
        if let jiggleViewController = jiggleViewModel.jiggleViewController {
            
            if jiggleViewController.toolAction !== nil {
                print("Action Blocked - toolAction = LIVE")
                return true
            }
            if Device.isPad {
                
                if jiggleViewController.padDraggableMenu.isModeAnimating {
                    print("Action Blocked - isModeAnimating")
                    return true
                }

                if jiggleViewController.padDraggableMenu.standardContainerView.isModeAnimating {
                    print("Action Blocked - standardView.isModeAnimating")
                    return true
                }
                
            } else {
                
                if jiggleViewController.phoneTopMenu.isModeAnimating {
                    print("Action Blocked - isModeAnimating")
                    return true
                }

                if jiggleViewController.phoneTopMenu.standardContainerView.isModeAnimating {
                    print("Action Blocked - standardView.isModeAnimating")
                    return true
                }
            }
        }
        
        if isBlockedAnyTransition {
            return true
        }
        
        return false
    }
    
    var isBlockedAnyTransition: Bool {
        if let jiggleViewModel {
            if jiggleViewModel.isDisplayTransitionActive {
                return true
            }
        }
        return false
    }
    
    func publishDarkModeDidChange() {
        darkModeDidChangePublisher.send(())
    }
    
    func publishPurchasedDidChange() {
        purchasedDidChangePublisher.send(())
    }
    
    @MainActor func snapRowContent(configuration: any InterfaceConfigurationConforming,
                        toolRows: [ToolRow]) {
        for toolRow in toolRows {
            snapRowContent(configuration: configuration,
                           toolRow: toolRow)
        }
    }
    
    @MainActor func animateRowContent_Step1(configuration: any InterfaceConfigurationConforming,
                                            toolRows: [ToolRow],
                                            reversed: Bool) {
        for toolRow in toolRows {
            animateRowContent_Step1(configuration: configuration,
                                    toolRow: toolRow,
                                    reversed: reversed)
        }
    }
    
    @MainActor func animateRowContent_Step2(configuration: any InterfaceConfigurationConforming,
                                 toolRows: [ToolRow],
                                 reversed: Bool,
                                 time: CGFloat) {
        for toolRow in toolRows {
            animateRowContent_Step2(configuration: configuration,
                                    toolRow: toolRow,
                                    reversed: reversed,
                                    time: time)
        }
    }
    
    @MainActor func snapRowContent(configuration: any InterfaceConfigurationConforming,
                                   toolRow: ToolRow) {
        
        let slot = toolRow.slot
        let recipe = getRowRecipe(slot: slot,
                                  configuration: configuration,
                                  orientation: orientation)
        if isRowRecipeOnSlot(recipe: recipe,
                             slot: slot) {
            toolRow.animationNodesWillChange = false
        } else {
            storeRowRecipeOnSlot(recipe: recipe, slot: slot)
            toolRow.animationNodesWillChange = true
            let nodes = getNodesFromRecipe(recipe: recipe)
            let centerPinnedElement = recipe.centerPinnedElement
            let menuWidthWithSafeArea = layoutRelay.menuWidthWithSafeArea
            toolRow.setNodes_NotAnimated(nodes,
                                         orientation: orientation,
                                         menuWidthWithSafeArea: menuWidthWithSafeArea,
                                         height: layoutRelay.rowHeight,
                                         safeAreaLeft: layoutRelay.safeAreaLeft,
                                         safeAreaRight: layoutRelay.safeAreaRight,
                                         centerPinnedElement: centerPinnedElement)
        }
    }
    
    @MainActor func animateRowContent_Step1(configuration: any InterfaceConfigurationConforming,
                                 toolRow: ToolRow,
                                 reversed: Bool) {
        
        let slot = toolRow.slot
        let recipe = getRowRecipe(slot: slot,
                                  configuration: configuration,
                                  orientation: orientation)
        if isRowRecipeOnSlot(recipe: recipe,
                             slot: slot) {
            toolRow.animationNodesWillChange = false
        } else {
            storeRowRecipeOnSlot(recipe: recipe, slot: slot)
            toolRow.animationNodesWillChange = true
            let nodes = getNodesFromRecipe(recipe: recipe)
            let centerPinnedElement = recipe.centerPinnedElement
            let menuWidthWithSafeArea = layoutRelay.menuWidthWithSafeArea
            toolRow.setNodes_AnimatedStep1(nodes,
                                           orientation: orientation,
                                           reversed: reversed,
                                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                                           height: layoutRelay.rowHeight,
                                           safeAreaLeft: layoutRelay.safeAreaLeft,
                                           safeAreaRight: layoutRelay.safeAreaRight,
                                           centerPinnedElement: centerPinnedElement)
        }
    }
    
    @MainActor func animateRowContent_Step2(configuration: any InterfaceConfigurationConforming,
                                 toolRow: ToolRow,
                                 reversed: Bool,
                                            time: CGFloat) {
        
        if toolRow.animationNodesWillChange {
            toolRow.setNodes_AnimatedStep2(reversed: reversed,
                                           time: time)
        }
    }
    
    @MainActor func getCurrentInterfaceConfiguration() -> any InterfaceConfigurationConforming {
        if Device.isPad {
            return getCurrentInterfaceConfigurationPad()
        } else {
            return getCurrentInterfaceConfigurationPhone()
        }
    }
    
    @MainActor func getCurrentInterfaceConfigurationPad() -> InterfaceConfigurationPad {
        var result = InterfaceConfigurationPad()
        if let jiggleViewModel = jiggleViewModel {
            result.isExpanded = jiggleViewModel.isPadMenuExpanded
            result.isVideoRecordEnabled = jiggleViewModel.isVideoRecordEnabled
            result.isVideoExportEnabled = jiggleViewModel.isVideoExportEnabled
            result.isGuidesEnabled = jiggleViewModel.jiggleDocument.isGuidesEnabled
            result.isAnimationLoopsEnabled = jiggleViewModel.jiggleDocument.isAnimationLoopsEnabled
            result.isTimeLineEnabled = jiggleViewModel.jiggleDocument.isTimeLineEnabled
            //result.isTimeLinePage2Enabled = jiggleViewModel.isTimeLinePage2Enabled
            //result.isGraphPage2Enabled = jiggleViewModel.isGraphPage2Enabled
            //result.isAnimationContinuousPage2Enabled = jiggleViewModel.isAnimationContinuousPage2Enabled
            
            result.isGraphEnabled = jiggleViewModel.isGraphEnabled
            result.isZoomEnabled = jiggleViewModel.isZoomEnabled
            result.documentMode = jiggleViewModel.jiggleDocument.documentMode
            result.editMode = jiggleViewModel.jiggleDocument.editMode
            result.weightMode = jiggleViewModel.jiggleDocument.weightMode
            result.creatorMode = jiggleViewModel.jiggleDocument.creatorMode
            result.isAnimationContinuousEnabled = jiggleViewModel.jiggleDocument.isAnimationContinuousEnabled
            result.animationLoopsPage = jiggleViewModel.jiggleDocument.animationLoopsPage
            result.animationTimeLinePage = jiggleViewModel.jiggleDocument.animationTimeLinePage
            result.animationContinuousPage = jiggleViewModel.jiggleDocument.animationContinuousPage
            
            result.graphPage = jiggleViewModel.jiggleDocument.graphPage
            
        }
        return result
    }
    
    @MainActor func getCurrentInterfaceConfigurationPhone() -> InterfaceConfigurationPhone {
        var result = InterfaceConfigurationPhone()
        if let jiggleViewModel = jiggleViewModel {
            result.isExpandedTop = jiggleViewModel.isPhoneTopMenuExpanded
            result.isExpandedBottom = jiggleViewModel.isPhoneBottomMenuExpanded
            result.isVideoRecordEnabled = jiggleViewModel.isVideoRecordEnabled
            result.isVideoExportEnabled = jiggleViewModel.isVideoExportEnabled
            result.isGuidesEnabled = jiggleViewModel.jiggleDocument.isGuidesEnabled
            result.isAnimationLoopsEnabled = jiggleViewModel.jiggleDocument.isAnimationLoopsEnabled
            result.isTimeLineEnabled = jiggleViewModel.jiggleDocument.isTimeLineEnabled
            //result.isTimeLinePage2Enabled = jiggleViewModel.isTimeLinePage2Enabled
            //result.isGraphPage2Enabled = jiggleViewModel.isGraphPage2Enabled
            //result.isAnimationContinuousPage2Enabled = jiggleViewModel.isAnimationContinuousPage2Enabled
            result.isGraphEnabled = jiggleViewModel.isGraphEnabled
            result.isZoomEnabled = jiggleViewModel.isZoomEnabled
            result.documentMode = jiggleViewModel.jiggleDocument.documentMode
            result.editMode = jiggleViewModel.jiggleDocument.editMode
            result.weightMode = jiggleViewModel.jiggleDocument.weightMode
            result.creatorMode = jiggleViewModel.jiggleDocument.creatorMode
            result.isAnimationContinuousEnabled = jiggleViewModel.jiggleDocument.isAnimationContinuousEnabled
            result.animationLoopsPage = jiggleViewModel.jiggleDocument.animationLoopsPage
            result.animationTimeLinePage = jiggleViewModel.jiggleDocument.animationTimeLinePage
            result.animationContinuousPage = jiggleViewModel.jiggleDocument.animationContinuousPage
            
            result.graphPage = jiggleViewModel.jiggleDocument.graphPage
        }
        return result
    }
    
}
