//
//  SexyStepperLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import UIKit

struct SexyStepperLayout: LayoutScheme {
    
    
    static func getValuePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 3
        case .standard:
            return 5
        case .relaxed:
            return 9
        }
    }
    static func getValuePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 3
        case .standard:
            return 5
        case .relaxed:
            return 9
        }
    }
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 8
        }
    }
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 8
        }
    }
    
    static func getContextCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 8
        } else {
            return 6
        }
    }
    
    static func getValueLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        7
    }
    
    static func getValueLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        11
    }
    
    static func getIncrementPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        6
    }
    
    static func getIncrementPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        6
    }
    
    static func getDecrementPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        6
    }
    
    static func getDecrementPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        6
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
    
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
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
    
    static func getTextIconAndIncrementAndDecrementAndNameLabelWidthLongOnly(nameLabelWidth: Int,
                                                                             nameLabelNumberOfLines: Int,
                                                                             iconPack: TextIconPackable,
                                                                             incrementPack: TextIconPackable,
                                                                             decrementPack: TextIconPackable,
                                                                             orientation: Orientation,
                                                                             flavor: LayoutSchemeFlavor,
                                                                             squeeze: LayoutSchemeSqueeze) -> Int {
        
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: flavor,
                                        numberOfLines: nameLabelNumberOfLines,
                                        isDarkMode: false,
                                        isEnabled: true)
        let increment = incrementPack.getTextIcon(orientation: orientation,
                                                  layoutSchemeFlavor: flavor,
                                                  numberOfLines: nameLabelNumberOfLines,
                                                  isDarkMode: false,
                                                  isEnabled: true)
        let decrement = decrementPack.getTextIcon(orientation: orientation,
                                                  layoutSchemeFlavor: flavor,
                                                  numberOfLines: nameLabelNumberOfLines,
                                                  isDarkMode: false,
                                                  isEnabled: true)
        
        let nameLabelPaddingLeft = Self.getNameLabelPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let nameLabelPaddingRight = Self.getNameLabelPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let iconWidth = icon.width
        let iconPaddingLeft = Self.getIconPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingRight = Self.getIconPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let incrementWidth = increment.width
        let incrementPaddingLeft = Self.getIncrementPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let incrementPaddingRight = Self.getIncrementPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let decrementWidth = decrement.width
        let decrementPaddingLeft = Self.getDecrementPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let decrementPaddingRight = Self.getDecrementPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        let width3 = incrementWidth + incrementPaddingLeft + incrementPaddingRight
        let width4 = decrementWidth + decrementPaddingLeft + decrementPaddingRight
        
        return width1 + width2 + width3 + width4
    }
    
    static func getTextIconAndIncrementAndDecrementAndNameLabelWidthWithUniversalPadding(nameLabelWidth: Int,
                                                                                         nameLabelNumberOfLines: Int,
                                                                                         iconPack: TextIconPackable,
                                                                                         incrementPack: TextIconPackable,
                                                                                         decrementPack: TextIconPackable,
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
        
        var result = getTextIconAndIncrementAndDecrementAndNameLabelWidthLongOnly(nameLabelWidth: nameLabelWidth,
                                                                                  nameLabelNumberOfLines: nameLabelNumberOfLines,
                                                                                  iconPack: iconPack,
                                                                                  incrementPack: incrementPack,
                                                                                  decrementPack: decrementPack,
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

extension SexyStepperLayout {
    
    static func getValueLabelLineHeight(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        let font = getValueLabelFont(orientation: orientation, flavor: flavor)
        let lineHeight = Int(font.lineHeight + 1.5)
        return lineHeight
    }
    
    static func getValueLabelTextWidth(line1: String?,
                                       line2: String?,
                                       orientation: Orientation,
                                       flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getValueLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, line2: line2, font: font)
    }
    
    static func getValueLabelTextWidth(line1: String?,
                                       orientation: Orientation,
                                       flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getValueLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, font: font)
    }
}
