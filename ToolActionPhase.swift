//
//  ToolActionPhase.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

class ToolActionPhase {
    
    // Note: All "SLICES" happen at SAME TIME.
    //
    // Note: All "ACTIONS" happen on DISPLAY LINK.
    //       One after the another, as the
    //       DISPLAY LINK fires.
    
    let slices: [ToolActionPhaseSlice]
    var time: CGFloat = 0.0 // All "slice" will have same time as "phase"...
    var blockers = [ToolActionPhaseBlocker]()
    
    init(slices: [ToolActionPhaseSlice], time: CGFloat) {
        self.slices = slices
        self.time = time
        for slice in slices {
            slice.time = time
        }
    }
    
    init(slices: [ToolActionPhaseSlice]) {
        self.slices = slices
        self.time = .zero
        for slice in slices {
            slice.time = time
        }
    }
    
    init(slice: ToolActionPhaseSlice, time: CGFloat) {
        self.time = time
        self.slices = [slice]
        slice.time = time
    }
    
    init(slice: ToolActionPhaseSlice) {
        self.time = .zero
        self.slices = [slice]
        slice.time = time
    }
    
    var isConsumed = false
    
    
}

extension ToolActionPhase: CustomStringConvertible {
    
    var description: String {
        var result = "\t{Phase}\n"
        
        for sliceIndex in 0..<slices.count {
            let sliceString = "\(slices[sliceIndex])"
            result += "\t\t" + sliceString + "(\(sliceIndex) / \(slices.count))\n"
        }
        return result
    }
    
}
