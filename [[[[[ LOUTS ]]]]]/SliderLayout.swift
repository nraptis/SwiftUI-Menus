//
//  SliderLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import UIKit

struct SliderLayout: LayoutScheme {
    
    
    static func getValuePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 5
        } else {
            return 3
        }
        
    }
    static func getValuePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 5
        } else {
            return 3
        }
    }
    
    static func getExtraWidthStandard(orientation: Orientation) -> Int {
        if Device.isPad {
            return 32
        } else {
            return 24
        }
    }
    
    static func getExtraWidthRelaxed(orientation: Orientation) -> Int {
        if Device.isPad {
            return 136
        } else {
            return 96
        }
    }
    
    static func getOutsideBoxPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getOutsideBoxPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getHeroPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        12
    }
    
    static func getHeroPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 5
        } else {
            return 3
        }
    }
    
    static func getPreferredMinimumBarWidth(orientation: Orientation, widthCategory: ToolInterfaceElementSliderWidthCategory) -> Int {
        if Device.isPad {
            switch widthCategory {
            case .fullWidth:
                return 180
            case .halfWidthLeft:
                return 90
            case .halfWidthRight:
                return 90
            case .stretch:
                return 90
            }
        } else {
            switch widthCategory {
            case .fullWidth:
                return 140
            case .halfWidthLeft:
                return 70
            case .halfWidthRight:
                return 70
            case .stretch:
                return 70
            }
        }
    }
    
    static func getThumbDiameterFill(orientation: Orientation) -> Int {
        if Device.isPad {
            return 38
        } else {
            switch orientation {
            case .landscape:
                return 26
            case .portrait:
                return 30
            }
        }
    }
    
    static func getThumbDiameterStroke(orientation: Orientation) -> Int {
        if Device.isPad {
            return 40
        } else {
            switch orientation {
            case .landscape:
                return 28
            case .portrait:
                return 32
            }
        }
    }
    
    static func getBarDiameterFill(orientation: Orientation) -> Int {
        if Device.isPad {
            return 10
        } else {
            switch orientation {
            case .landscape:
                return 6
            case .portrait:
                return 8
            }
        }
    }
    
    static func getBarDiameterStroke(orientation: Orientation) -> Int {
        if Device.isPad {
            return 12
        } else {
            switch orientation {
            case .landscape:
                return 8
            case .portrait:
                return 10
            }
        }
    }
    
    static func getThumbHitBoxWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 54
        } else {
            return 44
        }
    }
    
    static func getCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 6
        } else {
            return 4
        }
    }
    
    // [++] Final
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int {
        if Device.isPad {
            // [++] Final
            return 2
        } else {
            // [++] Final
            return 1
        }
    }
    
    // [++] Final
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int {
        if Device.isPad {
            // [++] Final
            return 2
        } else {
            // [++] Final
            return 1
        }
    }
    
    // [++] Final
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int { 0 }
    
    // [++] Final
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int { 0 }
    
    // [++] Final
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 14.0, weight: .bold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 10.0, weight: .bold, width: .compressed)
                }
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 11.0, weight: .bold, width: .compressed)
                }
            }
        }
    }
    
    // [++] Final
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
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
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold, width: .compressed)
                }
            }
        }
    }
    
    // [++] Final
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        if Device.isPad {
            // [Cool]
            return -3
        } else {
            switch orientation {
            case .landscape:
                // [Cool]
                return -2
            case .portrait:
                // [Cool]
                return -2
            }
        }
    }
}
