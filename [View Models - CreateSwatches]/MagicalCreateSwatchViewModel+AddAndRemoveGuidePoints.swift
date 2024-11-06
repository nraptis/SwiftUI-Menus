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
                setActiveButton(0)
                refreshEnabledAllButtons()
            case .removeGuidePoint:
                setActiveButton(1)
                refreshEnabledAllButtons()
            case .moveGuideCenter:
                setActiveButton(2)
                refreshEnabledAllButtons()
            case .none:
                activeButtonViewModel = nil
                
                let jiggleDocument = jiggleViewModel.jiggleDocument
                let unfrozenJiggleCount = jiggleDocument.countUnfrozenJiggles()
                let unfrozenGuideCount = jiggleDocument.countUnfrozenGuides()
                
                if jiggleDocument.getSelectedGuide() !== nil {
                    refreshEnabledButton(at: 0)
                } else {
                    refreshDisabledButton(at: 0)
                }
                
                if unfrozenGuideCount > 0 {
                    refreshEnabledButton(at: 1)
                } else {
                    refreshDisabledButton(at: 1)
                }
                
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
                jiggleViewController.setCreatorModeUpdatingMesh(.addGuidePoint)
            }
        }
        if index == 1 {
            if let jiggleViewController = ApplicationController.shared.jiggleViewController {
                jiggleViewController.setCreatorModeUpdatingMesh(.removeGuidePoint)
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
            print("MagicalCreateSwatchViewModelAddAndRemoveGuidePoints - Dealloc")
        }
    }
}
