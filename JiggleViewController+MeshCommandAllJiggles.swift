//
//  JiggleViewController+SetMeshMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/6/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceJiggleMeshCommandAllJiggles(_ slice: ToolActionPhaseSliceJiggleMeshCommandAllJiggles) {
        jiggleViewModel.applyMeshCommandAllJiggles(meshCommand: slice.meshCommand,
                                                   weightRingCommand: slice.weightRingCommand)
    }
}
