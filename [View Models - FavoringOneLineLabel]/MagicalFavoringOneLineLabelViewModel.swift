//
//  MagicalFavoringOneLineLabelViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import SwiftUI

@Observable class MagicalFavoringOneLineLabelViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        FavoringOneLineLabelLayout.self
    }
    
    @MainActor var isTwoLine = false
    
    let favoringOneLineLabelConfiguration: ToolInterfaceElementFavoringOneLineLabelConfiguration
    @MainActor init(orientation: Orientation,
         favoringOneLineLabelConfiguration: ToolInterfaceElementFavoringOneLineLabelConfiguration) {
        self.favoringOneLineLabelConfiguration = favoringOneLineLabelConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalGreenButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let outsideBoxLeftSqueezed = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                             squeeze: .squeezed,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                             squeeze: .standard,
                                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                                             neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = FavoringOneLineLabelLayout.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                            squeeze: .relaxed,
                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                            neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = FavoringOneLineLabelLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let outsideBoxRightStandard = FavoringOneLineLabelLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                               squeeze: .standard,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        let outsideBoxRightRelaxed = FavoringOneLineLabelLayout.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                              squeeze: .relaxed,
                                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                                              neighborTypeRight: neighborTypeRight)
        
        var _isTwoLine = false
        
        var _outsideBoxLeft = 0
        var _outsideBoxRight = 0
        
        let twoLineWidth = favoringOneLineLabelConfiguration.twoLineWidth + (outsideBoxLeftSqueezed + outsideBoxRightSqueezed)
        let oneLineWidth = favoringOneLineLabelConfiguration.oneLineWidth + (outsideBoxLeftSqueezed + outsideBoxRightSqueezed)
        let twoLineThreshold = favoringOneLineLabelConfiguration.oneLineWidth + (outsideBoxLeftStandard + outsideBoxRightStandard)
        
        var consumedWidth = 0
        if favoringOneLineLabelConfiguration.twoLineText2.count <= 0 {
            consumedWidth = oneLineWidth
        } else {
            if layoutWidth >= twoLineThreshold {
                consumedWidth = oneLineWidth
            } else {
                _isTwoLine = true
                consumedWidth = twoLineWidth
            }
        }
        
        var isLooping = true
        while (consumedWidth < layoutWidth) && (isLooping == true) {
            isLooping = false
            if _outsideBoxLeft < outsideBoxLeftSqueezed {
                isLooping = true
                _outsideBoxLeft += 1
                consumedWidth += 1
            }
            if _outsideBoxRight < outsideBoxRightSqueezed {
                isLooping = true
                _outsideBoxRight += 1
                consumedWidth += 1
            }
        }
        
        isLooping = true
        while (consumedWidth < layoutWidth) && (isLooping == true) {
            isLooping = false
            if _outsideBoxLeft < outsideBoxLeftStandard {
                isLooping = true
                _outsideBoxLeft += 1
                consumedWidth += 1
            }
            if _outsideBoxRight < outsideBoxRightStandard {
                isLooping = true
                _outsideBoxRight += 1
                consumedWidth += 1
            }
        }
        
        isLooping = true
        while (consumedWidth < layoutWidth) && (isLooping == true) {
            isLooping = false
            if _outsideBoxLeft < outsideBoxLeftRelaxed {
                isLooping = true
                _outsideBoxLeft += 1
                consumedWidth += 1
            }
            if _outsideBoxRight < outsideBoxRightRelaxed {
                isLooping = true
                _outsideBoxRight += 1
                consumedWidth += 1
            }
        }
        
        outsideBoxPaddingLeft = _outsideBoxLeft
        outsideBoxPaddingRight = _outsideBoxRight
        isTwoLine = _isTwoLine
    }
}
