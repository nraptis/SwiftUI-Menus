//
//  LayoutScheme.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/27/24.
//

import UIKit

enum LayoutSchemeFlavor: UInt8 {
    case long = 4
    case stackedLarge = 3
    case stackedMedium = 2
    case stackedSmall = 1
}

extension LayoutSchemeFlavor {
    static func getMax() -> LayoutSchemeFlavor {
        return .long
    }
}

extension LayoutSchemeFlavor: Comparable {
    static func < (lhs: LayoutSchemeFlavor, rhs: LayoutSchemeFlavor) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension LayoutSchemeFlavor {
    var isStacked: Bool {
        switch self {
        case .long:
            false
        case .stackedLarge:
            true
        case .stackedMedium:
            true
        case .stackedSmall:
            true
        }
    }
    
    var isLong: Bool {
        switch self {
        case .long:
            true
        case .stackedLarge:
            false
        case .stackedMedium:
            false
        case .stackedSmall:
            false
        }
    }
}

enum LayoutSchemeSqueeze {
    case squeezed
    case standard
    case relaxed
}

// There is an assumption here, that everything
// we express here has an icon + text scheme... In addition to, perhaps, another thing...
// This is to save repeating work, and make life easy for ourselfves.

protocol LayoutScheme {
    
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont
    static func getValuePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getValuePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int

    
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int
    
    
    
    static func getOutsideBoxPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> Int
    static func getOutsideBoxPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> Int
    
    
    static func getOutsideBoxPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int
    static func getOutsideBoxPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> Int
    
    static func getHeroPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getHeroPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getHeroPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getHeroPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getHeroPaddingTopStacked(orientation: Orientation) -> Int
    static func getHeroPaddingBottomStacked(orientation: Orientation) -> Int
    
    static func getSlavePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getSlavePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getHeroSpacingLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
}

extension LayoutScheme {
    
    static func getValuePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getValuePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
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
    
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2
        } else {
            return 1
        }
    }
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2
        } else {
            return 1
        }
    }
    
    static func getHeroPaddingTopStacked(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2
        } else {
            return 1
        }
    }
    
    static func getHeroPaddingBottomStacked(orientation: Orientation) -> Int {
        if Device.isPad {
            return 2
        } else {
            return 1
        }
    }
    
    
    static func getOutsideBoxPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> Int {
        6
    }
    static func getOutsideBoxPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> Int {
        6
    }
    static func getOutsideBoxPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        6
    }
    static func getOutsideBoxPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> Int {
        6
    }
    
    static func getHeroPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 4
            case .standard:
                return 6
            case .relaxed:
                return 8
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard:
                return 4
            case .relaxed:
                return 6
            }
        }
    }
    static func getHeroPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 4
            case .standard:
                return 6
            case .relaxed:
                return 8
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard:
                return 4
            case .relaxed:
                return 6
            }
        }
    }
    static func getHeroPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 4
            case .standard:
                return 6
            case .relaxed:
                return 8
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard:
                return 4
            case .relaxed:
                return 6
            }
        }
    }
    static func getHeroPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 4
            case .standard:
                return 6
            case .relaxed:
                return 8
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard:
                return 4
            case .relaxed:
                return 6
            }
        }
    }
    
    static func getSlavePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    static func getHeroSpacingLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 4
            case .standard:
                return 6
            case .relaxed:
                return 8
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 3
            case .standard:
                return 4
            case .relaxed:
                return 6
            }
        }
    }
    
}

extension LayoutScheme {

    static func getNameLabelTextWidth(line1: String?,
                                      line2: String?,
                                      orientation: Orientation,
                                      flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getNameLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, line2: line2, font: font)
    }
    
    static func getNameLabelTextWidth(line1: String?,
                                      orientation: Orientation,
                                      flavor: LayoutSchemeFlavor) -> Int {
        let font = Self.getNameLabelFont(orientation: orientation, flavor: flavor)
        return ToolInterfaceTheme.getTextWidth(line1: line1, font: font)
    }
}


extension LayoutScheme {
    
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
    
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        if Device.isPhone {
            return -3
        }
        if Device.isPad {
            return -4
        }
        return 0
    }
    
}
