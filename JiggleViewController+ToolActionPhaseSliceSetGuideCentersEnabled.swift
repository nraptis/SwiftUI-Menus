//
//  GuideViewController+ToolActionPhaseSliceSetGuideCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/31/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetGuideCentersEnabled(_ slice: ToolActionPhaseSliceSetGuideCentersEnabled) {
        jiggleViewModel.jiggleDocument.isCreateGuideCentersModificationEnabled = slice.isGuideCentersEnabled
        toolInterfaceViewModel.handleCreateGuideCentersModificationDidChange()
        jiggleViewModel.killDragAll()
    }
}
