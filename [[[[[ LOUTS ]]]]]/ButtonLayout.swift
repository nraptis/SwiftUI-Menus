//
//  ButtonLayout.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import UIKit

struct ButtonLayout: LayoutScheme {
    
    static func getOutsideBoxPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if neighborTypeLeft == nil {
            return getWallPaddingLeft(orientation: orientation)
        } else {
            if neighborTypeLeft == .dividerTiny {
                return 1
            } else if neighborTypeLeft == .dividerHuge || neighborTypeLeft == .dividerSpacerDivider {
                return 2
            } else {
                if Device.isPad {
                    switch squeeze {
                    case .squeezed:
                        return 1
                    case .standard:
                        return 3
                    case .relaxed:
                        return 6
                    }
                } else {
                    switch squeeze {
                    case .squeezed:
                        return 1
                    case .standard:
                        return 2
                    case .relaxed:
                        return 4
                    }
                }
            }
        }
    }
    
    static func getOutsideBoxPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze, neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> Int {
        if neighborTypeRight == nil {
            return getWallPaddingRight(orientation: orientation)
        } else {
            if neighborTypeRight == .dividerTiny {
                return 1
            } else if neighborTypeRight == .dividerHuge || neighborTypeRight == .dividerSpacerDivider {
                return 2
            } else {
                if Device.isPad {
                    switch squeeze {
                    case .squeezed:
                        return 1
                    case .standard:
                        return 3
                    case .relaxed:
                        return 6
                    }
                } else {
                    switch squeeze {
                    case .squeezed:
                        return 1
                    case .standard:
                        return 2
                    case .relaxed:
                        return 4
                    }
                }
            }
        }
    }
    
    static func getAccentPaddingLeft(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 8
        }
    }
    
    static func getAccentPaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
        switch squeeze {
        case .squeezed:
            return 2
        case .standard:
            return 6
        case .relaxed:
            return 8
        }
    }
    
    static func getSlavePaddingRight(orientation: Orientation, squeeze: LayoutSchemeSqueeze) -> Int {
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
    
    static func getCornerRadius(orientation: Orientation) -> Int {
        if Device.isPad {
            return 6
        } else {
            return 4
        }
    }

    // [++] Final
    static func getOutsideBoxPaddingTop(orientation: Orientation) -> Int {
        if Device.isPad {
            // [++] Final
            return 2
        } else {
            // [++] Final
            return 1
        }
    }
    
    // [++] Final
    static func getOutsideBoxPaddingBottom(orientation: Orientation) -> Int {
        if Device.isPad {
            // [++] Final
            return 2
        } else {
            // [++] Final
            return 1
        }
    }
    
    // [++] Final
    static func getValueLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        UIFont()
    }
    
    // [++] Final
    static func getNameLabelFont(orientation: Orientation, flavor: LayoutSchemeFlavor) -> UIFont {
        if Device.isPad {
            switch flavor {
            case .long:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedLarge:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold)
            case .stackedMedium:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold, width: .condensed)
            case .stackedSmall:
                return UIFont.systemFont(ofSize: 14.0, weight: .semibold, width: .compressed)
            }
        } else {
            switch orientation {
            case .landscape:
                switch flavor {
                case .long:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedLarge:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold)
                case .stackedMedium:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .condensed)
                case .stackedSmall:
                    return UIFont.systemFont(ofSize: 10.0, weight: .semibold, width: .compressed)
                }
            case .portrait:
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
            }
        }
    }
    
    // [++] Final
    static func getNameLabelVerticalSpacing(orientation: Orientation, flavor: LayoutSchemeFlavor) -> Int {
        if flavor.isLong {
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
        } else {
            if Device.isPad {
                // [Cool]
                return -4
            } else {
                switch orientation {
                case .landscape:
                    // [Cool]
                    return -3
                case .portrait:
                    // [Cool]
                    return -3
                }
            }
        }
    }
    
    // [++] Final
    static func getHeroPaddingTopStacked(orientation: Orientation, numberOfLines: Int) -> Int {
        if Device.isPad {
            if numberOfLines == 2 {
                // [++] Final
                return 3
            } else {
                // [++] Final
                return 4
            }
        } else {
            switch orientation {
            case .landscape:
                if numberOfLines == 2 {
                    // [++] Final
                    return 2
                } else {
                    // [++] Final
                    return 2
                }
            case .portrait:
                if numberOfLines == 2 {
                    // [++] Final
                    return 2
                } else {
                    // [++] Final
                    return 2
                }
            }
        }
    }
     
    // [++] Final
    static func getHeroPaddingBottomStacked(orientation: Orientation, numberOfLines: Int) -> Int {
        if Device.isPad {
            if numberOfLines == 2 {
                // [++] Final
                return 0
            } else {
                // [++] Final
                return 0
            }
        } else {
            
            switch orientation {
            case .landscape:
                if numberOfLines == 2 {
                    // [++] Final
                    return 0
                } else {
                    // [++] Final
                    return 0
                }
            case .portrait:
                if numberOfLines == 2 {
                    // [++] Final
                    return 0
                } else {
                    // [++] Final
                    return 0
                }
            }
        }
    }
}
