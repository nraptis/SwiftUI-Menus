//
//  JiggleViewController+ToolActionPhaseSliceSetExpandedPhoneBottom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/2/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetExpandedPhoneBottom(_ slice: ToolActionPhaseSliceSetExpandedPhoneBottom) {
        jiggleViewModel.isPhoneBottomMenuExpanded = slice.isExpanded
        jiggleViewModel.killDragAll()
    }
}
