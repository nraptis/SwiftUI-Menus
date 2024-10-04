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
            if buttonViewModels.count > 0 {
                if jiggleViewModel.jiggleDocument.isAddJigglePointsPossible() {
                    buttonViewModels[0].isEnabled = true
                    print("isAddJigglePointsPossible => TRUE")
                } else {
                    buttonViewModels[0].isEnabled = false
                    print("isAddJigglePointsPossible => FALSE")
                }
            }
            
            if buttonViewModels.count > 1 {
                if jiggleViewModel.jiggleDocument.isRemoveJigglePointsPossible() {
                    buttonViewModels[1].isEnabled = true
                    print("isRemoveJigglePointsPossible => TRUE")
                } else {
                    buttonViewModels[1].isEnabled = false
                    print("isRemoveJigglePointsPossible => FALSE")
                }
            }
            
            switch jiggleViewModel.jiggleDocument.creatorMode {
            case .addJigglePoint:
                if buttonViewModels.count > 0 {
                    activeButtonViewModel = buttonViewModels[0]
                }
            case .removeJigglePoint:
                if buttonViewModels.count > 1 {
                    activeButtonViewModel = buttonViewModels[1]
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
