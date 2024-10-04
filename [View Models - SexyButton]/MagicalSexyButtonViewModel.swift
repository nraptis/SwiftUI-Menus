//
//  MagicalSexyButtonViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSexyButtonViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SexyButtonLayout.self
    }
    
    @MainActor var nameLabelPaddingLeft = 0
    @MainActor var nameLabelPaddingRight = 0
    
    @MainActor var iconPaddingLeft = 0
    @MainActor var iconPaddingRight = 0
    
    @MainActor var universalPaddingLeft = 0
    @MainActor var universalPaddingRight = 0
    
    let sexyButtonConfiguration: ToolInterfaceElementSexyButtonConfiguration
    @MainActor init(orientation: Orientation,
         sexyButtonConfiguration: ToolInterfaceElementSexyButtonConfiguration) {
        self.sexyButtonConfiguration = sexyButtonConfiguration
        super.init(orientation: orientation)
    }
    
    func handleClicked() {
        print("MagicalSexyButtonViewModel => handleClicked()")
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        let textIcon = sexyButtonConfiguration.iconPack.getTextIcon(orientation: orientation,
                                                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                                                    numberOfLines: sexyButtonConfiguration.nameLabelNumberOfLines,
                                                                    isDarkMode: isDarkModeEnabled,
                                                                    isEnabled: isEnabled)
        let isStacked = layoutSchemeFlavor.isStacked
        
        let iconWidth = textIcon.width
        
        let nameLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .stackedLarge, .long:
            nameLabelTextWidth = sexyButtonConfiguration.nameLabelWidthLarge
        case .stackedMedium:
            nameLabelTextWidth = sexyButtonConfiguration.nameLabelWidthMedium
        case .stackedSmall:
            nameLabelTextWidth = sexyButtonConfiguration.nameLabelWidthSmall
        }
        
        let universalPaddingLeftSqueezed = SexyButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = SexyButtonLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = SexyButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = SexyButtonLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = SexyButtonLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = SexyButtonLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    squeeze: .standard)
        let nameLabelPaddingRightSqueezed = SexyButtonLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed)
        let nameLabelPaddingRightStandard = SexyButtonLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard)
        var _nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
        var _nameLabelPaddingRight = nameLabelPaddingRightSqueezed
        
        let iconPaddingLeftSqueezed = SexyButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: layoutSchemeFlavor,
                                                                          squeeze: .squeezed)
        let iconPaddingLeftStandard = SexyButtonLayout.getIconPaddingLeft(orientation: orientation,
                                                                          flavor: layoutSchemeFlavor,
                                                                          squeeze: .standard)
        let iconPaddingRightSqueezed = SexyButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            squeeze: .squeezed)
        let iconPaddingRightStandard = SexyButtonLayout.getIconPaddingRight(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            squeeze: .standard)
        var _iconPaddingLeft = iconPaddingLeftSqueezed
        var _iconPaddingRight = iconPaddingRightSqueezed
        
        let totalWidth = layoutWidth
        
        if isStacked {
            var consumedBaseWidth = Int(0)
            consumedBaseWidth += universalPaddingRightSqueezed
            consumedBaseWidth += universalPaddingLeftSqueezed
            
            var consumedWidth = 0
            while true {
                
                if _universalPaddingLeft >= universalPaddingLeftStandard &&
                    _universalPaddingRight >= universalPaddingRightStandard &&
                    _nameLabelPaddingLeft >= nameLabelPaddingLeftStandard &&
                    _nameLabelPaddingRight >= nameLabelPaddingRightStandard &&
                    _iconPaddingLeft >= iconPaddingLeftStandard &&
                    _iconPaddingRight >= iconPaddingRightStandard {
                    break
                }
                
                var didModify = false
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
        }
        
        nameLabelPaddingLeft = _nameLabelPaddingLeft
        nameLabelPaddingRight = _nameLabelPaddingRight
        
        iconPaddingLeft = _iconPaddingLeft
        iconPaddingRight = _iconPaddingRight
        
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
}
