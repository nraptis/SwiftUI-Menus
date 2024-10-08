//
//  MagicalViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import SwiftUI

@Observable class MagicalViewModel {
    
    class func getLayoutScheme() -> LayoutScheme.Type {
        fatalError("Shoudl not use generic layout scheme...")
    }
    
    @ObservationIgnored var orientation: Orientation
    @ObservationIgnored unowned var toolNode: ToolNode!
    @ObservationIgnored var neighborTypeLeft: ToolInterfaceElementType?
    @ObservationIgnored var neighborTypeRight: ToolInterfaceElementType?
    @ObservationIgnored var layoutStackingCategory = ToolInterfaceLayoutStackingCategory.allVerticalSmall
    
    @MainActor var extraGrowingElementWidth = 0
    
    @MainActor var outsideBoxPaddingLeft = 0
    @MainActor var outsideBoxPaddingRight = 0
    
    @MainActor var accentPaddingLeft = 0
    @MainActor var accentPaddingRight = 0
    
    @MainActor var slavePaddingLeft = 0
    @MainActor var slavePaddingRight = 0
    
    @MainActor var heroPaddingLeft = 0
    @MainActor var heroPaddingRight = 0
    
    @MainActor var valuePaddingLeft = 0
    @MainActor var valuePaddingRight = 0
    
    @MainActor var heroSpacing = 0
    
    @MainActor var isEnabled = true
    
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
    
