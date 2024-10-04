//
//  MagicalCreateSwatchViewModel+AddAndRemoveGuidePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

@Observable class MagicalCreateSwatchViewModelAddAndRemoveGuidePoints: MagicalCreateSwatchViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .addGuidePoint:
                if buttonViewModels.count > 0 {
                    activeButtonViewModel = buttonViewModels[0]
                    refreshEnabled()
                }
            case .removeGuidePoint:
                if buttonViewModels.count > 1 {
                    activeButtonViewModel = buttonViewModels[1]
                    refreshEnabled()
                }
            case .none:
                activeButtonViewModel = nil
                refreshDisableIfNoGuideSelectedOtherwiseEnable()
            default:
                activeButtonViewModel = nil
                refreshDisabled()
            }
        }
        
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if index == 0 {
                jiggleViewModel.setCreatorMode(.addGuidePoint)
            }
            if index == 1 {
                jiggleViewModel.setCreatorMode(.removeGuidePoint)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModelAddAndRemoveGuidePoints - Dealloc")
        }
    }
}
