//
//  JiggleViewController+ToolActionPhaseSliceSetAnimationLoopsPage.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetAnimationLoopsPage(_ slice: ToolActionPhaseSliceSetAnimationLoopsPage) {
        jiggleViewModel.jiggleDocument.animationLoopsPage = slice.animationLoopsPage
        toolInterfaceViewModel.handleAnimationLoopsPageDidChange()
        jiggleViewModel.killDragAll()
    }
}
