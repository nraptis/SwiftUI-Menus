//
//  ImageImportViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/31/24.
//

import Foundation
import UIKit

@Observable class ImageImportViewModel {
    
    static let orientation = Orientation.landscape
    
    let layoutRelay = ToolInterfaceLayoutRelay()
    
    @ObservationIgnored var allPossibleRowBluePrints = [RowBluePrint]()
    @ObservationIgnored var rowStackingCategoryCalculators = [RowStackingCategoryCalculator]()
    @ObservationIgnored var checkLayoutStackingCategories = ToolInterfaceLayoutStackingCategory.getAllInPriorityOrderExceptLeast()
    
    @ObservationIgnored var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    
    //@ObservationIgnored var layoutSchemeFlavorSliders = LayoutSchemeFlavor.stackedSmall
    
    func calculateLayoutStackingCategories() {
        let contentWidth = layoutRelay.menuWidthWithSafeArea - (layoutRelay.safeAreaLeft + layoutRelay.safeAreaRight)
        layoutStackingCategory = calculateLayoutStackingCategory(width: contentWidth,
                                                                 height: layoutRelay.rowHeight,
                                                                 categories: checkLayoutStackingCategories,
                                                                 calculators: rowStackingCategoryCalculators)
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
    
    @ObservationIgnored var rowsTop = [ToolRow]()
    @ObservationIgnored var rowsBottom = [ToolRow]()
    
    @ObservationIgnored var screenWidth = 0
    @ObservationIgnored var screenHeight = 0
    
    @ObservationIgnored var toolbarHeightTop: Int = 0
    @ObservationIgnored var toolbarHeightBottom: Int = 0
    
    @ObservationIgnored let originalImage: UIImage
    @ObservationIgnored let originalOrientation: Orientation
    
    @MainActor init(originalImage: UIImage,
         originalOrientation: Orientation) {
        self.originalImage = originalImage
        self.originalOrientation = originalOrientation
        ApplicationController.shared.imageImportViewModel = self
        _generateRows()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] ImageImportViewModel")
        }
    }
    
    @MainActor private func _generateRows() {
        
        let _rowHeight = ToolInterfaceTheme.getRowHeight(orientation: ImageImportViewModel.orientation)
        if layoutRelay.rowHeight != _rowHeight {
            layoutRelay.rowHeight = _rowHeight
        }
        
        allPossibleRowBluePrints.append(getRowBluePrint_Top_1())
        allPossibleRowBluePrints.append(getRowBluePrint_Top_2())
        allPossibleRowBluePrints.append(getRowBluePrint_Bottom_1())
        
        for possibleRowBluePrint in allPossibleRowBluePrints {
            let rowStackingCategoryCalculator = RowStackingCategoryCalculator(orientation: ImageImportViewModel.orientation,
                                                                              rowBluePrint: possibleRowBluePrint,
                                                                              slot: .unknown)
            rowStackingCategoryCalculators.append(rowStackingCategoryCalculator)
        }
        
        // So many of the rows... Video Record, Video Export, Zoom, Graph...
        // Only need to be slotted one time... These do not change content...
        
        let _rowTop1 = getRowBluePrint_Top_1()
        let rowTop1 = ToolRow(slot: .unknown)
        rowsTop.append(rowTop1)
        rowTop1.setNodes_NotAnimated(_rowTop1.nodes,
                                     orientation: ImageImportViewModel.orientation,
                                     menuWidthWithSafeArea: layoutRelay.menuWidthWithSafeArea,
                                     height: layoutRelay.rowHeight,
                                     safeAreaLeft: layoutRelay.safeAreaLeft,
                                     safeAreaRight: layoutRelay.safeAreaRight,
                                     centerPinnedElement: _rowTop1.centerPinnedElement)
        
        let _rowTop2 = getRowBluePrint_Top_2()
        let rowTop2 = ToolRow(slot: .unknown)
        rowsTop.append(rowTop2)
        rowTop2.setNodes_NotAnimated(_rowTop2.nodes,
                                     orientation: ImageImportViewModel.orientation,
                                     menuWidthWithSafeArea: layoutRelay.menuWidthWithSafeArea,
                                     height: layoutRelay.rowHeight,
                                     safeAreaLeft: layoutRelay.safeAreaLeft,
                                     safeAreaRight: layoutRelay.safeAreaRight,
                                     centerPinnedElement: _rowTop2.centerPinnedElement)
        
        let _rowBottom1 = getRowBluePrint_Bottom_1()
        let rowBottom1 = ToolRow(slot: .unknown)
        rowsBottom.append(rowBottom1)
        rowBottom1.setNodes_NotAnimated(_rowBottom1.nodes,
                                        orientation: ImageImportViewModel.orientation,
                                        menuWidthWithSafeArea: layoutRelay.menuWidthWithSafeArea,
                                        height: layoutRelay.rowHeight,
                                        safeAreaLeft: layoutRelay.safeAreaLeft,
                                        safeAreaRight: layoutRelay.safeAreaRight,
                                        centerPinnedElement: _rowBottom1.centerPinnedElement)
    }
    
    @MainActor func getRowBluePrint_Top_1() -> RowBluePrint {
        let cropToFrameText = GeneralStringLibrary.cropToFrame() ?? ""
        let centerPinnedNode = ToolInterfaceViewModel.getFavoringOneLineLabelToolNode(orientation: ImageImportViewModel.orientation,
                                                                                      minimumWidth: 140,
                                                                                      text: cropToFrameText,
                                                                                      neighborTypeLeft: nil,
                                                                                      neighborTypeRight: nil)
        let nodes = [
            getImageImportBackSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .favoringOneLineLabel),
            ToolInterfaceViewModel.getSpacerToolNode(neighborTypeLeft: nil,
                                                     neighborTypeRight: .favoringOneLineLabel,
                                                     orientation: ImageImportViewModel.orientation,
                                                     defaultWidth: 0),
            centerPinnedNode,
            ToolInterfaceViewModel.getSpacerToolNode(neighborTypeLeft: nil,
                                                     neighborTypeRight: nil,
                                                     orientation: ImageImportViewModel.orientation,
                                                     defaultWidth: 0),
            getResetAspectFitSexyButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .unknown, centerPinnedElement: centerPinnedNode.element)
    }
    
    @MainActor func getRowBluePrint_Top_2() -> RowBluePrint {
        let nodes = [getSnapEdgesEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getSnapRotationEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
                     ToolInterfaceViewModel.getSpacerToolNode(neighborTypeLeft: nil,
                                                              neighborTypeRight: nil,
                                                              orientation: ImageImportViewModel.orientation,
                                                              defaultWidth: 0),
                     getResetAspectFillSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer)
        ]
        return RowBluePrint(nodes: nodes, configuration: .unknown, centerPinnedElement: nil)
    }
    
    @MainActor func getRowBluePrint_Bottom_1() -> RowBluePrint {
        let nodes = [
            getRotateLeftSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getRotateRightSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
            ToolInterfaceViewModel.getSpacerToolNode(neighborTypeLeft: nil,
                                                     neighborTypeRight: .segment,
                                                     orientation: ImageImportViewModel.orientation,
                                                     defaultWidth: 0),
            getCreateSceneGreenButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .unknown, centerPinnedElement: nil)
    }
    
    @MainActor func refreshAllRows() {
        for row in rowsTop {
            row.refreshAllNodes()
        }
        for row in rowsBottom {
            row.refreshAllNodes()
        }
    }
    
    @MainActor func layoutAllRows() {
        layoutAllRows(menuWidthWithSafeArea: layoutRelay.menuWidthWithSafeArea,
                      rowHeight: layoutRelay.rowHeight,
                      safeAreaLeft: layoutRelay.safeAreaLeft,
                      safeAreaRight: layoutRelay.safeAreaRight,
                      isForced: true)
    }
    
    @MainActor func layoutAllRows(menuWidthWithSafeArea: Int,
                       rowHeight: Int,
                       safeAreaLeft: Int,
                       safeAreaRight: Int,
                       isForced: Bool) {
        if menuWidthWithSafeArea != layoutRelay.menuWidthWithSafeArea ||
            rowHeight != layoutRelay.rowHeight ||
            safeAreaLeft != layoutRelay.safeAreaLeft ||
            safeAreaRight != layoutRelay.safeAreaRight ||
            isForced {
            
            layoutRelay.menuWidthWithSafeArea = menuWidthWithSafeArea
            layoutRelay.rowHeight = rowHeight
            layoutRelay.safeAreaLeft = safeAreaLeft
            layoutRelay.safeAreaRight = safeAreaRight
            
            for row in rowsTop {
                row.layout(orientation: ImageImportViewModel.orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
            
            for row in rowsBottom {
                row.layout(orientation: ImageImportViewModel.orientation,
                           menuWidthWithSafeArea: menuWidthWithSafeArea,
                           height: rowHeight,
                           safeAreaLeft: safeAreaLeft,
                           safeAreaRight: safeAreaRight)
            }
        }
    }
}
