//
//  MagicalSexyCheckBoxViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSexyCheckBoxViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SexyCheckBoxLayout.self
    }
    
    static var checkBoxSquare: MainTabIconPack {
        MainTabIconLibrary.checkBoxSquare
    }
    
    static var checkBoxCheck: MainTabIconPack {
        MainTabIconLibrary.checkBoxCheck
    }
    
    @MainActor var isChecked = false
    
    @MainActor var nameLabelPaddingLeft = 0
    @MainActor var nameLabelPaddingRight = 0
    
    @MainActor var iconPaddingLeft = 0
    @MainActor var iconPaddingRight = 0
    
    @MainActor var checkBoxPaddingLeft = 0
    @MainActor var checkBoxPaddingRight = 0
    
    @MainActor var universalPaddingLeft = 0
    @MainActor var universalPaddingRight = 0
    
    @MainActor var buttonUniversalPaddingLeft = 0
    @MainActor var buttonUniversalPaddingRight = 0
    
    let sexyCheckBoxConfiguration: ToolInterfaceElementSexyCheckBoxConfiguration
    @MainActor init(orientation: Orientation,
         sexyCheckBoxConfiguration: ToolInterfaceElementSexyCheckBoxConfiguration) {
        self.sexyCheckBoxConfiguration = sexyCheckBoxConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalExitModeViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let icon = sexyCheckBoxConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                  layoutSchemeFlavor: layoutSchemeFlavor,
                                                                  numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                                                  isDarkMode: false,
                                                                  
                                                                  isEnabled: true)
        let checkBoxSquare = Self.checkBoxSquare.getTextIcon(orientation: orientation,
                                                             layoutSchemeFlavor: layoutSchemeFlavor,
                                                             numberOfLines: sexyCheckBoxConfiguration.nameLabelNumberOfLines,
                                                             isDarkMode: false,
                                                             isEnabled: true)
        
        let iconWidth = icon.width
        let checkBoxWidth = checkBoxSquare.width
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = sexyCheckBoxConfiguration.nameLabelWidthLarge
        case .stackedLarge:
            nameLabelTextWidth = sexyCheckBoxConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = sexyCheckBoxConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = sexyCheckBoxConfiguration.nameLabelWidthSmall
        }
        
        let universalPaddingLeftSqueezed = SexyCheckBoxLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = SexyCheckBoxLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = SexyCheckBoxLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = SexyCheckBoxLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let buttonUniversalPaddingLeftSqueezed = SexyCheckBoxLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: layoutSchemeFlavor,
                                                                                                  squeeze: .squeezed)
        let buttonUniversalPaddingLeftStandard = SexyCheckBoxLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: layoutSchemeFlavor,
                                                                                                  squeeze: .standard)
        let buttonUniversalPaddingRightSqueezed = SexyCheckBoxLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: layoutSchemeFlavor,
                                                                                                    squeeze: .squeezed)
        let buttonUniversalPaddingRightStandard = SexyCheckBoxLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: layoutSchemeFlavor,
                                                                                                    squeeze: .standard)
        
        var _buttonUniversalPaddingLeft = buttonUniversalPaddingLeftSqueezed
        var _buttonUniversalPaddingRight = buttonUniversalPaddingRightSqueezed
        
        
        
        
        let nameLabelPaddingLeftSqueezed = SexyCheckBoxLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = SexyCheckBoxLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard)
        let nameLabelPaddingRightSqueezed = SexyCheckBoxLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed)
        let nameLabelPaddingRightStandard = SexyCheckBoxLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        
        let iconPaddingLeftSqueezed = SexyCheckBoxLayout.getIconPaddingLeft(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            squeeze: .squeezed)
        let iconPaddingLeftStandard = SexyCheckBoxLayout.getIconPaddingLeft(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            squeeze: .standard)
        let iconPaddingRightSqueezed = SexyCheckBoxLayout.getIconPaddingRight(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .squeezed)
        let iconPaddingRightStandard = SexyCheckBoxLayout.getIconPaddingRight(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        let checkBoxPaddingLeftSqueezed = SexyCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed)
        let checkBoxPaddingLeftStandard = SexyCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard)
        let checkBoxPaddingRightSqueezed = SexyCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed)
        let checkBoxPaddingRightStandard = SexyCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard)
        var _checkBoxPaddingLeft = checkBoxPaddingLeftSqueezed
        var _checkBoxPaddingRight = checkBoxPaddingRightSqueezed
        
        
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
        
        consumedWidth += checkBoxWidth
        consumedWidth += checkBoxPaddingLeftSqueezed
        consumedWidth += checkBoxPaddingRightSqueezed
        
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
            
            if _checkBoxPaddingLeft < checkBoxPaddingLeftStandard && consumedWidth < totalWidth {
                _checkBoxPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _checkBoxPaddingRight < checkBoxPaddingRightStandard && consumedWidth < totalWidth {
                _checkBoxPaddingRight += 1
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
        
        checkBoxPaddingLeft = _checkBoxPaddingLeft
        checkBoxPaddingRight = _checkBoxPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        buttonUniversalPaddingLeft = _buttonUniversalPaddingLeft
        buttonUniversalPaddingRight = _buttonUniversalPaddingRight
    }
}
