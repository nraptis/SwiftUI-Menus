//
//  MagicalViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class MagicalViewModel {
    
    class func getLayoutScheme() -> LayoutScheme.Type {
        fatalError("Shoudl not use generic layout scheme...")
    }
    
    //@ObservationIgnored unowned var jiggleViewModel: JiggleViewModel!
    //@ObservationIgnored unowned var toolInterfaceViewModel: ToolInterfaceViewModel!
    @ObservationIgnored var orientation: Orientation
    @ObservationIgnored unowned var toolNode: ToolNode!
    @ObservationIgnored var neighborTypeLeft: ToolInterfaceElementType?
    @ObservationIgnored var neighborTypeRight: ToolInterfaceElementType?
    @ObservationIgnored var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    //@ObservationIgnored var layoutSchemeFlavorSliders = LayoutSchemeFlavor.stackedSmall
    
    
    @MainActor var outsideBoxPaddingLeft = 0
    @MainActor var outsideBoxPaddingRight = 0
    
    @MainActor var slavePaddingLeft = 0
    @MainActor var slavePaddingRight = 0
    
    @MainActor var heroPaddingLeft = 0
    @MainActor var heroPaddingRight = 0
    
    
    @MainActor var isEnabled = true
    @MainActor var isHighlighted = false
    
    @MainActor var layoutX = 0
    @MainActor var layoutY = 0
    @MainActor var layoutWidth = 320
    @MainActor var layoutHeight = 44
    
    @MainActor private(set) var isDarkModeEnabled = false
    @MainActor func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        if isDarkModeEnabled != self.isDarkModeEnabled {
            self.isDarkModeEnabled = isDarkModeEnabled
        }
    }
    
    @MainActor init(orientation: Orientation
        //jiggleViewModel: JiggleViewModel,
         //toolInterfaceViewModel: ToolInterfaceViewModel
    ) {
        self.orientation = orientation
        isDarkModeEnabled = ApplicationController.isDarkModeEnabled
        //self.jiggleViewModel = jiggleViewModel
        //self.toolInterfaceViewModel = toolInterfaceViewModel
        //self.orientation = jiggleViewModel.orientation
    }
    
    @MainActor func refreshLayoutFrame() {
        
    }
    
    @MainActor func refresh() {
        
    }
    
    @MainActor func refreshDisableIfNoGuideSelectedOtherwiseEnable() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getSelectedGuide() !== nil {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
    }
    
    @MainActor func refreshDisableIfNoJiggleSelectedOtherwiseEnable() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if jiggleViewModel.getSelectedJiggle() !== nil {
                refreshEnabled()
            } else {
                refreshDisabled()
            }
        }
    }
    
    @MainActor func refreshDisableIfCreatorModeOtherwiseEnable() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .none:
                refreshEnabled()
            default:
                refreshDisabled()
            }
        }
    }
    
    @MainActor func refreshDisabled() {
        if isEnabled == true {
            isEnabled = false
        }
    }
    
    @MainActor func refreshEnabled() {
        if isEnabled == false {
            isEnabled = true
        }
    }
    
    func getLayoutSchemeFlavor() -> LayoutSchemeFlavor {
        if let toolNode = toolNode {
            let type = toolNode.type
            
            //if type == .slider {
            //    return layoutSchemeFlavorSliders
            //}
            
            return layoutStackingCategory.getLayoutSchemeFlavor(toolInterfaceElementType: type)
        } else {
            return .stackedSmall
        }
    }
    
    func calculateStackedConsumedWidth(textWidth: Int, textPaddingLeft: Int, textPaddingRight: Int,
                                       imageWidth: Int, imagePaddingLeft: Int, imagePaddingRight: Int) -> Int {
        let width1 = textWidth + textPaddingLeft + textPaddingRight
        let width2 = imageWidth + imagePaddingLeft + imagePaddingRight
        return max(width1, width2)
    }
    
    @MainActor func getTextAndIconColor(isPressed: Bool, isDarkModeEnabled: Bool) -> Color {
        if isDarkModeEnabled {
            if isEnabled {
                if isPressed {
                    if isHighlighted {
                        return ToolInterfaceTheme.highlightedYellowDown
                    } else {
                        return ToolInterfaceTheme.enabledGrayDown
                    }
                } else {
                    if isHighlighted {
                        return ToolInterfaceTheme.highlightedYellowUp
                    } else {
                        return ToolInterfaceTheme.enabledGrayUp
                    }
                }
            } else {
                return ToolInterfaceTheme.disabledGray
            }
        } else {
            return Color.black
        }
    }
    
    @MainActor func getTextAndIconColor(isDarkModeEnabled: Bool) -> Color {
        if isDarkModeEnabled {
            if isEnabled {
                if isHighlighted {
                    return ToolInterfaceTheme.highlightedYellowUp
                } else {
                    return ToolInterfaceTheme.enabledGrayUp
                }
            } else {
                return ToolInterfaceTheme.disabledGray
            }
        } else {
            return Color.black
        }
    }
    
}
