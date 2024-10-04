//
//  CheckBoxLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import UIKit

struct CheckBoxLayout: LayoutScheme {
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
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
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
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
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
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
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if Device.isPad {
            return 2
        } else {
            return 1
        }
    }
    
    static func getButtonUniversalPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getButtonUniversalPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        /*
        if Device.isPad {
            return 11 + 2
        } else {
            if orientation.isLandscape {
                return 7 + 2
            } else {
                return 8 + 2
            }
        }
        */
        0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            if flavor.isLong {
                switch squeeze {
                case .squeezed:
                    return 6
                case .standard, .relaxed:
                    return 8
                }
            }
        } else {
            if flavor.isLong {
                switch squeeze {
                case .squeezed:
                    return 4
                case .standard, .relaxed:
                    return 6
                }
            }
        }
        return 0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if Device.isPad {
            if flavor.isStacked {
                return 6 // Final, 6
            }
        } else {
            if flavor.isStacked {
                return 4 // Final, 4
            }
        }
        return 0
    }
    
    static func getCheckBoxWidth(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 36
        } else {
            switch orientation {
            case .landscape:
                return 26
            case .portrait:
                return 30
            }
        }
    }
    
    static func getCheckBoxPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 13
        } else {
            if orientation.isLandscape {
                return 9
            } else {
                return 10
            }
        }
    }
    
    static func getCheckBoxPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 13
        } else {
            if orientation.isLandscape {
                return 9
            } else {
                return 10
            }
        }
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
    
    /*
    static func getCornerRadiusInner(orientation: Orientation) -> Int {
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
    */
    
    static func getLineThickness(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getCheckBoxCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 8
        } else {
            if orientation.isLandscape {
                return 5
            } else {
                return 6
            }
        }
    }
    
    static func getCheckBoxLineThickness(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: Int,
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
        
        var result = getTextIconAndNameLabelWidth(nameLabelWidth: nameLabelWidth,
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
