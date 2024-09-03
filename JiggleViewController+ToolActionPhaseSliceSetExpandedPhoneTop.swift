//
//  JiggleViewController+ToolActionPhaseSliceSetExpandedPhoneTop.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/2/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetExpandedPhoneTop(_ slice: ToolActionPhaseSliceSetExpandedPhoneTop) {
        jiggleViewModel.isPhoneTopMenuExpanded = slice.isExpanded
        jiggleViewModel.killDragAll()
    }
}
