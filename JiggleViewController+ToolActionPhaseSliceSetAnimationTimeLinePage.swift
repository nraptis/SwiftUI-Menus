//
//  JiggleViewController+ToolActionPhaseSliceSetTimeLinePage.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/1/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetTimeLinePage(_ slice: ToolActionPhaseSliceSetTimeLinePage) {
        jiggleViewModel.jiggleDocument.animationTimeLinePage = slice.animationTimeLinePage
        toolInterfaceViewModel.handleTimeLinePageDidChange()
        jiggleViewModel.killDragAll()
    }
}
