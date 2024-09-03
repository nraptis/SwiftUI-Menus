//
//  DividerLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import UIKit

struct DividerLayout {
    
    static func getPillWidthTiny(orientation: Orientation) -> Int {
        return 2
    }
    
    static func getPillHeightTiny(orientation: Orientation) -> Int {
        
        if Device.isPad {
            return 38
        } else {
            switch orientation {
            case .landscape:
                return 22
            case .portrait:
                return 28
            }
        }
    }
    
    static func getPillWidthHuge(orientation: Orientation) -> Int {
        return 2
    }
    
    static func getPillHeightHuge(orientation: Orientation) -> Int {
        if Device.isPad {
            return 46
        } else {
            switch orientation {
            case .landscape:
                return 28
            case .portrait:
                return 34
            }
        }
    }
        
    static func getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: Orientation) -> Int {
        let pillWidthHuge = Self.getPillWidthHuge(orientation: orientation)
        return (pillWidthHuge + pillWidthHuge + 8)
    }
}
