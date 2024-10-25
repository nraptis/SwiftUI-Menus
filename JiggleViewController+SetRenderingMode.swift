//
//  JiggleViewController+SetRenderingRegularMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/6/24.
//

import Foundation

extension JiggleViewController {
    
    func toolActionConsumePhaseSliceSetRenderingMode(_ slice: ToolActionPhaseSliceSetRenderingMode) {
        jiggleViewModel.isRenderingRegular = slice.isRenderingRegularMode
        jiggleViewModel.isRenderingSwivel = slice.isRenderingSwivelMode
        
    }
}
