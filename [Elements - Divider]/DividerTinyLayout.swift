//
//  DividerTinyLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/19/24.
//

import Foundation

struct DividerTinyLayout {
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int {
        return 2
    }
    
    static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        return 2
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int { 0 }
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int { 0 }
    
    static func getCapsuleWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 1
        } else {
            return 1
        }
    }
    
    static func getCapsuleHeight(orientation: Orientation) -> Int {
        if Device.isPad {
            return 54
        } else {
            switch orientation {
            case .landscape:
                return 34
            case .portrait:
                return 40
            }
        }
    }
    
    static func getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: Orientation) -> Int {
        return 12
    }
}
