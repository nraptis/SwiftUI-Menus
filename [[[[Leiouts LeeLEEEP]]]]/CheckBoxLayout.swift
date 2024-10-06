//
//  CheckBoxLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import UIKit

struct CheckBoxLayout: LayoutScheme {
    
    static func getHeroPaddingTopStacked(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2 + 3
        } else {
            return 1 + 3
        }
    }
    
    static func getSlavePaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 30
        case .standard:
            return 32
        case .relaxed:
            return 40
        }
    }
    
    
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 13.0, weight: .semibold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 9.0, weight: .semibold, width: .compressed)
                }
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .compressed)
                }
            }
        }
    }
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        Device.isPad ? 3 : 2
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        Device.isPad ? 3 : 2
    }
    
    static func getButtonUniversalPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 3
        } else {
            return 2
        }
    }
    
    static func getButtonUniversalPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 3
        } else {
            return 2
        }
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard, .relaxed:
                return 6
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard, .relaxed:
                return 4
            }
        }
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard, .relaxed:
                return 6
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard, .relaxed:
                return 4
            }
        }
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getCheckBoxPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getCheckBoxPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 12
        } else {
            if orientation.isLandscape {
                return 8
            } else {
                return 10
            }
        }
    }
    
    static func getLineThickness(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTextIconAndCheckBoxAndNameLabelWidthLongOnly(nameLabelWidth: Int,
                                                              nameLabelNumberOfLines: Int,
                                                              iconPack: TextIconPackable,
                                                              orientation: Orientation,
                                                              flavor: LayoutSchemeFlavor,
                                                              squeeze: LayoutSchemeSqueeze) -> Int {
        
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: flavor,
                                        numberOfLines: nameLabelNumberOfLines,
                                        isDarkMode: false,
                                        isEnabled: true)
        let checkBox = FramedLongIconLibrary.checkBoxCheck.getTextIcon(orientation: orientation,
                                                                              layoutSchemeFlavor: flavor,
                                                                              numberOfLines: 1,
                                                                              isDarkMode: false,
                                                                              isEnabled: true)
        
        let nameLabelPaddingLeft = Self.getNameLabelPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let nameLabelPaddingRight = Self.getNameLabelPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingLeft = Self.getIconPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingRight = Self.getIconPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let checkBoxPaddingLeft = Self.getCheckBoxPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let checkBoxPaddingRight = Self.getCheckBoxPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let iconWidth = icon.width
        let checkBoxWidth = checkBox.width
        
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        let width3 = checkBoxWidth + checkBoxPaddingLeft + checkBoxPaddingRight
        
        return width1 + width2 + width3
    }
    
    static func getTextIconAndCheckBoxAndNameLabelWidthWithUniversalPadding(nameLabelWidth: Int,
                                                                 nameLabelNumberOfLines: Int,
                                                                 iconPack: TextIconPackable,
                                                                 orientation: Orientation,
                                                                 flavor: LayoutSchemeFlavor,
                                                                 squeeze: LayoutSchemeSqueeze,
                                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        
        let universalPaddingLeft = getUniversalPaddingLeft(orientation: orientation,
                                                           flavor: flavor,
                                                           squeeze: squeeze,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        let universalPaddingRight = getUniversalPaddingRight(orientation: orientation,
                                                             flavor: flavor,
                                                             squeeze: squeeze,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        
        let buttonUniversalPaddingLeft = getButtonUniversalPaddingLeft(orientation: orientation,
                                                                       flavor: flavor,
                                                                       squeeze: squeeze)
                
        let buttonUniversalPaddingRight = getButtonUniversalPaddingRight(orientation: orientation,
                                                                         flavor: flavor,
                                                                         squeeze: squeeze)
        
        var result = getTextIconAndCheckBoxAndNameLabelWidthLongOnly(nameLabelWidth: nameLabelWidth,
                                                                   nameLabelNumberOfLines: nameLabelNumberOfLines,
                                                                   iconPack: iconPack,
                                                                   orientation: orientation,
                                                                   flavor: flavor,
                                                                   squeeze: squeeze)
        
        result += buttonUniversalPaddingLeft
        result += buttonUniversalPaddingRight
        
        result += universalPaddingLeft
        result += universalPaddingRight
        
        return result
    }
    
}

