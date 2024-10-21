//
//  MagicalCreateSwatchViewModel+MakeAndDrawGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

@Observable class MagicalCreateSwatchViewModelMakeAndDrawGuide: MagicalCreateSwatchViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .makeGuide:
                setActiveButton(0)
                refreshEnabledAllButtons()
            case .drawGuide:
                setActiveButton(1)
                refreshEnabledAllButtons()
            case .moveGuideCenter:
                setActiveButton(2)
                refreshEnabledAllButtons()
            case .none:
                activeButtonViewModel = nil
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let unfrozenJiggleCount = jiggleDocument.countUnfrozenJiggles()
                if unfrozenJiggleCount > 0 {
                    refreshEnabledAllButtons()
                } else {
                    refreshDisabledAllButtons()
                }
            default:
                activeButtonViewModel = nil
                refreshDisabled()
                refreshDisabledAllButtons()
            }
        }
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if index == 0 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.makeGuide)
            }
        }
        if index == 1 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.drawGuide)
            }
        }
        if index == 2 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.moveGuideCenter)
            }
        }
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModelMakeAndDrawGuide - Dealloc")
        }
    }
}
