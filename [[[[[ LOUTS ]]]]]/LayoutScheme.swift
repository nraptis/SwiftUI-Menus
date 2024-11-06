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
    
    static func getWallPaddingLeft(orientation: Orientation) -> Int
    static func getWallPaddingRight(orientation: Orientation) -> Int
    
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont
    static func getValuePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getValuePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int

    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int
    
    static func getOutsideBoxPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> Int
    static func getOutsideBoxPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int
    
    static func getHeroPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getHeroPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getHeroPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getHeroPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int
    
    static func getSlavePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getSlavePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
    
    static func getHeroSpacingLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int
}

extension LayoutScheme {
    
    static func getWallPaddingLeft(orientation: Orientation) -> Int {
        if Device.isPad {
            return 8
        } else {
            if orientation.isLandscape {
                return 4
            } else {
                return 8
            }
        }
    }
    
    static func getWallPaddingRight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 8
        } else {
            if orientation.isLandscape {
                return 4
            } else {
                return 8
            }
        }
    }
    
    static func getValuePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 8
        }
    }
    static func getValuePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 8
        }
    }
    
    /*
    static func getOutsideBoxPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if neighborTypeLeft == nil {
            return 120
        } else {
            return 2
        }
    }
    
    static func getOutsideBoxPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if neighborTypeRight == nil {
            return 60
        } else {
            return 2
        }
    }
    */
    
    static func getHeroPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    static func getHeroPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    static func getHeroPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    static func getHeroPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    
    static func getSlavePaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    static func getSlavePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
    
    static func getHeroSpacingLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
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
