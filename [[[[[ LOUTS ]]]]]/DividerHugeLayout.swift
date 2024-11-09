//
//  DividerHugeLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/19/24.
//

import Foundation

struct DividerHugeLayout {
    
    @MainActor static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int {
        return 3
    }
    
    @MainActor static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        return 3
    }
    
    @MainActor static func getCapsuleWidth(orientation: Orientation) -> Int {
        if Device.isPad {
            return 1
        } else {
            return 1
        }
    }
    
    @MainActor static func getCapsuleHeight(orientation: Orientation) -> Int {
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
