//
//  JiggleViewController+ToolActionPhaseSliceSetVideoExportMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/2/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetVideoExportMode(_ slice: ToolActionPhaseSliceSetVideoExportMode) {
        jiggleViewModel.isVideoExportEnabled = slice.isVideoExportEnabled
        jiggleViewModel.killDragAll()
    }
}
