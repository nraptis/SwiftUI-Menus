//
//  JiggleViewController+ToolActionPhaseSliceSetJiggleCentersEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/31/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetJiggleCentersEnabled(_ slice: ToolActionPhaseSliceSetJiggleCentersEnabled) {
        jiggleViewModel.jiggleDocument.isCreateJiggleCentersModificationEnabled = slice.isJiggleCentersEnabled
        toolInterfaceViewModel.handleCreateGuideCentersModificationDidChange()
        jiggleViewModel.killDragAll()
    }
}

