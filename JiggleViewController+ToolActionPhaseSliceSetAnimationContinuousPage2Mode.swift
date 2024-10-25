//
//  JiggleViewController+ToolActionPhaseSliceSetAnimationContinuousPage2Mode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetAnimationContinuousPage2Mode(_ slice: ToolActionPhaseSliceSetAnimationContinuousPage2Mode) {
        
        jiggleViewModel.isAnimationContinuousPage2Enabled = slice.isAnimationContinuousPage2Mode
        toolInterfaceViewModel.handleAnimationContinuousPage2DidChange()
        jiggleViewModel.killDragAll()
        
        
    }
}
