//
//  JiggleViewController+ToolActionPhaseSliceSetAnimationMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/9/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetAnimationMode(_ slice: ToolActionPhaseSliceSetAnimationMode) {
        jiggleViewModel.jiggleDocument.animationMode = slice.animationMode
        jiggleViewModel.handleAnimationModeDidChange()
        toolInterfaceViewModel.handleAnimationModeDidChange()
        jiggleViewModel.killDragAll()
    }
}
