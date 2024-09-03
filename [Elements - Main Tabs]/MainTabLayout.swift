//
//  MainTabLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation
import UIKit

struct MainTabLayout: LayoutScheme {
    
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 15.0, weight: .semibold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 15.0, weight: .semibold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 15.0, weight: .semibold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 15.0, weight: .semibold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 11.0, weight: .semibold, width: .compressed)
                }
            case .portrait:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 12.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 12.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 12.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 12.0, weight: .semibold, width: .compressed)
                }
            }
        }
    }
    
    static func getUniversalPaddingLeft(orientation: Orientation,
                                        flavor: LayoutSchemeFlavor,
                                        squeeze: LayoutSchemeSqueeze,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 6
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
            }
        }
    }
    
    static func getUniversalPaddingRight(orientation: Orientation,
                                         flavor: LayoutSchemeFlavor,
                                         squeeze: LayoutSchemeSqueeze,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if Device.isPad {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 6
            }
        } else {
            switch squeeze {
            case .squeezed:
                return 2
            case .standard:
                return 4
            }
        }
    }
    
    static func getUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        2
    }
    
    static func getUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        2
    }
    
    static func getButtonUniversalPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getButtonUniversalPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 4
        } else {
            return 2
        }
    }
    
    static func getButtonUniversalPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getButtonUniversalPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getNameLabelPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getNameLabelPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        if Device.isPad {
            return 6
        } else {
            return 4
        }
    }
    
    static func getNameLabelPaddingBottom(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        0
    }
    
    static func getIconPaddingLeft(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getIconPaddingRight(orientation: Orientation, flavor: LayoutSchemeFlavor, squeeze: LayoutSchemeSqueeze) -> Int {
        0
    }
    
    static func getIconPaddingTop(orientation: Orientation, flavor: LayoutSchemeFlavor, numberOfLines: Int) -> Int {
        return 0
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
    
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        if Device.isPhone {
            return -2
        }
        if Device.isPad {
            return -3
        }
        return 0
    }
}
