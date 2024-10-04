//
//  CGPoint+Float.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/12/24.
//

import Foundation

extension CGPoint {
    init(x: Float, y: Float) {
        self.init(x: CGFloat(x),
                  y: CGFloat(y))
    }
    
}
