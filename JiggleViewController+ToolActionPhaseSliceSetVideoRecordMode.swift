//
//  JiggleViewController+ToolActionPhaseSliceSetVideoRecordMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/2/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetVideoRecordMode(_ slice: ToolActionPhaseSliceSetVideoRecordMode) {
        jiggleViewModel.isVideoRecordEnabled = slice.isVideoRecordEnabled
        jiggleViewModel.killDragAll()
    }
}