    @MainActor init(orientation: Orientation) {
        self.orientation = orientation
        isDarkModeEnabled = ApplicationController.isDarkModeEnabled
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
    
    @MainActor func getLayoutSchemeFlavor() -> LayoutSchemeFlavor {
        if let toolNode = toolNode {
            return layoutStackingCategory.getLayoutSchemeFlavor(toolInterfaceElementType: toolNode.type)
        } else {
            return .stackedSmall
        }
    }
    
    @MainActor func refreshLayoutFrameStacked(nameLabelWidth: Int,
                                              numberOfLines: Int,
                                              valueLabelWidth: Int,
                                              extraGrowingElementWidthSqueezed: Int,
                                              extraGrowingElementWidthStandard: Int,
                                              extraGrowingElementWidthRelaxed: Int,
                                              iconPackMain: (any TextIconPackable),
                                              iconPackSecondary: (any TextIconPackable)?,
                                              iconPackTertiary: (any TextIconPackable)?) {
        
        let G_L = GENERIC_LAYOUT.computeStacked(layoutSchemeType: Self.getLayoutScheme(),
                                                layoutWidth: layoutWidth,
                                                orientation: orientation,
                                                nameLabelWidth: nameLabelWidth,
                                                numberOfLines: numberOfLines,
                                                valueLabelWidth: valueLabelWidth,
                                                extraGrowingElementWidthSqueezed: extraGrowingElementWidthSqueezed,
                                                extraGrowingElementWidthStandard: extraGrowingElementWidthStandard,
                                                extraGrowingElementWidthRelaxed: extraGrowingElementWidthRelaxed,
                                                iconPackMain: iconPackMain,
                                                iconPackSecondary: iconPackSecondary,
                                                iconPackTertiary: iconPackTertiary,
                                                neighborTypeLeft: toolNode.neighborTypeLeft,
                                                neighborTypeRight: toolNode.neighborTypeRight)
        
        if outsideBoxPaddingLeft != G_L.outsideBoxPaddingLeft {
            outsideBoxPaddingLeft = G_L.outsideBoxPaddingLeft
        }
        
        if outsideBoxPaddingRight != G_L.outsideBoxPaddingRight {
            outsideBoxPaddingRight = G_L.outsideBoxPaddingRight
        }
        
        if heroPaddingLeft != G_L.heroPaddingLeft {
            heroPaddingLeft = G_L.heroPaddingLeft
        }
        
        if heroPaddingRight != G_L.heroPaddingRight {
            heroPaddingRight = G_L.heroPaddingRight
        }
        
        if valuePaddingLeft != G_L.valuePaddingLeft {
            valuePaddingLeft = G_L.valuePaddingLeft
        }
        
        if valuePaddingRight != G_L.valuePaddingRight {
            valuePaddingRight = G_L.valuePaddingRight
        }
        
        if slavePaddingLeft != G_L.slavePaddingLeft {
            slavePaddingLeft = G_L.slavePaddingLeft
        }
        
        if slavePaddingRight != G_L.slavePaddingRight {
            slavePaddingRight = G_L.slavePaddingRight
        }
        
        if accentPaddingLeft != G_L.accentPaddingLeft {
            accentPaddingLeft = G_L.accentPaddingLeft
        }
        
        if accentPaddingRight != G_L.accentPaddingRight {
            accentPaddingRight = G_L.accentPaddingRight
        }
        
        if extraGrowingElementWidth != G_L.extraGrowingElementWidth {
            extraGrowingElementWidth = G_L.extraGrowingElementWidth
        }
    }
    
    @MainActor func refreshLayoutFrameLong(nameLabelWidth: Int,
                                           numberOfLines: Int,
                                           valueLabelWidth: Int,
                                           extraGrowingElementWidthSqueezed: Int,
                                           extraGrowingElementWidthStandard: Int,
                                           extraGrowingElementWidthRelaxed: Int,
                                           iconPackMain: (any TextIconPackable),
                                           iconPackSecondary: (any TextIconPackable)?,
                                           iconPackTertiary: (any TextIconPackable)?) {
        
        let G_L = GENERIC_LAYOUT.computeLong(layoutSchemeType: Self.getLayoutScheme(),
                                             layoutWidth: layoutWidth,
                                             orientation: orientation,
                                             nameLabelWidth: nameLabelWidth,
                                             numberOfLines: numberOfLines,
                                             valueLabelWidth: valueLabelWidth,
                                             extraGrowingElementWidthSqueezed: extraGrowingElementWidthSqueezed,
                                             extraGrowingElementWidthStandard: extraGrowingElementWidthStandard,
                                             extraGrowingElementWidthRelaxed: extraGrowingElementWidthRelaxed,
                                             
                                             iconPackMain: iconPackMain,
                                             iconPackSecondary: iconPackSecondary,
                                             iconPackTertiary: iconPackTertiary,
                                             neighborTypeLeft: toolNode.neighborTypeLeft,
                                             neighborTypeRight: toolNode.neighborTypeRight)
        
        if outsideBoxPaddingLeft != G_L.outsideBoxPaddingLeft {
            outsideBoxPaddingLeft = G_L.outsideBoxPaddingLeft
        }
        
        if outsideBoxPaddingRight != G_L.outsideBoxPaddingRight {
            outsideBoxPaddingRight = G_L.outsideBoxPaddingRight
        }
        
        if heroPaddingLeft != G_L.heroPaddingLeft {
            heroPaddingLeft = G_L.heroPaddingLeft
        }
        
        if heroPaddingRight != G_L.heroPaddingRight {
            heroPaddingRight = G_L.heroPaddingRight
        }
        
        if valuePaddingLeft != G_L.valuePaddingLeft {
            valuePaddingLeft = G_L.valuePaddingLeft
        }
        
        if valuePaddingRight != G_L.valuePaddingRight {
            valuePaddingRight = G_L.valuePaddingRight
        }
        
        if slavePaddingLeft != G_L.slavePaddingLeft {
            slavePaddingLeft = G_L.slavePaddingLeft
        }
        
        if slavePaddingRight != G_L.slavePaddingRight {
            slavePaddingRight = G_L.slavePaddingRight
        }
        
        if accentPaddingLeft != G_L.accentPaddingLeft {
            accentPaddingLeft = G_L.accentPaddingLeft
        }
        
        if accentPaddingRight != G_L.accentPaddingRight {
            accentPaddingRight = G_L.accentPaddingRight
        }
        
        if heroSpacing != G_L.heroSpacing {
            heroSpacing = G_L.heroSpacing
        }
        
        if extraGrowingElementWidth != G_L.extraGrowingElementWidth {
            extraGrowingElementWidth = G_L.extraGrowingElementWidth
        }
        
    }
    
}
