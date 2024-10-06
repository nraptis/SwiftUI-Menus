//
//  MagicalGreenButtonViewModel+CreateScene.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import Foundation

@Observable class MagicalGreenButtonViewModelDone: MagicalGreenButtonViewModel {
    
    override func handleClicked() {
        print("u clicked it")
    }
    
    override func refresh() {
        super.refresh()
        
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[Deinit] MagicalGreenButtonViewModelDone (Dealloc)")
        }
    }
}
