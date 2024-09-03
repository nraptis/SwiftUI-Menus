//
//  ToolInterfaceViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/17/24.
//

import Foundation
import Observation
import Combine

var toolNodeBaseID = UInt16(0)
func getToolNodeID() -> UInt16 {
    toolNodeBaseID += 1
    return toolNodeBaseID
}

@Observable class ToolInterfaceViewModel {
    
    @ObservationIgnored var darkModeDidChangePublisher = PassthroughSubject<Void, Never>()
    
    let layoutRelay = ToolInterfaceLayoutRelay()
    
    //
    // So, per this thought, we want the category for ALL POSSIBLE rows...
    // ONLY re-calculate it when the WIDTH OR SAFE AREA changes... (That could be frequent)
    // ...
    //
    
    @ObservationIgnored weak var jiggleViewController: JiggleViewController?
    
    func getRow(slot: ToolRowSlot) -> ToolRow? {
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
        for row in rowsGraphSideMenu {
            if row.slot == slot {
                return row
            }
        }
        return nil
    }
    
    private func generateRow(slot: ToolRowSlot) -> ToolRow {
        let result = ToolRow(slot: slot)
        result.configuration = .unknown
        return result
    }
    
    //@ObservationIgnored var allPossibleRowBluePrints = [RowBluePrint]()
    //@ObservationIgnored var allPossibleRowBluePrintsGraphSideMenu = [RowBluePrint]()
    
    //@ObservationIgnored var rowStackingCategoryCalculators = [RowStackingCategoryCalculator]()
    //@ObservationIgnored var rowStackingCategoryCalculatorsGraphSideMenu = [RowStackingCategoryCalculator]()
    
    //@ObservationIgnored var checkLayoutStackingCategories = ToolInterfaceLayoutStackingCategory.getAllInPriorityOrderExceptLeast()
    
    //@ObservationIgnored var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    //@ObservationIgnored var layoutStackingCategoryGraphSideMenu = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    /*
    func calculateLayoutStackingCategoriesAndSliderFlavor(width: Int, height: Int) {
        let contentWidth = layoutRelay.menuWidthWithSafeArea - (layoutRelay.safeAreaLeft + layoutRelay.safeAreaRight)
        layoutStackingCategory = calculateLayoutStackingCategory(width: contentWidth,
                                                                 height: layoutRelay.rowHeight,
                                                                 categories: checkLayoutStackingCategories,
                                                                 calculators: rowStackingCategoryCalculators)
    }
    
    
    func calculateLayoutSchemeFlavorSliders(width: Int,
                                            height: Int,
                                            calculators: [RowStackingCategoryCalculator]) -> LayoutSchemeFlavor {
        var result = LayoutSchemeFlavor.getMax()
        for rowStackingCategoryCalculator in calculators {
            let layoutSchemeFlavor = rowStackingCategoryCalculator.computeSliderLayoutSchemeFlavor(width: width,
                                                                                                   height: height,
                                                                                                   safeAreaLeft: layoutRelay.safeAreaLeft,
                                                                                                   safeAreaRight: layoutRelay.safeAreaRight)
            if layoutSchemeFlavor < result {
                result = layoutSchemeFlavor
            }
        }
        return result
    }
    */
    
