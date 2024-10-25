//
//  JiggleViewController+ToolActionPhaseSliceSetDocumentMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetDocumentMode(_ slice: ToolActionPhaseSliceSetDocumentMode) {
        jiggleViewModel.jiggleDocument.documentMode = slice.documentMode
        jiggleViewModel.handleDocumentModeDidChange()
        toolInterfaceViewModel.handleDocumentModeDidChange()
        jiggleViewModel.killDragAll()
    }
}
