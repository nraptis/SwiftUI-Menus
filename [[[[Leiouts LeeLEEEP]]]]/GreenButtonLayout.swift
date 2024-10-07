//
//  GreenButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import UIKit

struct GreenButtonLayout: LayoutScheme {
    
    static func getHeroPaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        return 16
    }
    static func getHeroPaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        return 16
    }
    static func getHeroPaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        return 16
    }
    static func getHeroPaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        return 16
    }
    
    static func getSlavePaddingLeftStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingLeftLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingRightStacked(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getSlavePaddingRightLong(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 15.0, weight: .bold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 15.0, weight: .bold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 15.0, weight: .bold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 15.0, weight: .bold, width: .compressed)
            }
        } else {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 12.0, weight: .bold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 12.0, weight: .bold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 12.0, weight: .bold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 12.0, weight: .bold, width: .compressed)
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
    
    static func getCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 14
        } else {
            if orientation.isLandscape {
                return 10
            } else {
                return 12
            }
        }
    }
    
    static func getLineThickness(orientation: Orientation) -> Int {
        return 2
    }
    
}