    static func calculateLayoutStackingCategory(width: Int,
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
    
    static func calculateLayoutStackingCategory(orientation: Orientation,
                                                width: Int,
                                                height: Int,
                                                nodes: [ToolNode],
                                                centerPinnedElement: ToolInterfaceElement?,
                                                slot: ToolRowSlot) -> ToolInterfaceLayoutStackingCategory {
        let categories = ToolInterfaceLayoutStackingCategory.getAllInPriorityOrderExceptLeast()
        return calculateLayoutStackingCategory(orientation: orientation,
                                               width: width,
                                               height: height,
                                               nodes: nodes,
                                               centerPinnedElement: centerPinnedElement,
                                               categories: categories,
                                               slot: slot)
    }
    
    static func calculateLayoutStackingCategory(orientation: Orientation,
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
    
    func calculateLayoutStackingCategory(width: Int,
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
    @ObservationIgnored var rowsGraphSideMenu = [ToolRow]()
    
    @ObservationIgnored var rowsVideoRecord = [ToolRow]()
    @ObservationIgnored var rowsVideoExport = [ToolRow]()
    
    @ObservationIgnored var rowsZoom = [ToolRow]()
    
    
    
    var isRowAnimationActive: Bool {
        for row in getAllRows() {
            if row.isRowAnimationActive {
                return true
            }
        }
        return false
    }
    
    @ObservationIgnored let orientation: Orientation
    @ObservationIgnored unowned var jiggleViewModel: JiggleViewModel!
    init(orientation: Orientation, jiggleViewModel: JiggleViewModel) {
        
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
            
            if ApplicationController.TEST_ROW_TOP {
                rowsDraggable.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsDraggable.append(generateRow(slot: .bottom_Test))
            }
        } else {
            
            let topMenuStandardRowCount = ToolInterfaceTheme.getTopMenuStandardRowCount(orientation: orientation)
            let bottomMenuStandardRowCount = ToolInterfaceTheme.getBottomMenuStandardRowCount(orientation: orientation)
            
            if topMenuStandardRowCount > 0 { rowsTop.append(generateRow(slot: .top_Primary)) }
            if topMenuStandardRowCount > 1 { rowsTop.append(generateRow(slot: .top_Secondary1)) }
            if topMenuStandardRowCount > 2 { rowsTop.append(generateRow(slot: .top_Secondary2)) }
            if ApplicationController.TEST_ROW_TOP {
                rowsTop.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsBottom.append(generateRow(slot: .bottom_Test))
            }
            if bottomMenuStandardRowCount > 2 { rowsBottom.append(generateRow(slot: .bottom_Secondary2)) }
            if bottomMenuStandardRowCount > 1 { rowsBottom.append(generateRow(slot: .bottom_Secondary1)) }
            if bottomMenuStandardRowCount > 0 { rowsBottom.append(generateRow(slot: .bottom_Primary)) }

        }
        
        rowsGraphSideMenu.append(generateRow(slot: .graph_side_menu_1))
        rowsGraphSideMenu.append(generateRow(slot: .graph_side_menu_2))
        rowsGraphSideMenu.append(generateRow(slot: .graph_side_menu_3))
        
        if Device.isPad {
            rowsVideoRecord.append(generateRow(slot: .video_record_1))
            rowsVideoRecord.append(generateRow(slot: .video_record_2))
            if ApplicationController.TEST_ROW_TOP {
                rowsVideoRecord.append(generateRow(slot: .top_Test))
            }
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test))
            }
        } else {
            rowsVideoRecord.append(generateRow(slot: .video_record_1))
            rowsVideoRecord.append(generateRow(slot: .video_record_2))
            if ApplicationController.TEST_ROW_TOP {
                rowsVideoRecord.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsVideoRecord.append(generateRow(slot: .bottom_Test))
            }
        }
        
        if Device.isPad {
            rowsVideoExport.append(generateRow(slot: .video_export_1))
            rowsVideoExport.append(generateRow(slot: .video_export_2))
            rowsVideoExport.append(generateRow(slot: .video_export_3))
            if ApplicationController.TEST_ROW_TOP {
                rowsVideoExport.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsVideoExport.append(generateRow(slot: .bottom_Test))
            }
        } else {
            rowsVideoExport.append(generateRow(slot: .video_export_1))
            rowsVideoExport.append(generateRow(slot: .video_export_2))
            rowsVideoExport.append(generateRow(slot: .video_export_3))
            rowsVideoExport.append(generateRow(slot: .video_export_4))
            if ApplicationController.TEST_ROW_TOP {
                rowsVideoExport.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsVideoExport.append(generateRow(slot: .bottom_Test))
            }
        }
        
        if Device.isPad {
            rowsZoom.append(generateRow(slot: .zoom_1))
            rowsZoom.append(generateRow(slot: .zoom_2))
            rowsZoom.append(generateRow(slot: .zoom_3))
            if ApplicationController.TEST_ROW_TOP {
                rowsZoom.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsZoom.append(generateRow(slot: .bottom_Test))
            }
        } else {
            rowsZoom.append(generateRow(slot: .zoom_1))
            rowsZoom.append(generateRow(slot: .zoom_2))
            rowsZoom.append(generateRow(slot: .zoom_3))
            rowsZoom.append(generateRow(slot: .zoom_4))
            if ApplicationController.TEST_ROW_TOP {
                rowsZoom.append(generateRow(slot: .top_Test))
            }
            
            if ApplicationController.TEST_ROW_BOTTOM {
                rowsZoom.append(generateRow(slot: .bottom_Test))
            }
        }
        
