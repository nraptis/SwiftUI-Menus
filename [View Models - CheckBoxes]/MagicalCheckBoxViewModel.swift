//
//  MagicalCheckBoxViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import Foundation
import SwiftUI

@Observable class MagicalCheckBoxViewModel: MagicalViewModel {
    
    var isChecked = false
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var checkBoxPaddingLeft = 0
    var checkBoxPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var buttonUniversalPaddingLeft = 0
    var buttonUniversalPaddingRight = 0
    
    var checkBoxWidth = 128
    var checkBoxHeight = 32
    
    let checkBoxConfiguration: ToolInterfaceElementCheckBoxConfiguration
    
    init(orientation: Orientation,
         checkBoxConfiguration: ToolInterfaceElementCheckBoxConfiguration) {
        self.checkBoxConfiguration = checkBoxConfiguration
        super.init(orientation: orientation)
    }
    
    override func refresh() {
        
    }
    
    override func refreshDisabled() {
        super.refreshDisabled()
    }
    
    override func refreshEnabled() {
        super.refreshEnabled()
    }
    
    func handleClicked() {
        print("MagicalCheckBoxViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {

        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let textIcon = checkBoxConfiguration.getTextIcon(orientation: orientation,
                                                         layoutSchemeFlavor: layoutSchemeFlavor,
                                                         isDarkMode: false,
                                                         isEnabled: true)
        
        let isStacked = layoutSchemeFlavor.isStacked
        
        let iconWidth = textIcon.width
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = checkBoxConfiguration.nameLabelWidthLong
        case .stackedLarge:
            nameLabelTextWidth = checkBoxConfiguration.nameLabelWidthStackedLarge
        case .stackedMedium:
            nameLabelTextWidth = checkBoxConfiguration.nameLabelWidthStackedMedium
        case .stackedSmall:
            nameLabelTextWidth = checkBoxConfiguration.nameLabelWidthStackedSmall
        }
        
        let universalPaddingLeftSqueezed = CheckBoxLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = CheckBoxLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = CheckBoxLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = CheckBoxLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        
        let buttonUniversalPaddingLeftSqueezed = CheckBoxLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                              flavor: layoutSchemeFlavor,
                                                                                              squeeze: .squeezed)
        let buttonUniversalPaddingLeftStandard = CheckBoxLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                              flavor: layoutSchemeFlavor,
                                                                                              squeeze: .standard)
        let buttonUniversalPaddingRightSqueezed = CheckBoxLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                flavor: layoutSchemeFlavor,
                                                                                                squeeze: .squeezed)
        let buttonUniversalPaddingRightStandard = CheckBoxLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                flavor: layoutSchemeFlavor,
                                                                                                squeeze: .standard)
        
        var _buttonUniversalPaddingLeft = buttonUniversalPaddingLeftSqueezed
        var _buttonUniversalPaddingRight = buttonUniversalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = CheckBoxLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = CheckBoxLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard)
        let nameLabelPaddingRightSqueezed = CheckBoxLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed)
        let nameLabelPaddingRightStandard = CheckBoxLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard)
        
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = CheckBoxLayout.getIconPaddingLeft(orientation: orientation,
                                                                        flavor: layoutSchemeFlavor,
                                                                        squeeze: .squeezed)
        let iconPaddingLeftStandard = CheckBoxLayout.getIconPaddingLeft(orientation: orientation,
                                                                        flavor: layoutSchemeFlavor,
                                                                        squeeze: .standard)
        let iconPaddingRightSqueezed = CheckBoxLayout.getIconPaddingRight(orientation: orientation,
                                                                          flavor: layoutSchemeFlavor,
                                                                          squeeze: .squeezed)
        let iconPaddingRightStandard = CheckBoxLayout.getIconPaddingRight(orientation: orientation,
                                                                          flavor: layoutSchemeFlavor,
                                                                          squeeze: .standard)
        
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        let checkBoxPaddingLeftSqueezed = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .squeezed)
        let checkBoxPaddingLeftStandard = CheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor,
                                                                                squeeze: .standard)
        let checkBoxPaddingRightSqueezed = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .squeezed)
        let checkBoxPaddingRightStandard = CheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                  flavor: layoutSchemeFlavor,
                                                                                  squeeze: .standard)
        
        var _checkBoxPaddingLeft = checkBoxPaddingLeftSqueezed
        var _checkBoxPaddingRight = checkBoxPaddingRightSqueezed
        
        
        
        
        let checkBoxWidthSqueezed = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                    flavor: layoutSchemeFlavor,
                                                                    squeeze: .squeezed)
        let checkBoxWidthStandard = CheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                    flavor: layoutSchemeFlavor,
                                                                    squeeze: .standard)
        
        var _checkBoxWidth = checkBoxWidthSqueezed
        
        
        let totalWidth = layoutWidth
        if isStacked {
            var consumedBaseWidth = Int(0)
            consumedBaseWidth += universalPaddingRightSqueezed
            consumedBaseWidth += universalPaddingLeftSqueezed
            
            consumedBaseWidth += buttonUniversalPaddingRightSqueezed
            consumedBaseWidth += buttonUniversalPaddingLeftSqueezed
            
            consumedBaseWidth += checkBoxWidthSqueezed
            consumedBaseWidth += checkBoxPaddingLeftSqueezed
            consumedBaseWidth += checkBoxPaddingRightSqueezed
            
            var consumedWidth = 0
            while true {
                
                if _universalPaddingLeft >= universalPaddingLeftStandard &&
                    _universalPaddingRight >= universalPaddingRightStandard &&
                    _buttonUniversalPaddingLeft >= buttonUniversalPaddingLeftStandard &&
                    _buttonUniversalPaddingRight >= buttonUniversalPaddingRightStandard &&
                    _nameLabelPaddingLeft >= nameLabelPaddingLeftStandard &&
                    _nameLabelPaddingRight >= nameLabelPaddingRightStandard &&
                    _iconPaddingLeft >= iconPaddingLeftStandard &&
                    _iconPaddingRight >= iconPaddingRightStandard &&
                    _checkBoxWidth >= checkBoxWidthStandard &&
                    _checkBoxPaddingLeft >= checkBoxPaddingLeftStandard &&
                    _checkBoxPaddingRight >= checkBoxPaddingRightStandard {
                    break
                }
                
                    
                var didModify = false
                
                
                
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                
                if _buttonUniversalPaddingLeft < buttonUniversalPaddingLeftStandard && consumedWidth < totalWidth {
                    _buttonUniversalPaddingLeft += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _buttonUniversalPaddingRight < buttonUniversalPaddingRightStandard && consumedWidth < totalWidth {
                    _buttonUniversalPaddingRight += 1
                    consumedBaseWidth += 1
                    didModify = true
                }

                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _iconPaddingLeft < iconPaddingLeftStandard && consumedWidth < totalWidth {
                    _iconPaddingLeft += 1
                    didModify = true
                }
                
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _iconPaddingRight < iconPaddingRightStandard && consumedWidth < totalWidth {
                    _iconPaddingRight += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _nameLabelPaddingLeft < nameLabelPaddingLeftStandard && consumedWidth < totalWidth {
                    _nameLabelPaddingLeft += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _nameLabelPaddingRight < nameLabelPaddingRightStandard && consumedWidth < totalWidth {
                    _nameLabelPaddingRight += 1
                    didModify = true
                }
                
                
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                
                if _checkBoxWidth < checkBoxWidthStandard && consumedWidth < totalWidth {
                    _checkBoxWidth += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                
                if _checkBoxPaddingLeft < checkBoxPaddingLeftStandard && consumedWidth < totalWidth {
                    _checkBoxPaddingLeft += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                
                if _checkBoxPaddingRight < checkBoxPaddingRightStandard && consumedWidth < totalWidth {
                    _checkBoxPaddingRight += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                
                if _universalPaddingLeft < universalPaddingLeftStandard && consumedWidth < totalWidth {
                    _universalPaddingLeft += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                consumedWidth = consumedBaseWidth + calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                                  textPaddingLeft: _nameLabelPaddingLeft,
                                                                                  textPaddingRight: _nameLabelPaddingRight,
                                                                                  imageWidth: iconWidth,
                                                                                  imagePaddingLeft: _iconPaddingLeft,
                                                                                  imagePaddingRight: _iconPaddingRight)
                if _universalPaddingRight < universalPaddingRightStandard && consumedWidth < totalWidth {
                    _universalPaddingRight += 1
                    consumedBaseWidth += 1
                    didModify = true
                }
                
                
                if didModify == false {
                    break
                }
                
            }
            
            let consumedStackWidth = calculateStackedConsumedWidth(textWidth: nameLabelTextWidth,
                                                                   textPaddingLeft: _nameLabelPaddingLeft,
                                                                   textPaddingRight: _nameLabelPaddingRight,
                                                                   imageWidth: iconWidth,
                                                                   imagePaddingLeft: _iconPaddingLeft,
                                                                   imagePaddingRight: _iconPaddingRight)
            consumedWidth = consumedBaseWidth + consumedStackWidth
            
            while true {
                
                if consumedWidth >= totalWidth { break }
                
                _universalPaddingRight += 1
                consumedWidth += 1
                
                if consumedWidth >= totalWidth { break }
                
                _universalPaddingLeft += 1
                consumedWidth += 1
            }
            
        } else {
            
            var consumedWidth = Int(0)
            consumedWidth += universalPaddingLeftSqueezed
            consumedWidth += universalPaddingRightSqueezed
            
            consumedWidth += buttonUniversalPaddingLeftSqueezed
            consumedWidth += buttonUniversalPaddingRightSqueezed
            
            consumedWidth += nameLabelTextWidth
            consumedWidth += nameLabelPaddingLeftSqueezed
            consumedWidth += nameLabelPaddingRightSqueezed
            
            consumedWidth += iconWidth
            consumedWidth += iconPaddingLeftSqueezed
            consumedWidth += iconPaddingRightSqueezed
            
            consumedWidth += checkBoxWidthSqueezed
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
                
                if _checkBoxWidth < checkBoxWidthStandard && consumedWidth < totalWidth {
                    _checkBoxWidth += 1
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
        }
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        buttonUniversalPaddingLeft = _buttonUniversalPaddingLeft
        buttonUniversalPaddingRight = _buttonUniversalPaddingRight
        
        nameLabelPaddingLeft = _nameLabelPaddingLeft
        nameLabelPaddingRight = _nameLabelPaddingRight
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        checkBoxPaddingLeft = _checkBoxPaddingLeft
        checkBoxPaddingRight = _checkBoxPaddingRight
        
        checkBoxWidth = _checkBoxWidth
        checkBoxHeight = _checkBoxWidth
    }
    
}
