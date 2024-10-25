//
//  JiggleViewController+ToolActionPhaseSliceSetAnimationLoops.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/9/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetAnimationLoopsMode(_ slice: ToolActionPhaseSliceSetAnimationLoopsMode) {
        jiggleViewModel.jiggleDocument.isAnimationLoopsEnabled = slice.isAnimationLoopsMode
        toolInterfaceViewModel.handleAnimationLoopsEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}
