//
//  ToolInterfaceLayoutDirection.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/26/24.
//

import Foundation

struct ToolInterfaceLayoutStackingLargeData {
    let isButtonLong: Bool
    let isModeSwitchLong: Bool
    let isCheckBoxLong: Bool
    let isSegmentLong: Bool
}

enum ToolInterfaceLayoutStackingCategory {
    case allVerticalSmall
    case allVerticalMedium
    case large(ToolInterfaceLayoutStackingLargeData)
}

extension ToolInterfaceLayoutStackingCategory {
    func getLayoutSchemeFlavor(toolInterfaceElementType: ToolInterfaceElementType) -> LayoutSchemeFlavor {
        
        switch self {
        case .allVerticalSmall:
            return .stackedSmall
        case .allVerticalMedium:
            return .stackedMedium
        case .large(let stackingLargeData):
            switch toolInterfaceElementType {
            case .checkBox, .sexyCheckBox:
                if stackingLargeData.isCheckBoxLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            case .textIconButton, .sexyButton:
                if stackingLargeData.isButtonLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            case .enterMode, .exitMode:
                if stackingLargeData.isModeSwitchLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            case .segment, .createSwatch:
                if stackingLargeData.isSegmentLong {
                    return .long
                } else {
                    return .stackedLarge
                }
            default:
                return .long
            }
        }
    }
    
    var isSmall: Bool {
        switch self {
        case .allVerticalSmall:
            return true
        default:
            return false
        }
    }
    
    var isMedium: Bool {
        switch self {
        case .allVerticalMedium:
            return true
        default:
            return false
        }
    }

    var isSegmentLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isSegmentLong
        }
    }
    
    var isCheckBoxLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isCheckBoxLong
        }
    }
    
    var isButtonLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isButtonLong
        }
    }
    
    var isModeSwitchLong: Bool {
        switch self {
        case .allVerticalSmall:
            return false
        case .allVerticalMedium:
            return false
        case .large(let stackingLargeData):
            return stackingLargeData.isModeSwitchLong
        }
    }
}

extension ToolInterfaceLayoutStackingCategory {
    
    static func getAllInPriorityOrderExceptLeast() -> [ToolInterfaceLayoutStackingCategory] {
        
        var result = [ToolInterfaceLayoutStackingCategory]()
        
        // Cases with 4:
        result.append(.large(.init(isButtonLong: true, isModeSwitchLong: true, isCheckBoxLong: true, isSegmentLong: true)))
        
        for isButtonLong in [true, false] {
            for isModeSwitchLong in [true, false] {
                for isCheckBoxLong in [true, false] {
                    for isSegmentLong in [true, false] {
                        result.append(.large(.init(isButtonLong: isButtonLong,
                                                   isModeSwitchLong: isModeSwitchLong,
                                                   isCheckBoxLong: isCheckBoxLong,
                                                   isSegmentLong: isSegmentLong)))
                    }
                }
            }
        }
        
        result.append(.allVerticalMedium)
        
        // If nothing else works, we're going to use .allVerticalSmall
        
        return result
    }
    
}
