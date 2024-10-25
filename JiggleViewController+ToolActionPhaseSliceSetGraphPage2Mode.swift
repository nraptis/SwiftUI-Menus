//
//  JiggleViewController+ToolActionPhaseSliceSetGraphPage2Mode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/22/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetGraphPage2Mode(_ slice: ToolActionPhaseSliceSetGraphPage2Mode) {
        
        jiggleViewModel.isGraphPage2Enabled = slice.isGraphPage2Mode
        toolInterfaceViewModel.handleGraphPage2DidChange()
        jiggleViewModel.killDragAll()
        
        
    }
}
