//
//  MagicalEnterModeViewModel+LoopsPage1Exit.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//
import Foundation

@Observable class MagicalExitModeViewModelLoopsPage1Exit: MagicalModeChangeViewModel {
    
    override func handleClicked() {
        if let toolInterfaceViewModel = ApplicationController.shared.toolInterfaceViewModel {
            toolInterfaceViewModel.toolActionLoopsPage1Exit()
        }
    }
    
    override func refresh() {
        refreshEnabled()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalExitModeViewModelLoopsPage1Exit (Dealloc)")
        }
    }
}
