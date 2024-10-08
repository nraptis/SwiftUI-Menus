//
//  ExitModeLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import UIKit

struct ExitModeLayout: LayoutScheme {
    
    static func getHeroPaddingTopStacked(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2 + 3
        } else {
            return 1 + 3
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
    
    static func getAccentPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getAccentPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
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
    
    static func getTextIconAndAccentAndNameLabelWidthLongOnly(nameLabelWidth: Int,
                                                              nameLabelNumberOfLines: Int,
                                                              iconPack: TextIconPackable,
                                                              accentPack: TextIconPackable,
                                                              orientation: Orientation,
                                                              flavor: LayoutSchemeFlavor,
                                                              squeeze: LayoutSchemeSqueeze) -> Int {
        
        let icon = iconPack.getTextIcon(orientation: orientation,
                                        layoutSchemeFlavor: flavor,
                                        numberOfLines: nameLabelNumberOfLines,
                                        isDarkMode: false,
                                        isEnabled: true)
        let accent = accentPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: flavor,
                                            numberOfLines: nameLabelNumberOfLines,
                                            isDarkMode: false,
                                            isEnabled: true)
        
        let nameLabelPaddingLeft = Self.getNameLabelPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let nameLabelPaddingRight = Self.getNameLabelPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingLeft = Self.getIconPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let iconPaddingRight = Self.getIconPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let accentPaddingLeft = Self.getAccentPaddingLeft(orientation: orientation, flavor: flavor, squeeze: squeeze)
        let accentPaddingRight = Self.getAccentPaddingRight(orientation: orientation, flavor: flavor, squeeze: squeeze)
        
        let iconWidth = icon.width
        let accentWidth = accent.width
        
        let width1 = nameLabelWidth + nameLabelPaddingLeft + nameLabelPaddingRight
        let width2 = iconWidth + iconPaddingLeft + iconPaddingRight
        let width3 = accentWidth + accentPaddingLeft + accentPaddingRight
        
        return width1 + width2 + width3
    }
    
    static func getTextIconAndAccentAndNameLabelWidthWithUniversalPadding(nameLabelWidth: Int,
                                                                 nameLabelNumberOfLines: Int,
                                                                 iconPack: TextIconPackable,
                                                                          accentPack: TextIconPackable,
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
        
        var result = getTextIconAndAccentAndNameLabelWidthLongOnly(nameLabelWidth: nameLabelWidth,
                                                                   nameLabelNumberOfLines: nameLabelNumberOfLines,
                                                                   iconPack: iconPack,
                                                                   accentPack: accentPack,
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
