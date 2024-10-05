//
//  MagicalViewModelSegmented.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import Foundation
import Observation
import SwiftUI

@Observable class MagicalViewModelSegmented: MagicalViewModel {

    func getSegmentButtonViewModels() -> [MagicalSegmentButtonViewModel] {
        fatalError("done, can't call this")
        return []
    }
    
    @MainActor var segmentButtonViewModels = [MagicalSegmentButtonViewModel]()
    
    override func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        super.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        for segmentButtonViewModel in segmentButtonViewModels {
            segmentButtonViewModel.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        }
    }
    
    //@MainActor
    override func refreshLayoutFrameStacked(nameLabelWidth: Int,
                                              numberOfLines: Int,
                                              iconPackMain: (any TextIconPackable),
                                              iconPackSecondary: (any TextIconPackable)?) {
        
        let G_L = GENERIC_LAYOUT.computeStacked(layoutSchemeType: Self.getLayoutScheme(),
                                                layoutWidth: layoutWidth,
                                                orientation: orientation,
                                                nameLabelWidth: nameLabelWidth,
                                                numberOfLines: numberOfLines,
                                                iconPackMain: iconPackMain,
                                                iconPackSecondary: iconPackSecondary,
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
        
        if slavePaddingLeft != G_L.slavePaddingLeft {
            slavePaddingLeft = G_L.slavePaddingLeft
        }
        
        if slavePaddingRight != G_L.slavePaddingRight {
            slavePaddingRight = G_L.slavePaddingRight
        }
        
    }
    
    //@MainActor
    override func refreshLayoutFrameLong(nameLabelWidth: Int,
                                           numberOfLines: Int,
                                           iconPackMain: (any TextIconPackable),
                                           iconPackSecondary: (any TextIconPackable)?) {
        
        let G_L = GENERIC_LAYOUT.computeLong(layoutSchemeType: Self.getLayoutScheme(),
                                             layoutWidth: layoutWidth,
                                             orientation: orientation,
                                             nameLabelWidth: nameLabelWidth,
                                             numberOfLines: numberOfLines,
                                             iconPackMain: iconPackMain,
                                             iconPackSecondary: iconPackSecondary,
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
        
        if slavePaddingLeft != G_L.slavePaddingLeft {
            slavePaddingLeft = G_L.slavePaddingLeft
        }
        
        if slavePaddingRight != G_L.slavePaddingRight {
            slavePaddingRight = G_L.slavePaddingRight
        }
        
        if heroSpacing != G_L.heroSpacing {
            heroSpacing = G_L.heroSpacing
        }
        
    }
}
