//
//  HistoryValueNode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/9/24.
//

import Foundation

class HistorySingleJiggleValueNode {
    let startValue: Float
    var endValue: Float
    let jiggleIndex: Int
    init(startValue: Float, jiggleIndex: Int) {
        self.startValue = startValue
        self.endValue = startValue
        self.jiggleIndex = jiggleIndex
    }
}
