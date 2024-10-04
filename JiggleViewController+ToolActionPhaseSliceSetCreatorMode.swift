//
//  GuideViewController+ToolActionPhaseSliceSetGuideCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/31/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetCreatorMode(_ slice: ToolActionPhaseSliceSetCreatorMode) {
        jiggleViewModel.setCreatorMode(slice.creatorMode)
        jiggleViewModel.killDragAll()
    }
}
