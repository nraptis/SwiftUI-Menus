//
//  StepperLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import UIKit

struct StepperLayout: LayoutScheme {
    
    static func getOutsideBoxPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if neighborTypeLeft == nil {
            return getWallPaddingLeft(orientation: orientation)
        } else {
            
            if Device.isPad {
                switch squeeze {
                case .squeezed:
                    return 1
                case .standard:
                    return 3
                case .relaxed:
                    return 6
                }
            } else {
                switch squeeze {
                case .squeezed:
                    return 1
                case .standard:
                    return 2
                case .relaxed:
                    return 4
                }
            }
        }
    }
    
    static func getOutsideBoxPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if neighborTypeRight == nil {
            return getWallPaddingRight(orientation: orientation)
        } else {
            if Device.isPad {
                switch squeeze {
                case .squeezed:
                    return 1
                case .standard:
                    return 3
                case .relaxed:
                    return 6
                }
            } else {
                switch squeeze {
                case .squeezed:
                    return 1
                case .standard:
                    return 2
                case .relaxed:
                    return 4
                }
            }
        }
    }
    
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
    
    @MainActor static func getCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 6
        } else {
            return 4
        }
    }
    
    @MainActor static func getLineThickness(orientation: Orientation) -> Int {
        return 1
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
        if flavor.isLong {
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
        } else {
            if Device.isPad {
                // [Cool]
                return -4
            } else {
                switch orientation {
                case .landscape:
                    // [Cool]
                    return -3
                case .portrait:
                    // [Cool]
                    return -3
                }
            }
        }
    }
    
    // [++] Final
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int {
        if Device.isPad {
            if numberOfLines == 2 {
                // [++] Final [iPAD]
                return 4
            } else {
                // [++] Final [iPAD]
                return 5
            }
        } else {
            switch orientation {
            case .landscape:
                if numberOfLines == 2 {
                    // [++] Final [iPhone Landscape]
                    return 3
                } else {
                    // [++] Final [iPhone Landscape]
                    return 3
                }
            case .portrait:
                if numberOfLines == 2 {
                    // [++] Final [iPhone Portrait]
                    return 3
                } else {
                    // [++] Final [iPhone Portrait]
                    return 3
                }
            }
        }
    }
    
    // [++] Final
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int {
        if Device.isPad {
            if numberOfLines == 2 {
                // [++] Final [iPAD]
                return 1
            } else {
                // [++] Final [iPAD]
                return 1
            }
        } else {
            switch orientation {
            case .landscape:
                if numberOfLines == 2 {
                    // [++] Final [iPhone Landscape]
                    return 0
                } else {
                    // [++] Final [iPhone Landscape]
                    return 1
                }
            case .portrait:
                if numberOfLines == 2 {
                    // [++] Final [iPhone Portrait]
                    return 0
                } else {
                    // [++] Final [iPhone Portrait]
                    return 1
                }
            }
        }
    }
    
}
