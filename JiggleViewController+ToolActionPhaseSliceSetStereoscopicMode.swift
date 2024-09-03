//
//  JiggleViewController+ToolActionPhaseSliceSetStereoscopicMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetStereoscopicMode(_ slice: ToolActionPhaseSliceSetStereoscopicMode) {
        jiggleViewModel.isStereoscopicEnabled = slice.isStereoscopicMode
        toolInterfaceViewModel.handleStereoscopicDidChange()
        jiggleViewModel.killDragAll()
    }
}
