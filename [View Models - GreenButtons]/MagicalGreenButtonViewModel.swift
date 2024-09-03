//
//  MagicalGreenButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
import SwiftUI

@Observable class MagicalGreenButtonViewModel: MagicalViewModel {
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    let greenButtonConfiguration: ToolInterfaceElementGreenButtonConfiguration
    init(orientation: Orientation,
         greenButtonConfiguration: ToolInterfaceElementGreenButtonConfiguration) {
        self.greenButtonConfiguration = greenButtonConfiguration
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
        let textIcon = greenButtonConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                     layoutSchemeFlavor: layoutSchemeFlavor,
                                                                     numberOfLines: greenButtonConfiguration.nameLabelNumberOfLines,
                                                                     isDarkMode: false,
                                                                     isEnabled: true)
        
        let iconWidth = textIcon.width
        
        let nameLabelTextWidth = greenButtonConfiguration.nameLabelWidth
        
        let universalPaddingLeftSqueezed = GreenButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = GreenButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = GreenButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = GreenButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard,
                                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                                          neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = GreenButtonLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = GreenButtonLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard)
        let nameLabelPaddingRightSqueezed = GreenButtonLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .squeezed)
        let nameLabelPaddingRightStandard = GreenButtonLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                          flavor: layoutSchemeFlavor,
                                                                                          squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = GreenButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .squeezed)
        let iconPaddingLeftStandard = GreenButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .standard)
        let iconPaddingRightSqueezed = GreenButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .squeezed)
        let iconPaddingRightStandard = GreenButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        
        let totalWidth = layoutWidth
        
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
        consumedWidth += nameLabelTextWidth
        consumedWidth += nameLabelPaddingLeftSqueezed
        consumedWidth += nameLabelPaddingRightSqueezed
        
        consumedWidth += iconWidth
        consumedWidth += iconPaddingLeftSqueezed
        consumedWidth += iconPaddingRightSqueezed
        
        while consumedWidth < totalWidth {
            
            var didModify = false
            
            if _iconPaddingLeft < iconPaddingLeftStandard && consumedWidth < totalWidth {
                _iconPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _iconPaddingRight < iconPaddingRightStandard && consumedWidth < totalWidth {
                _iconPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _nameLabelPaddingLeft < nameLabelPaddingLeftStandard && consumedWidth < totalWidth {
                _nameLabelPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _nameLabelPaddingRight < nameLabelPaddingRightStandard && consumedWidth < totalWidth {
                _nameLabelPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _universalPaddingLeft < universalPaddingLeftStandard && consumedWidth < totalWidth {
                _universalPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _universalPaddingRight < universalPaddingRightStandard && consumedWidth < totalWidth {
                _universalPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if didModify == false {
                break
            }
        }
        
        while consumedWidth < totalWidth {
            if consumedWidth < totalWidth {
                _universalPaddingRight += 1
                consumedWidth += 1
            }
            if consumedWidth < totalWidth {
                _universalPaddingLeft += 1
                consumedWidth += 1
            }
        }
        
        nameLabelPaddingLeft = _nameLabelPaddingLeft
        nameLabelPaddingRight = _nameLabelPaddingRight
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
}
