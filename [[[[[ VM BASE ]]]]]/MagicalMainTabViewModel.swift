//
//  MagicalMainTabViewModel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

@Observable class MagicalMainTabViewModel: MagicalViewModelSegmented {
    
    override class func getLayoutScheme() -> LayoutScheme.Type {
        MainTabLayout.self
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalMainTabViewModel - Dealloc")
        }
    }
    
    let mainTabConfiguration: ToolInterfaceElementMainTabConfiguration
    @MainActor init(orientation: Orientation,
                    mainTabConfiguration: ToolInterfaceElementMainTabConfiguration) {
        
        self.mainTabConfiguration = mainTabConfiguration
        
        var _buttonViewModels = [MagicalMainTabButtonViewModel]()
        for buttonConfiguration in mainTabConfiguration.buttonConfigurations {
            let buttonViewModel = MagicalMainTabButtonViewModel(orientation: orientation,
                                                                mainTabButtonConfiguration: buttonConfiguration,
                                                                isDarkModeEnabled: ApplicationController.isDarkModeEnabled)
            _buttonViewModels.append(buttonViewModel)
        }
        super.init(orientation: orientation, segmentButtonViewModels: _buttonViewModels)
    }
    
    override func refreshLayoutFrame() {
        
        let layoutSchemeFlavor = getLayoutSchemeFlavor()
        
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            let infoList = mainTabConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: FramedLongIconLibrary.testArrowLeft,
                                    iconPackTertiary: FramedLongIconLibrary.testArrowRight,
                                    nameLabelWidth: $0.nameLabelWidthLarge,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        case .stackedMedium:
            let infoList = mainTabConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: FramedLongIconLibrary.testArrowLeft,
                                    iconPackTertiary: FramedLongIconLibrary.testArrowRight,
                                    nameLabelWidth: $0.nameLabelWidthMedium,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        case .stackedSmall:
            let infoList = mainTabConfiguration.buttonConfigurations.map {
                SEGMENT_LAYOUT_INFO(iconPackMain: $0.iconPack,
                                    iconPackSecondary: FramedLongIconLibrary.testArrowLeft,
                                    iconPackTertiary: FramedLongIconLibrary.testArrowRight,
                                    nameLabelWidth: $0.nameLabelWidthSmall,
                                    numberOfLines: $0.nameLabelNumberOfLines)
            }
            refreshLayoutFrameLong(infoList: infoList)
        }
        
    }
    
    override func handleSelectedIndex(_ index: Int) {
        print("MagicalMainTabViewModel => handleSelectedIndex(\(index))")
    }
}
