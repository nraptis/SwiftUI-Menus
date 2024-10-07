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
        case .segment(let flexConvertible):
            if layoutStackingCategory.isSegmentLong {
                return flexConvertible.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexConvertible.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexConvertible.standardWidthStackedMedium
                } else {
                    return flexConvertible.standardWidthStackedLarge
                }
            }
            
        case .enterMode(let flexConvertible):
            if layoutStackingCategory.isModeSwitchLong {
                return flexConvertible.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexConvertible.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexConvertible.standardWidthStackedMedium
                } else {
                    return flexConvertible.standardWidthStackedLarge
                }
            }
        case .exitMode(let flexConvertible):
            if layoutStackingCategory.isModeSwitchLong {
                return flexConvertible.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexConvertible.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexConvertible.standardWidthStackedMedium
                } else {
                    return flexConvertible.standardWidthStackedLarge
                }
            }
        case .sexyCheckBox(let flexConvertible):
            if layoutStackingCategory.isCheckBoxLong {
                return flexConvertible.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexConvertible.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexConvertible.standardWidthStackedMedium
                } else {
                    return flexConvertible.standardWidthStackedLarge
                }
            }
        case .sexyButton(let flexConvertible):
            if layoutStackingCategory.isButtonLong {
                return flexConvertible.standardWidthLong
            } else {
                if layoutStackingCategory.isSmall {
                    return flexConvertible.standardWidthStackedSmall
                } else if layoutStackingCategory.isMedium {
                    return flexConvertible.standardWidthStackedMedium
                } else {
                    return flexConvertible.standardWidthStackedLarge
                }
            }
            
        case .sexyStepper(let flexSexyStepperData):
            if layoutStackingCategory.isSmall {
                return flexSexyStepperData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexSexyStepperData.standardWidthMedium
            } else {
                return flexSexyStepperData.standardWidthLarge
            }
        
        
        
        case .favoringOneLineLabel(let flexFavoringOneLineLabelData):
            return flexFavoringOneLineLabelData.standardOneLineWidth
        case .fixed(let fixedWidth):
            return fixedWidth
        case .spacer(let flexSpacerData):
            return flexSpacerData.defaultWidth
        case .dividerSpacerDivider(let flexDividerSpacerDividerData):
            return flexDividerSpacerDividerData.standardWidth
        case .iconButton(let flexIconButtonData):
            return flexIconButtonData.standardWidth
        
        case .greenButton(let flexLong):
            if layoutStackingCategory.isSmall {
                return flexLong.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexLong.standardWidthMedium
            } else {
                return flexLong.standardWidthLarge
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
