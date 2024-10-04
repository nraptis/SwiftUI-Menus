//
//  MagicalSexyStepperViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSexyStepperViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SexyStepperLayout.self
    }
    
    var valueString = "|"
    
    var isIncrementEnabled = true
    var isDecrementEnabled = true
    
    var nameLabelPaddingLeft = 0
    var nameLabelPaddingRight = 0
    
    var valueLabelPaddingLeft = 0
    var valueLabelPaddingRight = 0
    
    var iconPaddingLeft = 0
    var iconPaddingRight = 0
    
    var incrementPaddingLeft = 0
    var incrementPaddingRight = 0
    
    var decrementPaddingLeft = 0
    var decrementPaddingRight = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    
    var buttonUniversalPaddingLeft = 0
    var buttonUniversalPaddingRight = 0
    
    let sexyStepperConfiguration: ToolInterfaceElementSexyStepperConfiguration
    @MainActor init(orientation: Orientation,
         sexyStepperConfiguration: ToolInterfaceElementSexyStepperConfiguration) {
        self.sexyStepperConfiguration = sexyStepperConfiguration
        super.init(orientation: orientation)
    }
    
    func handleIncrement() {
        print("MagicalSexyStepperViewModel => handleIncrement()")
    }
    
    func handleDecrement() {
        print("MagicalSexyStepperViewModel => handleDecrement()")
    }
    
    func refreshValueString(_ valueString: String) {
        if self.valueString != valueString {
            self.valueString = valueString
        }
    }
    
    func refreshIncrementEnabled(_ isIncrementEnabled: Bool) {
        if self.isIncrementEnabled != isIncrementEnabled {
            self.isIncrementEnabled = isIncrementEnabled
        }
    }
    
    func refreshDecrementEnabled(_ isDecrementEnabled: Bool) {
        if self.isDecrementEnabled != isDecrementEnabled {
            self.isDecrementEnabled = isDecrementEnabled
        }
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        let icon = sexyStepperConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                                 numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                                                 isDarkMode: false,
                                                                 isEnabled: true)
        
        let decrement = sexyStepperConfiguration.decrementPack.getTextIcon(orientation: orientation,
                                                                           layoutSchemeFlavor: layoutSchemeFlavor,
                                                                           numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                                                           isDarkMode: false,
                                                                           isEnabled: true)
        
        let increment = sexyStepperConfiguration.incrementPack.getTextIcon(orientation: orientation,
                                                                           layoutSchemeFlavor: layoutSchemeFlavor,
                                                                           numberOfLines: sexyStepperConfiguration.nameLabelNumberOfLines,
                                                                           isDarkMode: false,
                                                                           isEnabled: true)
        
        let iconWidth = icon.width
        let incrementWidth = increment.width
        let decrementWidth = decrement.width
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            nameLabelTextWidth = sexyStepperConfiguration.nameLabelWidthLarge
        case .stackedLarge:
            nameLabelTextWidth = sexyStepperConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = sexyStepperConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = sexyStepperConfiguration.nameLabelWidthSmall
        }
        
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long:
            valueLabelTextWidth = sexyStepperConfiguration.valueLabelWidthLarge
        case .stackedLarge:
            valueLabelTextWidth = sexyStepperConfiguration.valueLabelWidthLarge
        case .stackedMedium:
            valueLabelTextWidth = sexyStepperConfiguration.valueLabelWidthMedium
        case .stackedSmall:
            valueLabelTextWidth = sexyStepperConfiguration.valueLabelWidthSmall
        }
        
        let universalPaddingLeftSqueezed = SexyStepperLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .squeezed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = SexyStepperLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .standard,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = SexyStepperLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .squeezed,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = SexyStepperLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .standard,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let buttonUniversalPaddingLeftSqueezed = SexyStepperLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                 flavor: layoutSchemeFlavor,
                                                                                                 squeeze: .squeezed)
        let buttonUniversalPaddingLeftStandard = SexyStepperLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                 flavor: layoutSchemeFlavor,
                                                                                                 squeeze: .standard)
        let buttonUniversalPaddingRightSqueezed = SexyStepperLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                   flavor: layoutSchemeFlavor,
                                                                                                   squeeze: .squeezed)
        let buttonUniversalPaddingRightStandard = SexyStepperLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                   flavor: layoutSchemeFlavor,
                                                                                                   squeeze: .standard)
        
        var _buttonUniversalPaddingLeft = buttonUniversalPaddingLeftSqueezed
        var _buttonUniversalPaddingRight = buttonUniversalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = SexyStepperLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = SexyStepperLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .standard)
        let nameLabelPaddingRightSqueezed = SexyStepperLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .squeezed)
        let nameLabelPaddingRightStandard = SexyStepperLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        let valueLabelPaddingLeftSqueezed = SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .squeezed)
        let valueLabelPaddingLeftStandard = SexyStepperLayout.getValueLabelPaddingLeft(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .standard)
        let valueLabelPaddingRightSqueezed = SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                         flavor: layoutSchemeFlavor,
                                                                                         squeeze: .squeezed)
        let valueLabelPaddingRightStandard = SexyStepperLayout.getValueLabelPaddingRight(orientation: orientation,
                                                                                         flavor: layoutSchemeFlavor,
                                                                                         squeeze: .standard)
        var _valueLabelPaddingLeft = valueLabelPaddingLeftSqueezed
        var _valueLabelPaddingRight = valueLabelPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = SexyStepperLayout.getIconPaddingLeft(orientation: orientation,
                                                                           flavor: layoutSchemeFlavor,
                                                                           squeeze: .squeezed)
        let iconPaddingLeftStandard = SexyStepperLayout.getIconPaddingLeft(orientation: orientation,
                                                                           flavor: layoutSchemeFlavor,
                                                                           squeeze: .standard)
        let iconPaddingRightSqueezed = SexyStepperLayout.getIconPaddingRight(orientation: orientation,
                                                                             flavor: layoutSchemeFlavor,
                                                                             squeeze: .squeezed)
        let iconPaddingRightStandard = SexyStepperLayout.getIconPaddingRight(orientation: orientation,
                                                                             flavor: layoutSchemeFlavor,
                                                                             squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        let incrementPaddingLeftSqueezed = SexyStepperLayout.getIncrementPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .squeezed)
        let incrementPaddingLeftStandard = SexyStepperLayout.getIncrementPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .standard)
        let incrementPaddingRightSqueezed = SexyStepperLayout.getIncrementPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .squeezed)
        let incrementPaddingRightStandard = SexyStepperLayout.getIncrementPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .standard)
        var _incrementPaddingLeft = incrementPaddingLeftSqueezed
        var _incrementPaddingRight = incrementPaddingRightSqueezed
        
        let decrementPaddingLeftSqueezed = SexyStepperLayout.getDecrementPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .squeezed)
        let decrementPaddingLeftStandard = SexyStepperLayout.getDecrementPaddingLeft(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     squeeze: .standard)
        let decrementPaddingRightSqueezed = SexyStepperLayout.getDecrementPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .squeezed)
        let decrementPaddingRightStandard = SexyStepperLayout.getDecrementPaddingRight(orientation: orientation,
                                                                                       flavor: layoutSchemeFlavor,
                                                                                       squeeze: .standard)
        var _decrementPaddingLeft = decrementPaddingLeftSqueezed
        var _decrementPaddingRight = decrementPaddingRightSqueezed
        
        let totalWidth = layoutWidth
        
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
        consumedWidth += buttonUniversalPaddingLeftSqueezed
        consumedWidth += buttonUniversalPaddingRightSqueezed
        
        consumedWidth += nameLabelTextWidth
        consumedWidth += nameLabelPaddingLeftSqueezed
        consumedWidth += nameLabelPaddingRightSqueezed
        
        consumedWidth += valueLabelTextWidth
        consumedWidth += valueLabelPaddingLeftSqueezed
        consumedWidth += valueLabelPaddingRightSqueezed
        
        consumedWidth += iconWidth
        consumedWidth += iconPaddingLeftSqueezed
        consumedWidth += iconPaddingRightSqueezed
        
        consumedWidth += incrementWidth
        consumedWidth += incrementPaddingLeftSqueezed
        consumedWidth += incrementPaddingRightSqueezed
        
        consumedWidth += decrementWidth
        consumedWidth += decrementPaddingLeftSqueezed
        consumedWidth += decrementPaddingRightSqueezed
        
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
            
            if _incrementPaddingLeft < incrementPaddingLeftStandard && consumedWidth < totalWidth {
                _incrementPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _incrementPaddingRight < incrementPaddingRightStandard && consumedWidth < totalWidth {
                _incrementPaddingRight += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _decrementPaddingLeft < decrementPaddingLeftStandard && consumedWidth < totalWidth {
                _decrementPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _decrementPaddingRight < decrementPaddingRightStandard && consumedWidth < totalWidth {
                _decrementPaddingRight += 1
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
            
            if _valueLabelPaddingLeft < valueLabelPaddingLeftStandard && consumedWidth < totalWidth {
                _valueLabelPaddingLeft += 1
                consumedWidth += 1
                didModify = true
            }
            
            if _valueLabelPaddingRight < valueLabelPaddingRightStandard && consumedWidth < totalWidth {
                _valueLabelPaddingRight += 1
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
        
        valueLabelPaddingLeft = _valueLabelPaddingLeft
        valueLabelPaddingRight = _valueLabelPaddingRight
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        incrementPaddingLeft = _incrementPaddingLeft
        incrementPaddingRight = _incrementPaddingRight
        
        decrementPaddingLeft = _decrementPaddingLeft
        decrementPaddingRight = _decrementPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
        
        buttonUniversalPaddingLeft = _buttonUniversalPaddingLeft
        buttonUniversalPaddingRight = _buttonUniversalPaddingRight
    }
}
