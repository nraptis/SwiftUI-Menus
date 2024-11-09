//
//  MagicalButtonViewModel+Undo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import Foundation

@Observable class MagicalButtonViewModelUndo: MagicalButtonViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionUndo()
        }
    }
    
    override func refresh() {
        
        if let jiggleViewController = ApplicationController.shared.jiggleViewController {
            
            if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
                
                if jiggleViewModel.getGraphDraggingStatus() {
                    refreshDisabled()
                    return
                }
                
                if jiggleViewModel.getTimeLineDraggingStatus() {
                    refreshDisabled()
                    return
                }
                
                if jiggleViewModel.getContinuousDraggingStatus() {
                    refreshDisabled()
                    return
                }
                
                if jiggleViewModel.isAnySliderActive {
                    refreshDisabled()
                    return
                }

                if jiggleViewController.historyController.canUndo() {
                    refreshEnabled()
                } else {
                    refreshDisabled()
                }
            }
        }
        
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalTextIconButtonViewModelUndo (Dealloc)")
        }
    }
}
