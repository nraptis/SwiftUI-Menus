//
//  MagicalCreateSwatchViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation
import SwiftUI

@Observable class MagicalCreateSwatchViewModel: MagicalViewModel {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModel - Dealloc")
        }
    }
    
    var selectedSegmentIndex = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    let createSwatchConfiguration: ToolInterfaceElementCreateSwatchConfiguration
    
    let buttonViewModels: [MagicalCreateSwatchButtonViewModel]
    let layoutNodes: [MagicalCreateSwatchButtonLayoutNode]
    init(orientation: Orientation,
         createSwatchConfiguration: ToolInterfaceElementCreateSwatchConfiguration) {
        
        self.createSwatchConfiguration = createSwatchConfiguration
        
        var _buttonViewModels = [MagicalCreateSwatchButtonViewModel]()
        var _layoutNodes = [MagicalCreateSwatchButtonLayoutNode]()
        for buttonConfiguration in createSwatchConfiguration.buttonConfigurations {
            let buttonViewModel = MagicalCreateSwatchButtonViewModel(orientation: orientation,
                                                                     createSwatchButtonConfiguration: buttonConfiguration)
            _buttonViewModels.append(buttonViewModel)
            let layoutNode = MagicalCreateSwatchButtonLayoutNode(CreateSwatchButtonConfiguration: buttonConfiguration)
            _layoutNodes.append(layoutNode)
        }
        
        self.buttonViewModels = _buttonViewModels
        
        self.layoutNodes = _layoutNodes
        
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
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        let universalPaddingLeftSqueezed = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingLeftStandard = CreateSwatchLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let universalPaddingRightSqueezed = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        let universalPaddingRightStandard = CreateSwatchLayout.getUniversalPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        let buttonUniversalPaddingLeftSqueezed = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: layoutSchemeFlavor,
                                                                                                  squeeze: .squeezed)
        let buttonUniversalPaddingLeftStandard = CreateSwatchLayout.getButtonUniversalPaddingLeft(orientation: orientation,
                                                                                                  flavor: layoutSchemeFlavor,
                                                                                                  squeeze: .standard)
        let buttonUniversalPaddingRightSqueezed = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: layoutSchemeFlavor,
                                                                                                    squeeze: .squeezed)
        let buttonUniversalPaddingRightStandard = CreateSwatchLayout.getButtonUniversalPaddingRight(orientation: orientation,
                                                                                                    flavor: layoutSchemeFlavor,
                                                                                                    squeeze: .standard)
        
        var _universalPaddingLeft = universalPaddingLeftSqueezed
        var _universalPaddingRight = universalPaddingRightSqueezed
        
        let nameLabelPaddingLeftSqueezed = CreateSwatchLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .squeezed)
        let nameLabelPaddingLeftStandard = CreateSwatchLayout.getNameLabelPaddingLeft(orientation: orientation,
                                                                                      flavor: layoutSchemeFlavor,
                                                                                      squeeze: .standard)
        let nameLabelPaddingRightSqueezed = CreateSwatchLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .squeezed)
        let nameLabelPaddingRightStandard = CreateSwatchLayout.getNameLabelPaddingRight(orientation: orientation,
                                                                                        flavor: layoutSchemeFlavor,
                                                                                        squeeze: .standard)
        
        let iconPaddingLeftSqueezed = CreateSwatchLayout.getIconPaddingLeft(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            squeeze: .squeezed)
        let iconPaddingLeftStandard = CreateSwatchLayout.getIconPaddingLeft(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            squeeze: .standard)
        let iconPaddingRightSqueezed = CreateSwatchLayout.getIconPaddingRight(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .squeezed)
        let iconPaddingRightStandard = CreateSwatchLayout.getIconPaddingRight(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              squeeze: .standard)
        
        let totalWidth = layoutWidth
        
        for layoutIndex in 0..<layoutNodes.count {
            let layoutNode = layoutNodes[layoutIndex]
            let buttonViewModel = buttonViewModels[layoutIndex]
            
            let textIcon = buttonViewModel.createSwatchButtonConfiguration.getTextIcon(orientation: orientation,
                                                                                       layoutSchemeFlavor: layoutSchemeFlavor,
                                                                                       isDarkMode: isDarkModeEnabled,
                                                                                       isEnabled: isEnabled)
            
            layoutNode.universalPaddingLeft = buttonUniversalPaddingLeftSqueezed
            layoutNode.universalPaddingRight = buttonUniversalPaddingRightSqueezed
            
            layoutNode.iconPaddingLeft = iconPaddingLeftSqueezed
            layoutNode.iconPaddingRight = iconPaddingRightSqueezed
            
            layoutNode.nameLabelPaddingLeft = nameLabelPaddingLeftSqueezed
            layoutNode.nameLabelPaddingRight = nameLabelPaddingRightSqueezed
            
            layoutNode.prepareForLayout(layoutSchemeFlavor: layoutSchemeFlavor, textIcon: textIcon)
        }
        
        var consumedWidth = Int(0)
        consumedWidth += universalPaddingRightSqueezed
        consumedWidth += universalPaddingLeftSqueezed
        
        for layoutNode in layoutNodes {
            consumedWidth += layoutNode.universalPaddingLeft
            consumedWidth += layoutNode.universalPaddingRight
            
            consumedWidth += layoutNode.nameLabelWidth
            consumedWidth += layoutNode.nameLabelPaddingLeft
            consumedWidth += layoutNode.nameLabelPaddingRight
            
            consumedWidth += layoutNode.iconWidth
            consumedWidth += layoutNode.iconPaddingLeft
            consumedWidth += layoutNode.iconPaddingRight
        }
        
        while consumedWidth < totalWidth {
            var didModify = false
            for layoutNode in layoutNodes {
                if layoutNode.iconPaddingLeft < iconPaddingLeftStandard && consumedWidth < totalWidth {
                    layoutNode.iconPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                if layoutNode.iconPaddingRight < iconPaddingRightStandard && consumedWidth < totalWidth {
                    layoutNode.iconPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
                if layoutNode.nameLabelPaddingLeft < nameLabelPaddingLeftStandard && consumedWidth < totalWidth {
                    layoutNode.nameLabelPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                if layoutNode.nameLabelPaddingRight < nameLabelPaddingRightStandard && consumedWidth < totalWidth {
                    layoutNode.nameLabelPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
                if layoutNode.universalPaddingLeft < buttonUniversalPaddingLeftStandard && consumedWidth < totalWidth {
                    layoutNode.universalPaddingLeft += 1
                    consumedWidth += 1
                    didModify = true
                }
                if layoutNode.universalPaddingRight < buttonUniversalPaddingRightStandard && consumedWidth < totalWidth {
                    layoutNode.universalPaddingRight += 1
                    consumedWidth += 1
                    didModify = true
                }
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
        
        
        // Now there may be some space left over, distribute first to the smallest, then ubiquitously
        
        for layoutNode in layoutNodes {
            let width1 = layoutNode.nameLabelWidth + layoutNode.nameLabelPaddingLeft + layoutNode.nameLabelPaddingRight
            let width2 = layoutNode.iconWidth + layoutNode.iconPaddingLeft + layoutNode.iconPaddingRight
            layoutNode.width = width1 + width2 + layoutNode.universalPaddingLeft + layoutNode.universalPaddingRight
        }
        
        
        var howMuchSpaceWeAreUsingSoFar = 0
        howMuchSpaceWeAreUsingSoFar += _universalPaddingLeft
        howMuchSpaceWeAreUsingSoFar += _universalPaddingRight
        for layoutNode in layoutNodes {
            howMuchSpaceWeAreUsingSoFar += layoutNode.width
        }
        
        if layoutNodes.count > 0 {
            while howMuchSpaceWeAreUsingSoFar < totalWidth {
                
                var largestWidth = layoutNodes[0].width
                var smallestWidth = largestWidth
                var smallestIndex = 0
                
                for layoutIndex in 0..<layoutNodes.count {
                    let layoutNode = layoutNodes[layoutIndex]
                    let width = layoutNode.width
                    if width > largestWidth {
                        largestWidth = width
                    }
                    if width < smallestWidth {
                        smallestWidth = width
                        smallestIndex = layoutIndex
                    }
                    largestWidth = max(largestWidth, layoutNode.width)
                }
                
                if smallestWidth == largestWidth {
                    break
                }
                layoutNodes[smallestIndex].width += 1
                howMuchSpaceWeAreUsingSoFar += 1
            }
            
            while howMuchSpaceWeAreUsingSoFar < totalWidth {
                for layoutIndex in 0..<layoutNodes.count {
                    let layoutNode = layoutNodes[layoutIndex]
                    if howMuchSpaceWeAreUsingSoFar < totalWidth {
                        layoutNode.width += 1
                        howMuchSpaceWeAreUsingSoFar += 1
                    }
                }
            }
        }
        
        var x = 0
        for layoutNode in layoutNodes {
            layoutNode.x = x
            x += layoutNode.width
        }
        
        for layoutIndex in 0..<layoutNodes.count {
            let layoutNode = layoutNodes[layoutIndex]
            let buttonViewModel = buttonViewModels[layoutIndex]
            
            buttonViewModel.x = layoutNode.x
            buttonViewModel.y = layoutNode.y
            buttonViewModel.width = layoutNode.width
            
            buttonViewModel.universalPaddingLeft = layoutNode.universalPaddingLeft
            buttonViewModel.universalPaddingRight = layoutNode.universalPaddingRight
            
            buttonViewModel.nameLabelPaddingLeft = layoutNode.nameLabelPaddingLeft
            buttonViewModel.nameLabelPaddingRight = layoutNode.nameLabelPaddingRight
            
            buttonViewModel.iconPaddingLeft = layoutNode.iconPaddingLeft
            buttonViewModel.iconPaddingRight = layoutNode.iconPaddingRight
        }
        universalPaddingLeft = _universalPaddingLeft
        universalPaddingRight = _universalPaddingRight
    }
    
    func handleSelectedIndex(_ index: Int) {
        print("MagicalCreateSwatchViewModel => handleSelectedIndex(\(index))")
    }
    
    override func setDarkModeEnabled(isDarkModeEnabled: Bool) {
        super.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        for buttonViewModel in buttonViewModels {
            buttonViewModel.setDarkModeEnabled(isDarkModeEnabled: isDarkModeEnabled)
        }
    }
}
