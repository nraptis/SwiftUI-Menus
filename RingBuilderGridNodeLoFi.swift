//
//  RingBuilderGridNodeLoFi.swift
//  Manifold
//
//  Created by Nicky Taylor on 8/3/24.
//

import Foundation

class RingBuilderGridNodeLoFi {
    
    typealias Point = Math.Point
    
    var x = Float(0.0)
    var y = Float(0.0)
    
    //var isInside = false
    
    var distanceFromEdge = Float(0.0)
    
    var point: Point {
        Point(x: x,
              y: y)
    }
    
    var jiggleWeightSegments = [JiggleWeightSegment]()
    var jiggleWeightSegmentCount = 0
    func addJiggleWeightSegment(_ jiggleWeightSegment: JiggleWeightSegment) {
        while jiggleWeightSegments.count <= jiggleWeightSegmentCount {
            jiggleWeightSegments.append(jiggleWeightSegment)
        }
        jiggleWeightSegments[jiggleWeightSegmentCount] = jiggleWeightSegment
        jiggleWeightSegmentCount += 1
    }
    
    func removeAllJiggleWeightSegments() {
        jiggleWeightSegmentCount = 0
    }
    
}