        // TODO: These need to be clones, not the original nodes.
        if Device.isPad {
            //allPossibleRowBluePrints.append(getRowBluePrintMainControlsStandardPad())
            //allPossibleRowBluePrints.append(getRowBluePrintMainControlsViewPad())
            //allPossibleRowBluePrints.append(getRowBluePrintMainControlsWeightsPad())
            
        } else {
            
        }
        
        /*
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Primary_Standard_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Primary_Weights_Pad())
        
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Jiggles_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Jiggles_Pad())
        
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Points_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Points_Pad())
        
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Weights_Affine_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Weights_Affine_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Weights_Points_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Weights_Points_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Weights_Center_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary1_Weights_Center_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Weights_Affine_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Weights_Points_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Weights_Points_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Weights_Center_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_Secondary2_Weights_Center_Swivel_Pad())
        
        
        
                
        
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Jiggles_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Jiggles_Pad())
        
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Points_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Points_Pad())
        
        
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Weights_Affine_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Weights_Affine_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Weights_Points_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Weights_Points_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Weights_Center_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary1_Weights_Center_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Weights_Affine_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Weights_Points_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Weights_Points_Swivel_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Weights_Center_Regular_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_Secondary2_Weights_Center_Swivel_Pad())
        
        
        allPossibleRowBluePrints.append(getRowBluePrint_Zoom1_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Zoom2_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_Zoom3_Pad())
        
        allPossibleRowBluePrints.append(getRowBluePrint_VideoRecord1_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_VideoRecord2_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_VideoExport1_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_VideoExport2_Pad())
        allPossibleRowBluePrints.append(getRowBluePrint_VideoExport3_Pad())
        
        
        //allPossibleRowBluePrintsGraphSideMenu.append(getRowBluePrintGraphSideMenu1())
        //allPossibleRowBluePrintsGraphSideMenu.append(getRowBluePrintGraphSideMenu2())
        //allPossibleRowBluePrintsGraphSideMenu.append(getRowBluePrintGraphSideMenu3())
        //allPossibleRowBluePrintsGraphSideMenu.append(getRowBluePrintGraphSideMenu4())
        
        for possibleRowBluePrint in allPossibleRowBluePrintsGraphSideMenu {
            let rowStackingCategoryCalculator = RowStackingCategoryCalculator(orientation: orientation,
                                                                              rowBluePrint: possibleRowBluePrint)
            rowStackingCategoryCalculatorsGraphSideMenu.append(rowStackingCategoryCalculator)
        }
        
        //rowStackingCategoryCalculatorsGraphSideMenu
        
        
        for possibleRowBluePrint in allPossibleRowBluePrints {
            let rowStackingCategoryCalculator = RowStackingCategoryCalculator(orientation: orientation,
                                                                              rowBluePrint: possibleRowBluePrint)
            rowStackingCategoryCalculators.append(rowStackingCategoryCalculator)
        }
        
        
        
        let graphSideMenuWidth = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
        layoutStackingCategoryGraphSideMenu = calculateLayoutStackingCategory(width: graphSideMenuWidth,
                                                                              height: layoutRelay.rowHeight,
                                                                              categories: checkLayoutStackingCategories,
                                                                              calculators: rowStackingCategoryCalculatorsGraphSideMenu)
        
        calculateLayoutStackingCategoriesAndSliderFlavor(width: layoutRelay.menuWidthWithSafeArea - (layoutRelay.safeAreaLeft + layoutRelay.safeAreaRight),
                                                         height: layoutRelay.rowHeight)
         */
        
        // So many of the rows... Video Record, Video Export, Zoom, Graph...
        // Only need to be slotted one time... These do not change content...
        
