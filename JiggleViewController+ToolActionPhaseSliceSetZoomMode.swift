//
//  JiggleViewController+ToolActionPhaseSliceSetZoomMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/2/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetZoomMode(_ slice: ToolActionPhaseSliceSetZoomMode) {
        jiggleViewModel.isZoomEnabled = slice.isZoomMode
        toolInterfaceViewModel.handleZoomEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}
