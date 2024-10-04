//
//  RowStackingCategoryCalculator.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

class RowStackingCategoryCalculator {
    
    let orientation: Orientation
    let nodes: [ToolNode]
    let slot: ToolRowSlot
    init(orientation: Orientation,
         rowBluePrint: RowBluePrint,
         slot: ToolRowSlot) {
        self.orientation = orientation
        self.nodes = rowBluePrint.nodes
        self.slot = slot
    }
    
    init(orientation: Orientation,
         nodes: [ToolNode],
         slot: ToolRowSlot) {
        self.orientation = orientation
        self.nodes = nodes
        self.slot = slot
    }
    
    func getStandardWidth(node: ToolNode,
                          width: Int,
                          layoutStackingCategory: ToolInterfaceLayoutStackingCategory) -> Int {
        switch node.flex {
        case .sexyStepper(let flexSexyStepperData):
            if layoutStackingCategory.isSmall {
                return flexSexyStepperData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexSexyStepperData.standardWidthMedium
            } else {
                return flexSexyStepperData.standardWidthLarge
            }
        case .enterMode(let flexEnterModeData):
            if layoutStackingCategory.isSmall {
                return flexEnterModeData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexEnterModeData.standardWidthMedium
            } else {
                return flexEnterModeData.standardWidthLarge
            }
        case .exitMode(let flexExitModeData):
            if layoutStackingCategory.isSmall {
                return flexExitModeData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexExitModeData.standardWidthMedium
            } else {
                return flexExitModeData.standardWidthLarge
            }
        case .sexyCheckBox(let flexSexyCheckBoxData):
            if layoutStackingCategory.isSmall {
                return flexSexyCheckBoxData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexSexyCheckBoxData.standardWidthMedium
            } else {
                return flexSexyCheckBoxData.standardWidthLarge
            }
        case .favoringOneLineLabel(let flexFavoringOneLineLabelData):
            return flexFavoringOneLineLabelData.oneLineWidthPadded
        case .fixed(let fixedWidth):
            return fixedWidth
        case .spacer(let flexSpacerData):
            return flexSpacerData.defaultWidth
        case .dividerSpacerDivider(let flexDividerSpacerDividerData):
            return flexDividerSpacerDividerData.standardWidth
        case .iconButton(let flexIconButtonData):
            return flexIconButtonData.standardWidth
        case .textIconButton(let flexTextIconButtonData):
            if layoutStackingCategory.isTextIconButtonLong {
                return flexTextIconButtonData.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexTextIconButtonData.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexTextIconButtonData.standardWidthStackedMedium
                } else {
                    return flexTextIconButtonData.standardWidthStackedLarge
                }
            }
        case .sexyButton(let flexSexyButtonData):
            if layoutStackingCategory.isSmall {
                return flexSexyButtonData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexSexyButtonData.standardWidthMedium
            } else {
                return flexSexyButtonData.standardWidthLarge
            }
        case .greenButton(let flexGreenButtonData):
            return flexGreenButtonData.standardWidth
        case .segment(let flexSegmentData):
            if layoutStackingCategory.isSegmentLong {
                return flexSegmentData.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexSegmentData.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexSegmentData.standardWidthStackedMedium
                } else {
                    return flexSegmentData.standardWidthStackedLarge
                }
            }
        case .mainTab(let flexMainTabData):
            if layoutStackingCategory.isSmall {
                return flexMainTabData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexMainTabData.standardWidthMedium
            } else {
                return flexMainTabData.standardWidthLarge
            }
        case .createSwatch(let flexCreateSwatchData):
            if layoutStackingCategory.isSmall {
                return flexCreateSwatchData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexCreateSwatchData.standardWidthMedium
            } else {
                return flexCreateSwatchData.standardWidthLarge
            }
        case .slider(let flexSliderData):
            switch flexSliderData.widthCategory {
            case .fullWidth:
                return width
            case .stretch:
                if layoutStackingCategory.isSmall {
                    return flexSliderData.standardWidthSmall
                } else if layoutStackingCategory.isMedium {
                    return flexSliderData.standardWidthMedium
                } else {
                    return flexSliderData.standardWidthLarge
                }
            case .halfWidthLeft:
                return (width / 2)
            case .halfWidthRight:
                return (width - (width / 2))
            }
        case .checkBox(let flexCheckBoxData):
            if layoutStackingCategory.isCheckBoxLong {
                return flexCheckBoxData.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexCheckBoxData.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexCheckBoxData.standardWidthStackedMedium
                } else {
                    return flexCheckBoxData.standardWidthStackedLarge
                }
            }
        }
    }
     
    func doesSupportLayoutStackingCategory(layoutStackingCategory: ToolInterfaceLayoutStackingCategory,
                                           width: Int,
                                           height: Int) -> Bool {
        var consumedWidth = 0
        for node in nodes {
            let nodeWidth = getStandardWidth(node: node,
                                             width: width,
                                             layoutStackingCategory: layoutStackingCategory)
            consumedWidth += nodeWidth
        }
        
        if consumedWidth <= width {
            return true
        } else {
            return false
        }
    }
}
