//
//  JiggleViewController+ToolActionPhaseSliceSetExpandedDraggable.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/2/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetExpandedDraggable(_ slice: ToolActionPhaseSliceSetExpandedDraggable) {
        jiggleViewModel.isPadMenuExpanded = slice.isExpanded
        jiggleViewModel.killDragAll()
    }
}
