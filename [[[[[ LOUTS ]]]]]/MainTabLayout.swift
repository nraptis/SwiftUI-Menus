//
//  MainTabLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import UIKit

struct MainTabLayout: LayoutScheme {
    
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
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 14
        }
    }
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 14
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
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont { UIFont() }
    
    // [++] Final
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int { 0 }
    
    // [++] Final
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int { 0 }
    
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

