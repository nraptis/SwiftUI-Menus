//
//  MagicalFavoringOneLineLabelViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import SwiftUI

@Observable class MagicalFavoringOneLineLabelViewModel: MagicalViewModel {
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var isTwoLine = false
    
    let favoringOneLineLabelConfiguration: ToolInterfaceElementFavoringOneLineLabelConfiguration
    init(orientation: Orientation,
         favoringOneLineLabelConfiguration: ToolInterfaceElementFavoringOneLineLabelConfiguration) {
        self.favoringOneLineLabelConfiguration = favoringOneLineLabelConfiguration
        super.init(orientation: orientation)
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    func handleClicked() {
        print("MagicalGreenButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        
        let universalPaddingLeftSqueezed = FavoringOneLineLabelLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = FavoringOneLineLabelLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = FavoringOneLineLabelLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = FavoringOneLineLabelLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        
        var _isTwoLine = false
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        
        let twoLineWidth = favoringOneLineLabelConfiguration.twoLineWidth + (universalPaddingLeftSqueezed + universalPaddingRightSqueezed)
        let oneLineWidth = favoringOneLineLabelConfiguration.oneLineWidth + (universalPaddingLeftSqueezed + universalPaddingRightSqueezed)

        var consumedWidth = 0
        
        if layoutWidth >= oneLineWidth {
            consumedWidth = oneLineWidth
        } else {
            _isTwoLine = true
            consumedWidth = twoLineWidth
        }
        
        let leftOverWidth = (layoutWidth - consumedWidth)
        if leftOverWidth > 0 {
            let leftOverWidth2 = (leftOverWidth >> 1)
            _universalPaddingLeft = leftOverWidth2
            _universalPaddingRight = (leftOverWidth - leftOverWidth2)
        }
        
        // DOn't vardfvl;sdmg;l
        
        
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        isTwoLine = _isTwoLine
    }
}
