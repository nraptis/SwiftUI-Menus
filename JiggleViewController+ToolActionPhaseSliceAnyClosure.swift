//
//  JiggleViewController+ToolActionPhaseSliceAnyClosure.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/18/24.
//

import Foundation

extension JiggleViewController {
    func toolActionConsumePhaseSliceAnyClosure(_ slice: ToolActionPhaseSliceAnyClosure) {
        if let code = slice.code {
            code()
        }
    }
}
