//
//  JiggleViewController+MeshCommandOneJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/7/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceJiggleMeshCommandOneJiggle(_ slice: ToolActionPhaseSliceJiggleMeshCommandOneJiggle) {
        jiggleViewModel.applyMeshCommandOneJiggle(meshCommand: slice.meshCommand,
                                                  weightRingCommand: slice.weightRingCommand,
                                                  jiggle: slice.jiggle)
    }
}
