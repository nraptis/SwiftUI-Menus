//
//  MagicalEnterModeViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation
import SwiftUI

@Observable class MagicalEnterModeViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        EnterModeLayout.self
    }
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var accentPaddingLeft = 0
    var accentPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var buttonUniversalPaddingLeft = 0
    var buttonUniversalPaddingRight = 0
    
    let enterModeConfiguration: ToolInterfaceElementEnterModeConfiguration
    @MainActor init(orientation: Orientation,
         enterModeConfiguration: ToolInterfaceElementEnterModeConfiguration) {
        self.enterModeConfiguration = enterModeConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalEnterModeViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let icon = enterModeConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                               layoutSchemeFlavor: layoutSchemeFlavor,
                                                               numberOfLines: enterModeConfiguration.nameLabelNumberOfLines,
                                                               isDarkMode: false,
                                                               
                                                               isEnabled: true)
        let accent = enterModeConfiguration.accentPack.getTextIcon(orientation: orientation,
                                                                   layoutSchemeFlavor: layoutSchemeFlavor,
                                                                   numberOfLines: enterModeConfiguration.nameLabelNumberOfLines,
                                                                   isDarkMode: false,
                                                                   isEnabled: true)
        
        let iconWidth = icon.width
        let accentWidth = accent.width
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = enterModeConfiguration.nameLabelWidthLarge
        case .stackedLarge:
            nameLabelTextWidth = enterModeConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = enterModeConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = enterModeConfiguration.nameLabelWidthSmall
        }
        
        
        
        let universalPaddingLeftSqueezed = EnterModeLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor,
                                                                                   squeeze: .squeezed,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = EnterModeLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor,
                                                                                   squeeze: .standard,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = EnterModeLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .squeezed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = EnterModeLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .standard,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        
        let buttonUniversalPaddingLeftSqueezed = EnterModeLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                              flavor: layoutSchemeFlavor,
                                                                                              squeeze: .squeezed)
        let buttonUniversalPaddingLeftStandard = EnterModeLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                              flavor: layoutSchemeFlavor,
                                                                                              squeeze: .standard)
        let buttonUniversalPaddingRightSqueezed = EnterModeLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                flavor: layoutSchemeFlavor,
                                                                                                squeeze: .squeezed)
        let buttonUniversalPaddingRightStandard = EnterModeLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                flavor: layoutSchemeFlavor,
                                                                                                squeeze: .standard)
        
        var _buttonUniversalPaddingLeft = buttonUniversalPaddingLeftSqueezed
        var _buttonUniversalPaddingRight = buttonUniversalPaddingRightSqueezed
        
        
        
        
        let nameLabelPaddingLeftSqueezed = EnterModeLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor,
                                                                                   squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = EnterModeLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                   flavor: layoutSchemeFlavor,
                                                                                   squeeze: .standard)
        let nameLabelPaddingRightSqueezed = EnterModeLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .squeezed)
        let nameLabelPaddingRightStandard = EnterModeLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        
        let iconPaddingLeftSqueezed = EnterModeLayout.getIconPaddingLeft(orientation: orientation,
                                                                         flavor: layoutSchemeFlavor,
                                                                         squeeze: .squeezed)
        let iconPaddingLeftStandard = EnterModeLayout.getIconPaddingLeft(orientation: orientation,
                                                                         flavor: layoutSchemeFlavor,
                                                                         squeeze: .standard)
        let iconPaddingRightSqueezed = EnterModeLayout.getIconPaddingRight(orientation: orientation,
                                                                           flavor: layoutSchemeFlavor,
                                                                           squeeze: .squeezed)
        let iconPaddingRightStandard = EnterModeLayout.getIconPaddingRight(orientation: orientation,
                                                                           flavor: layoutSchemeFlavor,
                                                                           squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        
        let accentPaddingLeftSqueezed = EnterModeLayout.getAccentPaddingLeft(orientation: orientation,
                                                                             flavor: layoutSchemeFlavor,
                                                                             squeeze: .squeezed)
        let accentPaddingLeftStandard = EnterModeLayout.getAccentPaddingLeft(orientation: orientation,
                                                                             flavor: layoutSchemeFlavor,
                                                                             squeeze: .standard)
        let accentPaddingRightSqueezed = EnterModeLayout.getAccentPaddingRight(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               squeeze: .squeezed)
        let accentPaddingRightStandard = EnterModeLayout.getAccentPaddingRight(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               squeeze: .standard)
        var _accentPaddingLeft = accentPaddingLeftSqueezed
        var _accentPaddingRight = accentPaddingRightSqueezed
        
        
        let totalWidth = layoutWidth
        
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
        consumedWidth += buttonUniversalPaddingLeftSqueezed
        consumedWidth += buttonUniversalPaddingRightSqueezed
        
        consumedWidth += nameLabelTextWidth
        consumedWidth += nameLabelPaddingLeftSqueezed
        consumedWidth += nameLabelPaddingRightSqueezed
        
        consumedWidth += iconWidth
        consumedWidth += iconPaddingLeftSqueezed
        consumedWidth += iconPaddingRightSqueezed
        
        consumedWidth += accentWidth
        consumedWidth += accentPaddingLeftSqueezed
        consumedWidth += accentPaddingRightSqueezed
        
        while consumedWidth < totalWidth {
            
            var didModify = false
            
            if _buttonUniversalPaddingLeft < buttonUniversalPaddingLeftStandard && consumedWidth < totalWidth {
                _buttonUniversalPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _buttonUniversalPaddingRight < buttonUniversalPaddingRightStandard && consumedWidth < totalWidth {
                _buttonUniversalPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
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
            
            if _accentPaddingLeft < accentPaddingLeftStandard && consumedWidth < totalWidth {
                _accentPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _accentPaddingRight < accentPaddingRightStandard && consumedWidth < totalWidth {
                _accentPaddingRight += 1
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
        
        accentPaddingLeft = _accentPaddingLeft
        accentPaddingRight = _accentPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        buttonUniversalPaddingLeft = _buttonUniversalPaddingLeft
        buttonUniversalPaddingRight = _buttonUniversalPaddingRight
    }
}
