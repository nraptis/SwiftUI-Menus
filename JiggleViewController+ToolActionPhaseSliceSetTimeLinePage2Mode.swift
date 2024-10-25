//
//  JiggleViewController+ToolActionPhaseSliceSetTimeLinePage2Mode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/18/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetTimeLinePage2Mode(_ slice: ToolActionPhaseSliceSetTimeLinePage2Mode) {
        
        jiggleViewModel.isTimeLinePage2Enabled = slice.isTimeLinePage2Mode
        toolInterfaceViewModel.handleTimeLinePage2DidChange()
        jiggleViewModel.killDragAll()
        
        
    }
}
