//
//  JiggleViewController+ToolActionPhaseSliceSetLoopsPage.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/1/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetLoopsPage(_ slice: ToolActionPhaseSliceSetLoopsPage) {
        jiggleViewModel.jiggleDocument.animationLoopsPage = slice.animationLoopsPage
        toolInterfaceViewModel.handleLoopsPageDidChange()
        jiggleViewModel.killDragAll()
    }
}
