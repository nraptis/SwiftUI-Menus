//
//  MagicalCreateSwatchViewModel+MakeAndDrawJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

@Observable class MagicalCreateSwatchViewModelMakeAndDrawJiggle: MagicalCreateSwatchViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            //
            
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .makeJiggle:
                setActiveButton(0)
                refreshEnabledAllButtons()
            case .drawJiggle:
                setActiveButton(1)
                refreshEnabledAllButtons()
            case .moveJiggleCenter:
                setActiveButton(2)
                refreshEnabledAllButtons()
            case .none:
                activeButtonViewModel = nil
                refreshEnabledButton(at: 0)
                refreshEnabledButton(at: 1)
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let unfrozenJiggleCount = jiggleDocument.countUnfrozenJiggles()
                if unfrozenJiggleCount > 0 {
                    refreshEnabledButton(at: 2)
                } else {
                    refreshDisabledButton(at: 2)
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
                jiggleViewController.setCreatorModeUpdatingMesh(.makeJiggle)
            }
        }
        if index == 1 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.drawJiggle)
            }
        }
        if index == 2 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.moveJiggleCenter)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModelMakeAndDrawJiggle - Dealloc")
        }
    }
}
