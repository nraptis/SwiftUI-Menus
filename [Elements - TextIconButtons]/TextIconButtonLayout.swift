//
//  TextIconButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation
import UIKit

// On Landscape, iPhone, the Max Icon Size = "16" (For 2 Lines)
// On Landscape, iPhone, the Max Icon Size = "26" (For 1 Lines)

// On iPad, the Max Icon Size = "22" (For 2 Lines)
// On iPad, the Max Icon Size = "36" (For 1 Lines)

struct TextIconButtonLayout: LayoutScheme {
    
    static func getContextPaddingTop(orientation: Orientation) -> Int {
        return 1
    }
    
    static func getContextPaddingBottom(orientation: Orientation) -> Int {
        return 1
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
        // FINAL
        return 0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            if flavor.isLong {
                return 5
            }
        } else {
            if flavor.isLong {
                return 3
            }
        }
        return 0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        if flavor.isStacked {
            return 2 // Final, 2
        }
        return 0
    }
    
}
