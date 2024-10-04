//
//  JiggleViewController+ToolActionPhaseSliceSetAnimationContinuousMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetAnimationContinuousMode(_ slice: ToolActionPhaseSliceSetAnimationContinuousMode) {
        jiggleViewModel.jiggleDocument.isAnimationContinuousEnabled = slice.isAnimationContinuousMode
        toolInterfaceViewModel.handleAnimationContinuousEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}

