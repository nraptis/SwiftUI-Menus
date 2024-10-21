//
//  EnterModeLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import UIKit

struct EnterModeLayout: LayoutScheme {

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
    
    // [++] Final
    static func getLineThickness(orientation: Orientation) -> Int {
        return 1
    }
 
    // [++] Final
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int {
        if Device.isPad {
            // [++] Final
            return 3
        } else {
            // [++] Final
            return 2
        }
    }
    
    // [++] Final
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int {
        if Device.isPad {
            // [++] Final
            return 3
        } else {
            // [++] Final
            return 2
        }
    }
    
    // [++] Final
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        UIFont()
    }
    
    // [++] Final
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
                    return -3
                case .portrait:
                    // [Cool]
                    return -3
                }
            }
        } else {
            if Device.isPad {
                return -4
            } else {
                switch orientation {
                case .landscape:
                    // [Cool]
                    return -4
                case .portrait:
                    // [Cool]
                    return -4
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
                return 4
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
                    return 1
                } else {
                    // [++] Final [iPhone Landscape]
                    return 1
                }
            case .portrait:
                if numberOfLines == 2 {
                    // [++] Final [iPhone Portrait]
                    return 1
                } else {
                    // [++] Final [iPhone Portrait]
                    return 1
                }
            }
        }
    }
    
}