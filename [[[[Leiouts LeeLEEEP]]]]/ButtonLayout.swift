//
//  ButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import UIKit

struct ButtonLayout: LayoutScheme {
    
    static func getSlavePaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
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
    
    static func getSlavePaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
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
    
    static func getContextCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 6
        } else {
            return 4
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
        // FINAL
        Device.isPad ? 2 : 1 // FINAL Device.isPad ? 2 : 1
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        Device.isPad ? 2 : 1 // FINAL Device.isPad ? 2 : 1
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        return 0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if Device.isPad {
            return 2 + 2
        } else {
            return 2 + 1
        }
    }
}
