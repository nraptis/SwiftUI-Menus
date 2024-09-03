//
//  JiggleViewController+ToolActionPhaseSliceHistoryUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceHistoryUndo(_ slice: ToolActionPhaseSliceApplyHistoryUndo) {
        executeHistoryStateUndo(slice.historyState)
        jiggleViewModel.killDragAll()
    }
}
