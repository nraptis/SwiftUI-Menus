//
//  JiggleViewController+ToolActionPhaseSliceSetGuideMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceSetGuidesMode(_ slice: ToolActionPhaseSliceSetGuidesMode) {
        jiggleViewModel.jiggleDocument.isGuidesEnabled = slice.isGuideMode
        toolInterfaceViewModel.handleGuidesEnabledDidChange()
        jiggleViewModel.killDragAll()
    }
}
