//
//  JiggleViewController+ToolActionPhaseSliceSetEditMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetEditMode(_ slice: ToolActionPhaseSliceSetEditMode) {
        jiggleViewModel.jiggleDocument.editMode = slice.editMode
        jiggleViewModel.handleEditModeDidChange()
        toolInterfaceViewModel.handleEditModeDidChange()
        jiggleViewModel.killDragAll()
    }
}
