//
//  IconButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation

struct IconButtonLayout: LayoutScheme {
    
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
    
    static func getIconWidthWithUniversalPadding(iconPack: TextIconPackable,
                                                 orientation: Orientation,
                                                 squeeze: LayoutSchemeSqueeze,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        let universalPaddingLeft = getUniversalPaddingLeft(orientation: orientation,
                                                           flavor: .long,
                                                           squeeze: squeeze,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        let universalPaddingRight = getUniversalPaddingRight(orientation: orientation,
                                                             flavor: .long,
                                                             squeeze: squeeze,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        
        let icon = iconPack.getTextIcon(orientation: orientation,
                             layoutSchemeFlavor: .long,
                             numberOfLines: 0,
                             isDarkMode: false,
                             isEnabled: true)
        var result = icon.width
        result += universalPaddingLeft
        result += universalPaddingRight
        return result
    }
    
}
