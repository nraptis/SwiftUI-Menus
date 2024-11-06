//
//  MagicalCreateSwatchViewModel+AddAndRemoveJigglePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

@Observable class MagicalCreateSwatchViewModelAddAndRemoveJigglePoints: MagicalCreateSwatchViewModel {
    
    override func refresh() {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {

            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .addJigglePoint:
                setActiveButton(0)
                refreshEnabledAllButtons()
            case .removeJigglePoint:
                setActiveButton(1)
                refreshEnabledAllButtons()
            case .moveJiggleCenter:
                setActiveButton(2)
                refreshEnabledAllButtons()
            case .none:
                activeButtonViewModel = nil
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let unfrozenJiggleCount = jiggleDocument.countUnfrozenJiggles()
                if unfrozenJiggleCount > 0 {
                    if jiggleDocument.getSelectedJiggle() !== nil {
                        refreshEnabledButton(at: 0)
                    } else {
                        refreshDisabledButton(at: 0)
                    }
                    refreshEnabledButton(at: 1)
                    refreshEnabledButton(at: 2)
                } else {
                    refreshDisabledButton(at: 0)
                    refreshDisabledButton(at: 1)
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
                jiggleViewController.setCreatorModeUpdatingMesh(.addJigglePoint)
            }
        }
        if index == 1 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.removeJigglePoint)
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
            print("MagicalCreateSwatchViewModelAddAndRemoveJigglePoints - Dealloc")
        }
    }
}
