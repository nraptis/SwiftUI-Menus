//
//  SegmentedPickerLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/1/24.
//

import Foundation
import UIKit

// On Landscape, iPhone, the Max Icon Size = "??" (For 2 Lines)
// On Landscape, iPhone, the Max Icon Size = "??" (For 1 Lines)

// On iPad, the Max Icon Size = "??" (For 2 Lines)
// On iPad, the Max Icon Size = "??" (For 1 Lines)

enum SegmentedPickerPosition {
    case bookendLeft
    case middle
    case bookendRight
}

struct SegmentedPickerLayout: LayoutScheme {
    
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int {
        return 8
    }
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int {
        return 22
    }
    
    static func getHeroPaddingTopStacked(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2 + 3
        } else {
            return 1 + 3
        }
    }
    
    static func getSlavePaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    
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
    
    static func getButtonUniversalPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getButtonUniversalPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getButtonUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getButtonUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
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
                return 4
            }
        } else {
            if flavor.isStacked {
                return 3
            }
        }
        return 0
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
}
