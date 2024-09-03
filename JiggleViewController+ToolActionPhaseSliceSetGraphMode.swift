//
//  JiggleViewController+ToolActionPhaseSliceSetGraphMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/1/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetGraphMode(_ slice: ToolActionPhaseSliceSetGraphMode) {
        jiggleViewModel.isGraphEnabled = slice.isGraphMode
        toolInterfaceViewModel.handleWeightCurveGraphEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}
