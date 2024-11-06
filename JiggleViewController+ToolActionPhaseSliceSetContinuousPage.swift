//
//  JiggleViewController+ToolActionPhaseSliceSetContinuousPage.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/1/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetContinuousPage(_ slice: ToolActionPhaseSliceSetContinuousPage) {
        jiggleViewModel.jiggleDocument.animationContinuousPage = slice.animationContinuousPage
        toolInterfaceViewModel.handleContinuousPageDidChange()
        jiggleViewModel.killDragAll()
    }
}
