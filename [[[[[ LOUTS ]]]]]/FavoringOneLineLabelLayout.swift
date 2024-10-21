//
//  FavoringOneLineLabelLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import UIKit

struct FavoringOneLineLabelLayout: LayoutScheme {
    
    static func getOutsideBoxPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> Int { 0 }
    
    static func getOutsideBoxPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        switch squeeze {
        case .squeezed:
            2
        case .standard:
            4
        case .relaxed:
            6
        }
    }
    
    
    // [++] Final
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont { UIFont() }
    
    // [++] Final
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int { 0 }
    
    // [++] Final
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int { 0 }
    
    // [++] Final
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int { 0 }
    
    // [++] Final
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int { 0 }
    
    // [++] Final
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            return UIFont.systemFont(ofSize: 14.0, weight: .bold)
        } else {
            switch orientation {
            case .landscape:
                return UIFont.systemFont(ofSize: 10.0, weight: .bold)
            case .portrait:
                return UIFont.systemFont(ofSize: 11.0, weight: .bold)
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