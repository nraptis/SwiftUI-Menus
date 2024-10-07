//
//  MagicalCreateSwatchViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation
import SwiftUI

@Observable class MagicalCreateSwatchViewModel: MagicalViewModelSegmented {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        CreateSwatchLayout.self
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModel - Dealloc")
        }
    }
    
    @MainActor var activeButtonViewModel: MagicalSegmentButtonViewModel?
    
    let createSwatchConfiguration: ToolInterfaceElementCreateSwatchConfiguration
    @MainActor init(orientation: Orientation,
                    createSwatchConfiguration: ToolInterfaceElementCreateSwatchConfiguration) {
        
        self.createSwatchConfiguration = createSwatchConfiguration
        
        var _buttonViewModels = [MagicalCreateSwatchButtonViewModel]()
        for buttonConfiguration in createSwatchConfiguration.buttonConfigurations {
            let buttonViewModel = MagicalCreateSwatchButtonViewModel(orientation: orientation,
                                                                createSwatchButtonConfiguration: buttonConfiguration,
                                                                isDarkModeEnabled: ApplicationController.isDarkModeEnabled)
            _buttonViewModels.append(buttonViewModel)
        }
        super.init(orientation: orientation, segmentButtonViewModels: _buttonViewModels)
    }
    
    @MainActor func getButtonConfiguration(buttonViewModel: MagicalSegmentButtonViewModel) -> ToolInterfaceElementCreateSwatchButtonConfiguration? {
        var index = 0
        while (index < createSwatchConfiguration.buttonConfigurations.count) && (index < segmentButtonViewModels.count) {
            if segmentButtonViewModels[index] === buttonViewModel {
                return createSwatchConfiguration.buttonConfigurations[index]
            }
            index += 1
        }
        return nil
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            let infoList = createSwatchConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthLarge,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        case .stackedMedium:
            let infoList = createSwatchConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthMedium,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        case .stackedSmall:
            let infoList = createSwatchConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthSmall,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        }
    }
    
    @MainActor func setActiveButton(_ index: Int) {
        if index >= 0 && index < segmentButtonViewModels.count {
            if activeButtonViewModel !== segmentButtonViewModels[index] {
                activeButtonViewModel = segmentButtonViewModels[index]
            }
        }
    }
    
    @MainActor func refreshEnabledButton(at index: Int) {
        if index >= 0 && index < segmentButtonViewModels.count {
            segmentButtonViewModels[index].refreshEnabled()
        }
    }
    
    @MainActor func refreshDisabledButton(at index: Int) {
        if index >= 0 && index < segmentButtonViewModels.count {
            segmentButtonViewModels[index].refreshDisabled()
        }
    }
    
    @MainActor func refreshEnabledAllButtons() {
        for index in 0..<segmentButtonViewModels.count {
            segmentButtonViewModels[index].refreshEnabled()
        }
    }
    
    @MainActor func refreshDisabledAllButtons() {
        for index in 0..<segmentButtonViewModels.count {
            segmentButtonViewModels[index].refreshDisabled()
        }
    }
    
    @MainActor func handleActiveSwatchClicked() {
        print("MagicalCreateSwatchViewModel -> ActiveSwatchClicked!!!!!!!")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            jiggleViewModel.setCreatorMode(.none)
        }
    }
    
    func handleSelectedIndex(_ index: Int) {
        print("MagicalCreateSwatchViewModel => handleSelectedIndex(\(index))")
    }
    
}


/*
@Observable class MagicalCreateSwatchViewModel: MagicalViewModel {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        CreateSwatchLayout.self
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModel - Dealloc")
        }
    }
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    let createSwatchConfiguration: ToolInterfaceElementCreateSwatchConfiguration
    
    var activeButtonViewModel: MagicalCreateSwatchButtonViewModel?
    
    let buttonViewModels: [MagicalCreateSwatchButtonViewModel]
    let layoutNodes: [MagicalCreateSwatchButtonLayoutNode]
    @MainActor init(orientation: Orientation,
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
    
    func setActiveButton(_ index: Int) {
        if index >= 0 && index < buttonViewModels.count {
            if activeButtonViewModel !== buttonViewModels[index] {
                activeButtonViewModel = buttonViewModels[index]
            }
        }
    }
    
    func refreshEnabledButton(at index: Int) {
        if index >= 0 && index < buttonViewModels.count {
            buttonViewModels[index].refreshEnabled()
        }
    }
    
    func refreshDisabledButton(at index: Int) {
        if index >= 0 && index < buttonViewModels.count {
            buttonViewModels[index].refreshDisabled()
        }
    }
    
    func refreshEnabledAllButtons() {
        for index in 0..<buttonViewModels.count {
            buttonViewModels[index].refreshEnabled()
        }
    }
    
    func refreshDisabledAllButtons() {
        for index in 0..<buttonViewModels.count {
            buttonViewModels[index].refreshDisabled()
        }
    }
    
    func handleSelectedIndex(_ index: Int) {
        print("MagicalCreateSwatchViewModel => handleSelectedIndex(\(index))")
    }
    
    func handleActiveSwatchClicked() {
        print("MagicalCreateSwatchViewModel -> ActiveSwatchClicked!!!!!!!")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            jiggleViewModel.setCreatorMode(.none)
        }
    }
    
    override func refreshLayoutFrame() {
        
 
}
*/
