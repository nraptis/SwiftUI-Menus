//
//  JiggleViewController+ToolActionPhaseSliceSetWeightMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetWeightMode(_ slice: ToolActionPhaseSliceSetWeightMode) {
        jiggleViewModel.jiggleDocument.weightMode = slice.weightMode
        toolInterfaceViewModel.handleWeightModeDidChange()
        jiggleViewModel.killDragAll()
    }
}

