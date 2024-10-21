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
            
        case .createSwatch(let flexLongData):
            if layoutStackingCategory.isSmall {
                return flexLongData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexLongData.standardWidthMedium
            } else {
                return flexLongData.standardWidthLarge
            }
            
        case .stepper(let flexConvertible):
            if layoutStackingCategory.isStepperLong {
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
        case .checkBox(let flexConvertible):
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
        case .button(let flexConvertible):
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
            
        
        
        
        
        case .favoringOneLineLabel(let flexFavoringOneLineLabelData):
            return flexFavoringOneLineLabelData.standardOneLineWidth
        case .fixed(let fixedWidth):
            return fixedWidth
        case .spacer(let flexSpacerData):
            return flexSpacerData.defaultWidth
        case .dividerSpacerDivider(let flexDividerSpacerDividerData):
            return flexDividerSpacerDividerData.standardWidth
        case .greenButton(let flexLongData):
            if layoutStackingCategory.isSmall {
                return flexLongData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexLongData.standardWidthMedium
            } else {
                return flexLongData.standardWidthLarge
            }
        case .mainTab(let flexMainTabData):
            if layoutStackingCategory.isSmall {
                return flexMainTabData.standardWidthSmall
            } else if layoutStackingCategory.isMedium {
                return flexMainTabData.standardWidthMedium
            } else {
                return flexMainTabData.standardWidthLarge
            }
        
        case .slider(let flexLongData, let widthCategory):
            switch widthCategory {
            case .fullWidth:
                return width
            case .stretch:
                if layoutStackingCategory.isSmall {
                    return flexLongData.standardWidthSmall
                } else if layoutStackingCategory.isMedium {
                    return flexLongData.standardWidthMedium
                } else {
                    return flexLongData.standardWidthLarge
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
