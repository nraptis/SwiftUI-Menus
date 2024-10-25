//
//  RowRecipe.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/23/24.
//

import Foundation

struct RowRecipe {
    let inrs: [INR]
    let centerPinnedElement: ToolInterfaceElement?
    
    init(inrs: [INR], centerPinnedElement: ToolInterfaceElement?) {
        self.inrs = inrs
        self.centerPinnedElement = centerPinnedElement
    }
    
    init(inrs: [INR]) {
        self.inrs = inrs
        self.centerPinnedElement = nil
    }
}

extension RowRecipe: Equatable {
    static func == (lhs: RowRecipe, rhs: RowRecipe) -> Bool {
        if lhs.centerPinnedElement != rhs.centerPinnedElement {
            return false
        }
        if lhs.inrs.count != rhs.inrs.count {
            return false
        }
        for inrIndex in 0..<lhs.inrs.count {
            if lhs.inrs[inrIndex] != rhs.inrs[inrIndex] {
                return false
            }
        }
        return true
    }
}
