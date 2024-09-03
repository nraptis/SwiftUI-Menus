//
//  MagicalIconButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import Foundation
import SwiftUI

@Observable class MagicalIconButtonViewModel: MagicalViewModel {
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    let iconButtonConfiguration: ToolInterfaceElementIconButtonConfiguration
    init(orientation: Orientation,
         iconButtonConfiguration: ToolInterfaceElementIconButtonConfiguration) {
        self.iconButtonConfiguration = iconButtonConfiguration
        super.init(orientation: orientation)
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    func handleClicked() {
        print("MagicalIconButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let textIcon = iconButtonConfiguration.getTextIcon(orientation: orientation,
                                                           isDarkMode: isDarkModeEnabled,
                                                           isEnabled: true)
        
        let iconWidth = textIcon.width
        
        let universalPaddingLeftSqueezed = IconButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .squeezed,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = IconButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = IconButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = IconButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = IconButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: .long,
                                                                          squeeze: .squeezed)
        let iconPaddingLeftStandard = IconButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: .long,
                                                                          squeeze: .standard)
        let iconPaddingRightSqueezed = IconButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: .long,
                                                                            squeeze: .squeezed)
        let iconPaddingRightStandard = IconButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: .long,
                                                                            squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        let totalWidth = layoutWidth
        
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
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
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
}
