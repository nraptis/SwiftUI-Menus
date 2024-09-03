//
//  JiggleViewController+ToolActionPhaseSliceHistoryRedo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/26/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceHistoryRedo(_ slice: ToolActionPhaseSliceApplyHistoryRedo) {
        executeHistoryStateRedo(slice.historyState)
        jiggleViewModel.killDragAll()
    }
}
