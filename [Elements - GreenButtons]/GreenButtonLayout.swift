//
//  GreenButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import UIKit

struct GreenButtonLayout: LayoutScheme {
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            return UIFont.systemFont(ofSize: 14.0, weight: .bold)
        } else {
            return UIFont.systemFont(ofSize: 11.0, weight: .bold)
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
        Device.isPad ? 3 : 2
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        Device.isPad ? 3 : 2
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        
        
        return 8
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 8
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        // FINAL
        return 0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 0
    }
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        return 8
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        return 0
    }
    
    static func getCornerRadiusOuter(orientation: Orientation) -> Int {
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
}
