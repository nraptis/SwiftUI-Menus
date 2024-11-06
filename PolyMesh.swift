//
//  PolyMesh.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/15/23.
//

import Foundation

class PolyMesh {
    
    static let maxPointCount = 256
    
    typealias Point = Math.Point
    typealias Vector = Math.Vector
    
    unowned var jiggleEngine: JiggleEngine!
    func load(jiggleEngine: JiggleEngine) {
        self.jiggleEngine = jiggleEngine
    }
    
    lazy var ring: Ring = {
        let result = PolyMeshPartsFactory.shared.withdrawRing(triangleData: triangleData)
        //result.polyMesh = self
        return result
    }()
    
    var triangleData = PolyMeshTriangleData()
    
    var edgeRingPoints = [RingPoint]()
    var edgeRingPointCount = 0
    func addEdgeRingPoint(_ edgeRingPoint: RingPoint) {
        while edgeRingPoints.count <= edgeRingPointCount {
            edgeRingPoints.append(edgeRingPoint)
        }
        edgeRingPoints[edgeRingPointCount] = edgeRingPoint
        edgeRingPointCount += 1
    }
    func purgeEdgeRingPoints() {
        for edgeRingPointIndex in 0..<edgeRingPointCount {
            PolyMeshPartsFactory.shared.depositRingPoint(edgeRingPoints[edgeRingPointIndex])
        }
        edgeRingPointCount = 0
    }
    
    unowned var jiggle: Jiggle!
    init(jiggle: Jiggle) {
        self.jiggle = jiggle
    }
    
    func reset() {
        triangleData.reset()
        purgeEdgeRingPoints()
        PolyMeshPartsFactory.shared.depositRingContent(ring)
    }
    
    func addPointsBegin() {
        reset()
        ring.addPointsBegin(depth: 0)
    }
    
    func addPoint(_ x: Float, _ y: Float) {
        ring.addPoint(x, y)
    }
    
    var isFast = false
    
    func addPointsCommit(jiggleMesh: JiggleMesh, isFast: Bool) {
        
        self.isFast = false
        ring.isBroken = false
        
        var fixOuterRing = true
        while fixOuterRing {
            fixOuterRing = false
            if ring.ringPointCount >= 3 {
                if ring.containsDuplicatePointsOuter() {
                    ring.resolveOneDuplicatePointOuter()
                    fixOuterRing = true
                }
            }
        }
        
        if ring.isCounterClockwiseRingPoints() {
            ring.resolveCounterClockwiseRingPoints()
        }
        
        if !ring.attemptToBeginBuildAndCheckIfBroken(needsPointInsidePolygonBucket: true,
                                                     needsLineSegmentBucket: true) {
            return
        }
        
        for ringPointIndex in 0..<ring.ringPointCount {
            let ringPoint = ring.ringPoints[ringPointIndex]
            
            let edgeRingPoint = PolyMeshPartsFactory.shared.withdrawRingPoint()
            edgeRingPoint.x = ringPoint.x
            edgeRingPoint.y = ringPoint.y
            addEdgeRingPoint(edgeRingPoint)
        }
        
        //
        //
        //
        
        jiggleMesh.handleShapeUpdate(ringLineSegments: ring.ringLineSegments,
                                          ringLineSegmentCount: ring.ringLineSegmentCount,
                                          ringPoints: ring.ringPoints,
                                          ringPointCount: ring.ringPointCount)
        
        //
        //
        //
        
        if isFast {
            ring.meshifyWithFastAlgorithm()
            self.isFast = true
        } else {
            ring.meshifyRecursively(needsSafetyCheckA: false, needsSafetyCheckB: false)
            
            for edgeRingPointIndex in 0..<edgeRingPointCount {
                let edgeRingPoint = edgeRingPoints[edgeRingPointIndex]
                triangleData.markEdge(x: edgeRingPoint.x,
                                      y: edgeRingPoint.y)
            }
            
            self.isFast = false
        }
    }
    
    func transformPoint(_ x: Float, _ y: Float) -> Point {
        jiggle.transformPoint(x, y)
    }
    
    func transformPoint(point: Point) -> Point {
        jiggle.transformPoint(point: point)
    }
    
    func transformPointScaleAndRotationOnly(_ x: Float, _ y: Float) -> Point {
        jiggle.transformPointScaleAndRotationOnly(x, y)
    }
    
    func transformPointScaleAndRotationOnly(point: Point) -> Point {
        jiggle.transformPointScaleAndRotationOnly(point: point)
    }
    
    func transformPointRotationOnly(_ x: Float, _ y: Float) -> Point {
        jiggle.transformPointRotationOnly(x, y)
    }
    
    func transformPointRotationOnly(point: Point) -> Point {
        jiggle.transformPointRotationOnly(point: point)
    }
    
    func transformPointRotationOnly(vector: Vector) -> Vector {
        jiggle.transformPointRotationOnly(vector: vector)
    }
    
    func untransformPoint(_ x: Float, _ y: Float) -> Point {
        jiggle.untransformPoint(x, y)
    }
    
    func untransformPoint(point: Point) -> Point {
        jiggle.untransformPoint(point: point)
    }
    
    func untransformPointScaleAndRotationOnly(_ x: Float, _ y: Float) -> Point {
        jiggle.untransformPointScaleAndRotationOnly(x, y)
    }
    
    func untransformPointScaleAndRotationOnly(point: Point) -> Point {
        jiggle.untransformPointScaleAndRotationOnly(point: point)
    }
    
    func untransformPointRotationOnly(_ x: Float, _ y: Float) -> Point {
        jiggle.untransformPointRotationOnly(x, y)
    }
    
    func untransformPointRotationOnly(point: Point) -> Point {
        jiggle.untransformPointRotationOnly(point: point)
    }
    
    func transformMagnitude(_ magnitude: Float) -> Float {
        jiggle.transformMagnitude(magnitude)
    }
    
    func untransformMagnitude(_ magnitude: Float) -> Float {
        jiggle.untransformMagnitude(magnitude)
    }
    
    func addIndexTriangle(p1: Point, p2: Point, p3: Point) {
        addIndexTriangle(x1: p1.x, y1: p1.y,
                         x2: p2.x, y2: p2.y,
                         x3: p3.x, y3: p3.y)
    }
    
    func addIndexTriangle(x1: Float, y1: Float,
                          x2: Float, y2: Float,
                          x3: Float, y3: Float) {
        
        triangleData.add(x1: x1, y1: y1,
                         x2: x2, y2: y2,
                         x3: x3, y3: y3)
        
    }
}
