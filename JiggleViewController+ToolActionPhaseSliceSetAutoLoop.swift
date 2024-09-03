//
//  JiggleViewController+ToolActionPhaseSliceSetAutoLoop.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/9/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetAutoLoopMode(_ slice: ToolActionPhaseSliceSetAutoLoopMode) {
        //jiggleViewModel.isAutoLoopEnabled = slice.isAutoLoopMode
        toolInterfaceViewModel.handleAutoLoopEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}
