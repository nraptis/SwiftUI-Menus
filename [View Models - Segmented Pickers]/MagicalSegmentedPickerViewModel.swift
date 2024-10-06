//
//  MagicalSegmentedPickerViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import Foundation
import SwiftUI

@Observable class MagicalSegmentedPickerViewModel: MagicalViewModelSegmented {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        SegmentedPickerLayout.self
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalSegmentedPickerViewModel - Dealloc")
        }
    }
    
    var a = 0
    let b = 100010
    
    var selectedSegmentIndex = 0
    
    var universalPaddingLeft = 0
    var universalPaddingRight = 0
    let segmentedPickerConfiguration: ToolInterfaceElementSegmentedPickerConfiguration
    
    @MainActor init(orientation: Orientation,
         segmentedPickerConfiguration: ToolInterfaceElementSegmentedPickerConfiguration) {
        
        self.segmentedPickerConfiguration = segmentedPickerConfiguration
        
        var _buttonViewModels = [MagicalSegmentedPickerButtonViewModel]()
        for buttonConfiguration in segmentedPickerConfiguration.buttonConfigurations {
            let buttonViewModel = MagicalSegmentedPickerButtonViewModel(orientation: orientation,
                                                                        segmentedPickerButtonConfiguration: buttonConfiguration,
                                                                        isDarkModeEnabled: ApplicationController.isDarkModeEnabled)
            _buttonViewModels.append(buttonViewModel)
        }
        super.init(orientation: orientation, segmentButtonViewModels: _buttonViewModels)
    }
    
    override func refresh() {
        
    }
    
    override func refreshLayoutFrame() {

        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        switch layoutSchemeFlavor {
        case .long:
            
            let infoList = segmentedPickerConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthLong,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        case .stackedLarge:
            let infoList = segmentedPickerConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthStackedLarge,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameStacked(infoList: infoList)
        case .stackedMedium:
            let infoList = segmentedPickerConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthStackedMedium,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameStacked(infoList: infoList)
        case .stackedSmall:
            let infoList = segmentedPickerConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: nil,
                                    nameLabelWidth: $0.nameLabelWidthStackedSmall,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameStacked(infoList: infoList)
        }
        
    }
    
    func handleSelectedIndex(_ index: Int) {
        print("MagicalSegmentedPickerViewModel => handleSelectedIndex(\(index))")
    }
    
}
