//
//  JiggleViewController+ToolActionPhaseSliceSetViewMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/11/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetViewMode(_ slice: ToolActionPhaseSliceSetViewMode) {
        jiggleViewModel.jiggleDocument.viewMode = slice.viewMode
        jiggleViewModel.handleViewModeDidChange()
        toolInterfaceViewModel.handleViewModeDidChange()
        jiggleViewModel.killDragAll()
    }
}
