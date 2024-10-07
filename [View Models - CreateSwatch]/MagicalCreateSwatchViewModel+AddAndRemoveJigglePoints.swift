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
            if segmentButtonViewModels.count > 0 {
                if jiggleViewModel.jiggleDocument.isAddJigglePointsPossible() {
                    segmentButtonViewModels[0].isEnabled = true
                } else {
                    segmentButtonViewModels[0].isEnabled = false
                }
            }
            
            if segmentButtonViewModels.count > 1 {
                if jiggleViewModel.jiggleDocument.isRemoveJigglePointsPossible() {
                    segmentButtonViewModels[1].isEnabled = true
                } else {
                    segmentButtonViewModels[1].isEnabled = false
                }
            }
            
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .addJigglePoint:
                if segmentButtonViewModels.count > 0 {
                    activeButtonViewModel = segmentButtonViewModels[0]
                }
            case .removeJigglePoint:
                if segmentButtonViewModels.count > 1 {
                    activeButtonViewModel = segmentButtonViewModels[1]
                }
            case .none:
                activeButtonViewModel = nil
            default:
                activeButtonViewModel = nil
            }
        }
        
    }
    
    override func handleSelectedIndex(_ index: Int) {
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if index == 0 {
                jiggleViewModel.setCreatorMode(.addJigglePoint)
            }
            if index == 1 {
                jiggleViewModel.setCreatorMode(.removeJigglePoint)
            }
        }
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("MagicalCreateSwatchViewModelAddAndRemoveJigglePoints - Dealloc")
        }
    }
}
