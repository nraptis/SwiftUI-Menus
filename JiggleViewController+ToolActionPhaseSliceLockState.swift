//
//  JiggleViewController+ToolActionPhaseSliceLockState.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/9/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceLockState(_ slice: ToolActionPhaseSliceLockState) {
        jiggleViewModel.lockShowingState()
    }
}
