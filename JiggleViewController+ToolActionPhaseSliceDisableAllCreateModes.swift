//
//  JiggleViewController+ToolActionPhaseSliceDisableAllCreateModes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/12/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceDisableAllCreateModes(_ slice: ToolActionPhaseSliceDisableAllCreateModes) {
        jiggleViewModel.setCreatorMode(.none)
    }
}
