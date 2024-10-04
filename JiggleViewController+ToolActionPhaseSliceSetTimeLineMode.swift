//
//  JiggleViewController+ToolActionPhaseSliceSetTimeLineMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetTimeLineMode(_ slice: ToolActionPhaseSliceSetTimeLineMode) {
        jiggleViewModel.jiggleDocument.isTimeLineEnabled = slice.isTimeLineMode
        if slice.isTimeLineMode {
            jiggleViewModel.refreshAllTimeLines()
        }
        toolInterfaceViewModel.handleTimeLineEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}
