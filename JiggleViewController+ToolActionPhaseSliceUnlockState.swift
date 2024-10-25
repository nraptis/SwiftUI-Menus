//
//  JiggleViewController+ToolActionPhaseSliceUnlockState.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/9/24.
//

import Foundation

extension JiggleViewController {
    
    func toolActionConsumePhaseSliceUnlockState(_ slice: ToolActionPhaseSliceUnlockState) {
        //print("slice.JiggleMeshCommand = \(slice.command)")
        
        print("slice. Unlock Meshes")
        jiggleViewModel.unlockShowingState()
    }
}