        let interfaceConfiguration = getCurrentInterfaceConfiguration()
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsGraphSideMenu,
                       widthSource: .graphSideMenu)
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsZoom,
                       widthSource: .standard)
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsVideoExport,
                       widthSource: .standard)
        snapRowContent(configuration: interfaceConfiguration,
                       toolRows: rowsVideoRecord,
                       widthSource: .standard)
        
        let graphSideMenuWidth = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
        for row in rowsGraphSideMenu {
            row.layout(orientation: orientation,
                       menuWidthWithSafeArea: graphSideMenuWidth,
                       height: layoutRelay.rowHeight,
                       safeAreaLeft: 0,
                       safeAreaRight: 0)
        }
        
        publisherLinkUp()
    }
    
    var resetZoomActiveUpdateCancellable: AnyCancellable?
    var weightCurveGraphEnabledUpdateCancellable: AnyCancellable?
    var jigglesDidChangeCancellable: AnyCancellable?
    
    var createJiggleCentersModificationUpdateCancellable: AnyCancellable?
    var createGuideCentersModificationUpdateCancellable: AnyCancellable?
    
    var createJigglesStandardUpdateCancellable: AnyCancellable?
    var createJigglesDrawingUpdateCancellable: AnyCancellable?
    var createPointsUpdateCancellable: AnyCancellable?
    var removePointsUpdateCancellable: AnyCancellable?
    var createWeightRingsStandardUpdateCancellable: AnyCancellable?
    var createWeightRingsDrawingUpdateCancellable: AnyCancellable?
    var createWeightRingPointsUpdateCancellable: AnyCancellable?
    var removeWeightRingPointsUpdateCancellable: AnyCancellable?
    var selectedJiggleDataUpdateCancellable: AnyCancellable?
    
    func publisherLinkUp() {
        
        jigglesDidChangeCancellable = jiggleViewModel
            .jiggleDocument
            .jigglesDidChangePublisher
            .sink { [weak self] in
                if let self = self {
                    self.handleJigglesDidChange()
                }
            }
        
        resetZoomActiveUpdateCancellable = jiggleViewModel
            .resetZoomActiveUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleResetZoomActiveDidChange()
                }
            }
        
        /*
        weightCurveGraphEnabledUpdateCancellable = jiggleViewModel
            .weightCurveGraphEnabledUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleWeightCurveGraphEnabledDidChange()
                }
            }
        */
        
        selectedJiggleDataUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .selectedJiggleDataUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleSelectedJiggleDidChange()
                }
            }
        
        createJiggleCentersModificationUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createJiggleCentersModificationUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateJiggleCentersModificationDidChange()
                }
            }
        
        createGuideCentersModificationUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createGuideCentersModificationUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateGuideCentersModificationDidChange()
                }
            }
        
        createJigglesStandardUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createJigglesStandardUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateJiggleStandardDidChange()
                }
            }
        
        createJigglesDrawingUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createJigglesDrawingUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateJiggleDrawingDidChange()
                }
            }
        
        createPointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createPointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreatePointsDidChange()
                }
            }
        
        removePointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .removePointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleRemovePointsDidChange()
                }
            }
        
        createWeightRingsStandardUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createWeightRingsStandardUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateWeightRingsStandardDidChange()
                }
            }
        
        createWeightRingsDrawingUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createWeightRingsDrawingUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateWeightRingsDrawingDidChange()
                }
            }
        
        createWeightRingPointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .createWeightRingPointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleCreateWeightRingPointsDidChange()
                }
            }
        
        removeWeightRingPointsUpdateCancellable = jiggleViewModel
            .jiggleDocument
            .removeWeightRingPointsUpdatePublisher
            .sink { [weak self] _ in
                if let self = self {
                    self.handleRemoveWeightRingPointsDidChange()
                }
            }
    }
    
    static func getSpacerToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        return getSpacerToolNode(neighborTypeLeft: neighborTypeLeft,
                                 neighborTypeRight: neighborTypeRight,
                                 defaultWidth: 0)
    }
    
    static func getSpacerToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?,
                                  defaultWidth: Int) -> ToolNode {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            return getSpacerToolNode(neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight,
                                     orientation: jiggleDocument.orientation,
                                     defaultWidth: defaultWidth)
        } else if let rootViewModel = ApplicationController.rootViewModel {
            return getSpacerToolNode(neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight,
                                     orientation: rootViewModel.orientation,
                                     defaultWidth: defaultWidth)
        } else {
            return getSpacerToolNode(neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight,
                                     orientation: .portrait,
                                     defaultWidth: defaultWidth)
        }
    }
    
    static func getSpacerToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?,
                                  orientation: Orientation,
                                  defaultWidth: Int) -> ToolNode {
        ToolNode(id: getToolNodeID(),
                 element: .spacer,
                 flex: .spacer(.init(defaultWidth: defaultWidth)),
                 magicalViewModel: MagicalViewModel(orientation: orientation),
                 neighborTypeLeft: neighborTypeLeft,
                 neighborTypeRight: neighborTypeRight)
    }
    
    static func getFavoringOneLineLabelToolNode(orientation: Orientation,
                                  minimumWidth: Int,
                                  text: String,
                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let configuration = ToolInterfaceElementFavoringOneLineLabelConfiguration(orientation: orientation,
                                                                                  text: text)
        let viewModel = MagicalFavoringOneLineLabelViewModel(orientation: orientation,
                                                             favoringOneLineLabelConfiguration: configuration)
        
        let standardPaddingLeft = FavoringOneLineLabelLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                     flavor: .long,
                                                                                     squeeze: .standard,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let standardPaddingRight = FavoringOneLineLabelLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                       flavor: .long,
                                                                                       squeeze: .standard,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        let oneLineWidthPadded = configuration.oneLineWidth + standardPaddingLeft + standardPaddingRight
        let flexData = FlexFavoringOneLineLabelData(minimumWidth: minimumWidth,
                                                    twoLineWidth: configuration.twoLineWidth,
                                                    oneLineWidth: configuration.oneLineWidth,
                                                    oneLineWidthPadded: oneLineWidthPadded)
        
        return ToolNode(id: getToolNodeID(),
                        element: .favoringOneLineLabel,
                        flex: .favoringOneLineLabel(flexData),
                        magicalViewModel: viewModel,
                        neighborTypeLeft: neighborTypeLeft,
                        neighborTypeRight: neighborTypeRight)
    }
    
    //var menuWidthWithSafeArea = 320
    //var rowHeight = 44
    //var safeAreaLeft = 0
    //var safeAreaRight = 0
    
    func layoutAllRowsPhone(menuWidthWithSafeArea: Int, rowHeight: Int, safeAreaLeft: Int, safeAreaRight: Int) {
        if menuWidthWithSafeArea != layoutRelay.menuWidthWithSafeArea ||
            rowHeight != layoutRelay.rowHeight ||
            safeAreaLeft != layoutRelay.safeAreaLeft ||
            safeAreaRight != layoutRelay.safeAreaRight {
            
            layoutRelay.menuWidthWithSafeArea = menuWidthWithSafeArea
            layoutRelay.rowHeight = rowHeight
            layoutRelay.safeAreaLeft = safeAreaLeft
            layoutRelay.safeAreaRight = safeAreaRight
            
            print("layoutAllRowsPhone(menuWidthWithSafeArea: \(menuWidthWithSafeArea), safeAreaLeft: \(safeAreaLeft), safeAreaRight: \(safeAreaRight))")
            
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
    
    func layoutAllRowsTablet(menuWidthWithSafeArea: Int, rowHeight: Int, safeAreaLeft: Int, safeAreaRight: Int) {

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
    
    func getRowBluePrintEmpty() -> RowBluePrint {
        RowBluePrint(nodes: [], configuration: .empty)
    }
    
    func getRowBluePrint_Top_Secondary1_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .top_Secondary1_Empty)
    }
    
    func getRowBluePrint_Top_Secondary2_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .top_Secondary2_Empty)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .bottom_Secondary2_Empty)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Empty() -> RowBluePrint {
        return RowBluePrint(nodes: [], configuration: .bottom_Secondary1_Empty)
    }
    
    func getRowBluePrintVideoRecord() -> RowBluePrint {
        let nodes = [
            getRecordCancelTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getRecordMovieTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
    
        return RowBluePrint(nodes: nodes, configuration: .video_record_1, centerPinnedElement: nil)
    }
    
    func getRowBluePrintVideoExport1() -> RowBluePrint {
        let nodes = [
            getExitRecordModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getMainMenuTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_1, centerPinnedElement: nil)
    }
    
    func getRowBluePrintVideoExport2() -> RowBluePrint {
        let nodes = [
            getTwistEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: .checkBox, neighborTypeRight: .textIconButton),
            getMainMenuTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .video_export_2, centerPinnedElement: nil)
    }
    
    
    func getRowBluePrintZoom1() -> RowBluePrint {
        let nodes = [
            getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            Self.getSpacerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getRecordMovieTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil)
        ]
    
        return RowBluePrint(nodes: nodes, configuration: .zoom_1, centerPinnedElement: nil)
    }
    
    func getRowBluePrintZoom2() -> RowBluePrint {
        let nodes = [
            getZoomAmountSliderToolNode(widthCategory: .fullWidth, neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
    
        return RowBluePrint(nodes: nodes, configuration: .zoom_2, centerPinnedElement: nil)
    }
    
    func getRowBluePrintZoom3() -> RowBluePrint {
        let nodes = [
            getExitZoomModeTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            Self.getSpacerToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
            getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
            getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .zoom_3, centerPinnedElement: nil)
    }
    
    var isBlocked: Bool {
        
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
    
    var isBlockedExceptForHistory: Bool {
        
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

                if jiggleViewController.padDraggableMenu.standardContainerView.isGraphModeAnimating {
                    print("Action Blocked - standardView.isGraphModeAnimating")
                    return true
                }
                
            } else {
                
                if jiggleViewController.phoneTopMenu.isModeAnimating {
                    print("Action Blocked - isModeAnimating")
                    return true
                }

                if jiggleViewController.phoneTopMenu.standardContainerView.isGraphModeAnimating {
                    print("Action Blocked - standardView.isGraphModeAnimating")
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
        if jiggleViewModel.isDisplayTransitionActive {
            return true
        }
        return false
    }
    
    func publishDarkModeDidChange() {
        darkModeDidChangePublisher.send(())
    }
    
    func snapRowContent(configuration: any InterfaceConfigurationConforming,
                        toolRows: [ToolRow],
                        widthSource: ToolRowViewContent.WidthSource) {
        for toolRow in toolRows {
            snapRowContent(configuration: configuration,
                           toolRow: toolRow,
                           widthSource: widthSource)
        }
    }
    
    func animateRowContent_Step1(configuration: any InterfaceConfigurationConforming,
                                 toolRows: [ToolRow],
                                 widthSource: ToolRowViewContent.WidthSource,
                                 reversed: Bool) {
        for toolRow in toolRows {
            animateRowContent_Step1(configuration: configuration,
                                    toolRow: toolRow,
                                    widthSource: widthSource,
                                    reversed: reversed)
        }
    }
    
    func animateRowContent_Step2(configuration: any InterfaceConfigurationConforming,
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
    
    func snapRowContent(configuration: any InterfaceConfigurationConforming,
                        toolRow: ToolRow,
                        widthSource: ToolRowViewContent.WidthSource) {
        
        let width: Int
        switch widthSource {
        case .standard:
            width = layoutRelay.menuWidthWithSafeArea
        case .graphSideMenu:
            width = ToolInterfaceTheme.getGraphSideMenuWidth(orientation: orientation)
        }
        
        if let bluePrint = getRowBluePrint(slot: toolRow.slot,
                                           configuration: configuration,
                                           orientation: orientation) {
            if toolRow.configuration != bluePrint.configuration {
                toolRow.configuration = bluePrint.configuration
                toolRow.setNodes_NotAnimated(bluePrint.nodes,
                                             orientation: orientation,
                                             menuWidthWithSafeArea: width,
                                             height: layoutRelay.rowHeight,
                                             safeAreaLeft: layoutRelay.safeAreaLeft,
                                             safeAreaRight: layoutRelay.safeAreaRight,
                                             centerPinnedElement: bluePrint.centerPinnedElement)
            }
        } else {
            if toolRow.configuration != .empty {
                toolRow.configuration = .empty
                toolRow.setNodes_NotAnimated([],
                                             orientation: orientation,
                                             menuWidthWithSafeArea: width,
                                             height: layoutRelay.rowHeight,
                                             safeAreaLeft: layoutRelay.safeAreaLeft,
                                             safeAreaRight: layoutRelay.safeAreaRight,
                                             centerPinnedElement: nil)
            }
        }
    }
    
    func animateRowContent_Step1(configuration: any InterfaceConfigurationConforming,
                                 toolRow: ToolRow,
                                 widthSource: ToolRowViewContent.WidthSource,
                                 reversed: Bool) {
        
        if let bluePrint = getRowBluePrint(slot: toolRow.slot,
                                           configuration: configuration,
                                           orientation: orientation) {
            if toolRow.configuration != bluePrint.configuration {
                toolRow.setNodes_AnimatedStep1(bluePrint.nodes,
                                               orientation: orientation,
                                               reversed: reversed,
                                               menuWidthWithSafeArea: layoutRelay.menuWidthWithSafeArea,
                                               height: layoutRelay.rowHeight,
                                               safeAreaLeft: layoutRelay.safeAreaLeft,
                                               safeAreaRight: layoutRelay.safeAreaRight,
                                               centerPinnedElement: bluePrint.centerPinnedElement)
            }
        } else {
            if toolRow.configuration != .empty {
                toolRow.setNodes_AnimatedStep1([],
                                               orientation: orientation,
                                               reversed: reversed,
                                               menuWidthWithSafeArea: layoutRelay.menuWidthWithSafeArea,
                                               height: layoutRelay.rowHeight,
                                               safeAreaLeft: layoutRelay.safeAreaLeft,
                                               safeAreaRight: layoutRelay.safeAreaRight,
                                               centerPinnedElement: nil)
            }
        }
    }
    
    func animateRowContent_Step2(configuration: any InterfaceConfigurationConforming,
                                 toolRow: ToolRow,
                                 reversed: Bool,
                                 time: CGFloat) {

        if let bluePrint = getRowBluePrint(slot: toolRow.slot,
                                           configuration: configuration,
                                           orientation: orientation) {
            if toolRow.configuration != bluePrint.configuration {
                toolRow.configuration = bluePrint.configuration
                toolRow.setNodes_AnimatedStep2(reversed: reversed,
                                               time: time)
            }
        } else {
            if toolRow.configuration != .empty {
                toolRow.configuration = .empty
                toolRow.setNodes_AnimatedStep2(reversed: reversed,
                                               time: time)
            }
        }
    }
    
    func getCurrentInterfaceConfiguration() -> any InterfaceConfigurationConforming {
        if Device.isPad {
            return getCurrentInterfaceConfigurationPad()
        } else {
            return getCurrentInterfaceConfigurationPhone()
        }
    }
    
    func getCurrentInterfaceConfigurationPad() -> InterfaceConfigurationPad {
        var result = InterfaceConfigurationPad()
        if let jiggleViewModel = jiggleViewModel {
            result.isExpanded = jiggleViewModel.isPadMenuExpanded
            result.isVideoRecordEnabled = jiggleViewModel.isVideoRecordEnabled
            result.isVideoExportEnabled = jiggleViewModel.isVideoExportEnabled
            result.isGuidesEnabled = jiggleViewModel.jiggleDocument.isGuidesEnabled
            result.isGraphEnabled = jiggleViewModel.isGraphEnabled
            result.isZoomEnabled = jiggleViewModel.isZoomEnabled
            result.documentMode = jiggleViewModel.jiggleDocument.documentMode
            result.editMode = jiggleViewModel.jiggleDocument.editMode
            result.weightMode = jiggleViewModel.jiggleDocument.weightMode
            result.animationMode = jiggleViewModel.jiggleDocument.animationMode
            result.viewMode = jiggleViewModel.jiggleDocument.viewMode
        }
        return result
    }
    
    func getCurrentInterfaceConfigurationPhone() -> InterfaceConfigurationPhone {
        var result = InterfaceConfigurationPhone()
        if let jiggleViewModel = jiggleViewModel {
            result.isExpandedTop = jiggleViewModel.isPhoneTopMenuExpanded
            result.isExpandedBottom = jiggleViewModel.isPhoneBottomMenuExpanded
            result.isVideoRecordEnabled = jiggleViewModel.isVideoRecordEnabled
            result.isVideoExportEnabled = jiggleViewModel.isVideoExportEnabled
            result.isGuidesEnabled = jiggleViewModel.jiggleDocument.isGuidesEnabled
            result.isGraphEnabled = jiggleViewModel.isGraphEnabled
            result.isZoomEnabled = jiggleViewModel.isZoomEnabled
            result.documentMode = jiggleViewModel.jiggleDocument.documentMode
            result.editMode = jiggleViewModel.jiggleDocument.editMode
            result.weightMode = jiggleViewModel.jiggleDocument.weightMode
            result.animationMode = jiggleViewModel.jiggleDocument.animationMode
            result.viewMode = jiggleViewModel.jiggleDocument.viewMode
        }
        return result
    }
    
}
