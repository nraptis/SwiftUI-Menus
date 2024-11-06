//
//  RingBuilder.swift
//  Manifold
//
//  Created by Nicky Taylor on 8/3/24.
//

import Foundation

class RingBuilder {
    
    static let minimumPoints = 4
    static let maximumNumberOfRings = 5
    static let minimumNumberOfRings = 1
    
    static let requiredEdgePoints = 32
    
    static let stepSize = Float(12.0)
    static let stepSizeSquared = (stepSize * stepSize)
    
    static let erodeCount = 3
    static let dilateCount = 3
    
    typealias Point = Math.Point
    typealias Vector = Math.Vector
    
    var splines = [ManualSpline]()
    
    let jiggleWeightSegmentBucket = JiggleWeightSegmentBucket()
    let jiggleWeightPointInsidePolygonBucket = JiggleWeightPointInsidePolygonBucket()
    
    var jiggleWeightSegments = [JiggleWeightSegment]()
    var jiggleWeightSegmentCount = 0
    func addJiggleWeightSegment(_ jiggleWeightSegment: JiggleWeightSegment) {
        while jiggleWeightSegments.count <= jiggleWeightSegmentCount {
            jiggleWeightSegments.append(jiggleWeightSegment)
        }
        jiggleWeightSegments[jiggleWeightSegmentCount] = jiggleWeightSegment
        jiggleWeightSegmentCount += 1
    }
    
    func purgeJiggleWeightSegments() {
        for jiggleWeightSegmentsIndex in 0..<jiggleWeightSegmentCount {
            JigglePartsFactory.shared.depositJiggleWeightSegment(jiggleWeightSegments[jiggleWeightSegmentsIndex])
        }
        jiggleWeightSegmentCount = 0
    }
    
    var jiggleWeightPoints = [JiggleWeightPoint]()
    var jiggleWeightPointCount = 0
    func addJiggleWeightPoint(_ jiggleWeightPoint: JiggleWeightPoint) {
        while jiggleWeightPoints.count <= jiggleWeightPointCount {
            jiggleWeightPoints.append(jiggleWeightPoint)
        }
        jiggleWeightPoints[jiggleWeightPointCount] = jiggleWeightPoint
        jiggleWeightPointCount += 1
    }
    
    func purgeJiggleWeightPoints() {
        for jiggleWeightPointIndex in 0..<jiggleWeightPointCount {
            JigglePartsFactory.shared.depositJiggleWeightPoint(jiggleWeightPoints[jiggleWeightPointIndex])
        }
        jiggleWeightPointCount = 0
    }
    
    var angle = Float(0.0)
    var magnitude = Float(0.0)
    var numberOfRings = 3
    
    var _minX = Float(0.0)
    var _minY = Float(0.0)
    var _maxX = Float(0.0)
    var _maxY = Float(0.0)
    
    var _centerX = Float(0.0)
    var _centerY = Float(0.0)
    
    var isComputing = false
    var isErrorPresent = false
    
    let splineReducer = SplineReducer()
    
    var outlinePath = OutlinePath()
    
    init() {
        
    }
    
    func compute_PartA(jiggle: Jiggle, angle: Float) {
        isComputing = true
        isErrorPresent = false
        
        computeResult.numberOfRingsRequested = 0
        computeResult.numberOfRingsGenerated = 0
        
        self.angle = angle - jiggle.rotation
        
        splines.removeAll()
        
        // Ingest from the Jiggle, the pointz.
        purgeJiggleWeightPoints()
        if jiggle.outlinePath.count >= Self.minimumPoints {
            
            var outlinePathIndex = 0
            while outlinePathIndex < jiggle.outlinePath.count {
                let jiggleWeightPoint = JigglePartsFactory.shared.withdrawJiggleWeightPoint()
                jiggleWeightPoint.x = jiggle.outlinePath.x[outlinePathIndex]
                jiggleWeightPoint.y = jiggle.outlinePath.y[outlinePathIndex]
                addJiggleWeightPoint(jiggleWeightPoint)
                outlinePathIndex += 1
            }
            
        } else {
            isErrorPresent = true
        }
    }
    
    //var stashedGridz = [RingBuilderGrid]()
    
    var computeResult = ComputeResult()
    
    struct ComputeResult {
        var numberOfRingsRequested = 0
        var numberOfRingsGenerated = 0
    }
    
    func compute_PartB(magnitude: Float,
                       numberOfRings: Int) async {
        
        computeResult.numberOfRingsRequested = numberOfRings
        computeResult.numberOfRingsGenerated = 0
        
        
        var numberOfRings = numberOfRings
        if numberOfRings > RingBuilder.maximumNumberOfRings { numberOfRings = RingBuilder.maximumNumberOfRings }
        if numberOfRings < RingBuilder.minimumNumberOfRings { numberOfRings = RingBuilder.minimumNumberOfRings }
        self.numberOfRings = numberOfRings
        
        var magnitude = magnitude
        if magnitude < 0.0 { magnitude = 0.0 }
        if magnitude > 1.0 { magnitude = 1.0 }
        self.magnitude = magnitude
        
        
        var ringIndex = 0
        while ringIndex < numberOfRings {
            
            // So if it's not loop #0, we use the last ring computed as the seed...
            
            if ringIndex > 0 {
                
                await _intakeLastSpline()
                
            }
            
            let ringBuilderGrid = RingBuilderGrid()
            
            await _computeBuildLineSegments()
            
            await _computeBuildPointInsidePolygonBucket()
            
            await _computeSegmentBucket()
            
            await _computeMinMaxCenter()
            
            let minX = _minX
            let minY = _minY
            let maxX = _maxX
            let maxY = _maxY
            
            await ringBuilderGrid.sizeGridAndCalculateNodePositionsLoFi(minX: minX, minY: minY,
                                                                        maxX: maxX, maxY: maxY)
            //await ringBuilderGrid.calculateNodeInsideLoFi(jiggleWeightPointInsidePolygonBucket: jiggleWeightPointInsidePolygonBucket)
            await ringBuilderGrid.calculateDistanceFromEdgeAndNearSegmentsLoFi(jiggleWeightSegments: jiggleWeightSegments,
                                                                               jiggleWeightSegmentCount: jiggleWeightSegmentCount)
            await ringBuilderGrid.sizeGridHiFi()
            await ringBuilderGrid.calculateNodeInterpolationHiFi()
            await ringBuilderGrid.calculateNodePositionsHiFi()
            await ringBuilderGrid.calculateNodeInsideHiFi(jiggleWeightPointInsidePolygonBucket: jiggleWeightPointInsidePolygonBucket)
            await ringBuilderGrid.calculateDistanceFromEdgeHiFi()
            await ringBuilderGrid.calculateCentroidHiFi()
            await ringBuilderGrid.calculateDistanceFromCentroidHiFi()
            await ringBuilderGrid.calculateGravityAdjustmentPercent_PartA(angle: angle, magnitude: magnitude)
            await ringBuilderGrid.calculateGravityAdjustmentPercent_PartB(angle: angle, magnitude: magnitude)
            
            await ringBuilderGrid.calculateInclusion_PartA(ringIndex: ringIndex, numberOfRings: numberOfRings)
            if await ringBuilderGrid.calculateInclusionExists(ringIndex: ringIndex, numberOfRings: numberOfRings) == false {
                return
            }
            
            await ringBuilderGrid.calculateInclusion_PartB(numberOfTimes: Self.erodeCount)
            if await ringBuilderGrid.calculateInclusionExists(ringIndex: ringIndex, numberOfRings: numberOfRings) == false {
                return
            }
            
            await ringBuilderGrid.calculateInclusion_PartC(numberOfTimes: Self.dilateCount)
            if await ringBuilderGrid.calculateInclusionExists(ringIndex: ringIndex, numberOfRings: numberOfRings) == false {
                return
            }
            
            await ringBuilderGrid.calculateInclusion_PartD()
            await ringBuilderGrid.calculateInclusion_PartE()
            if await ringBuilderGrid.calculateInclusionExists(ringIndex: ringIndex, numberOfRings: numberOfRings) == false {
                return
            }
            
            await ringBuilderGrid.calculateEdgePoints()
            
            
            let edgePointList = ringBuilderGrid.edgePointList
            if edgePointList.count < Self.requiredEdgePoints {
                return
            }
            
            let spline = await getReducedSpline(edgePointList: edgePointList, ringBuilderGrid: ringBuilderGrid)
            
            splines.append(spline)
            
            ringIndex += 1
            
            computeResult.numberOfRingsGenerated = ringIndex
        }
    }
    
    func compute_PartC(jiggleViewModel: JiggleViewModel) -> ComputeResult {
        
        if computeResult.numberOfRingsGenerated > 0 {
            _ = jiggleViewModel.attemptCreateGuidesFromSplines(splines: splines,
                                                                    isUntransformRequired: false,
                                                                    isFixWeightCenterRequired: true)
        }
        
        isComputing = false
        return computeResult
    }
    
    private func _intakeLastSpline() async {
        
        if splines.count > 0 {
            
            let lastSpline = splines[splines.count - 1]
            
            outlinePath.removeAll(keepingCapacity: true)
            
            var position = Float(0.0)
            while position < lastSpline.maxPos {
                let pointX = lastSpline.getX(position)
                let pointY = lastSpline.getY(position)
                outlinePath.addPoint(x: pointX, y: pointY)
                position += 0.01
            }
            
            outlinePath.solve(step: PolyMeshConstants.splineThresholdDistance)
            
            purgeJiggleWeightPoints()
            
            var outlinePathIndex = 0
            while outlinePathIndex < outlinePath.count {
                let jiggleWeightPoint = JigglePartsFactory.shared.withdrawJiggleWeightPoint()
                jiggleWeightPoint.x = outlinePath.x[outlinePathIndex]
                jiggleWeightPoint.y = outlinePath.y[outlinePathIndex]
                addJiggleWeightPoint(jiggleWeightPoint)
                outlinePathIndex += 1
            }
        }
    }
    
    private func _computeBuildLineSegments() async {
        
        purgeJiggleWeightSegments()
        var jiggleWeightPointIndex1 = 0
        var jiggleWeightPointIndex2 = 1
        while jiggleWeightPointIndex1 < jiggleWeightPointCount {
            let jiggleWeightPoint1 = jiggleWeightPoints[jiggleWeightPointIndex1]
            let jiggleWeightPoint2 = jiggleWeightPoints[jiggleWeightPointIndex2]
            let jiggleWeightSegment = JigglePartsFactory.shared.withdrawJiggleWeightSegment()
            jiggleWeightSegment.x1 = jiggleWeightPoint1.x
            jiggleWeightSegment.y1 = jiggleWeightPoint1.y
            jiggleWeightSegment.x2 = jiggleWeightPoint2.x
            jiggleWeightSegment.y2 = jiggleWeightPoint2.y
            jiggleWeightSegment.precompute()
            
            addJiggleWeightSegment(jiggleWeightSegment)
            if jiggleWeightSegment.isIllegal {
                isErrorPresent = true
                return
            }
            
            jiggleWeightPointIndex1 += 1
            jiggleWeightPointIndex2 += 1
            if jiggleWeightPointIndex2 == jiggleWeightPointCount {
                jiggleWeightPointIndex2 = 0
            }
        }
    }
    
    private func _computeBuildPointInsidePolygonBucket() async {
        jiggleWeightPointInsidePolygonBucket.build(jiggleWeightSegments: jiggleWeightSegments,
                                                   jiggleWeightSegmentCount: jiggleWeightSegmentCount)
    }
    
    private func _computeSegmentBucket() async {
        jiggleWeightSegmentBucket.build(jiggleWeightSegments: jiggleWeightSegments,
                                        jiggleWeightSegmentCount: jiggleWeightSegmentCount)
    }
    
    private func _computeMinMaxCenter() async {
        if jiggleWeightPoints.count > 0 {
            _minX = jiggleWeightPoints[0].x
            _minY = jiggleWeightPoints[0].y
            _maxX = jiggleWeightPoints[0].x
            _maxY = jiggleWeightPoints[0].y
            
            for jiggleWeightPointIndex in 0..<jiggleWeightPointCount {
                let jiggleWeightPoint = jiggleWeightPoints[jiggleWeightPointIndex]
                if jiggleWeightPoint.x < _minX { _minX = jiggleWeightPoint.x }
                if jiggleWeightPoint.y < _minY { _minY = jiggleWeightPoint.y }
                
                if jiggleWeightPoint.x > _maxX { _maxX = jiggleWeightPoint.x }
                if jiggleWeightPoint.y > _maxY { _maxY = jiggleWeightPoint.y }
            }
            
            _centerX = (_minX + _maxX) * 0.5
            _centerY = (_minY + _maxY) * 0.5
            
        }
    }
    
    private func getReducedSpline(edgePointList: IntPointList, ringBuilderGrid: RingBuilderGrid) async -> ManualSpline {
        
        let inputSpline = ManualSpline()
        
        var edgePointIndex = 0
        
        var indexX = ringBuilderGrid.edgePointList.x[0]
        var indexY = ringBuilderGrid.edgePointList.y[0]
        
        var node = ringBuilderGrid.gridHiFi[indexX][indexY]
        
        var previousX = node.x
        var previousY = node.y
        
        inputSpline.addControlPoint(previousX, previousY)
        
        indexX = ringBuilderGrid.edgePointList.x[ringBuilderGrid.edgePointList.count - 1]
        indexY = ringBuilderGrid.edgePointList.y[ringBuilderGrid.edgePointList.count - 1]
        
        node = ringBuilderGrid.gridHiFi[indexX][indexY]
        
        let lastX = node.x
        let lastY = node.y
        
        let checkLastCeiling = ringBuilderGrid.edgePointList.count - 14
        while edgePointIndex < ringBuilderGrid.edgePointList.count {
            let indexX = ringBuilderGrid.edgePointList.x[edgePointIndex]
            let indexY = ringBuilderGrid.edgePointList.y[edgePointIndex]
            let node = ringBuilderGrid.gridHiFi[indexX][indexY]
            let x = node.x
            let y = node.y
            
            let diffX1 = x - previousX
            let diffY1 = y - previousY
            let distanceSquared1 = diffX1 * diffX1 + diffY1 * diffY1
            
            if distanceSquared1 > Self.stepSizeSquared {
                
                if edgePointIndex > checkLastCeiling {
                    
                    let diffX2 = x - lastX
                    let diffY2 = y - lastY
                    let distanceSquared2 = diffX2 * diffX2 + diffY2 * diffY2
                    
                    if distanceSquared2 < DrawingCaptureTool.stepSizeSquared {
                        break
                    }
                }
                
                inputSpline.addControlPoint(x, y)
                
                previousX = x
                previousY = y
            }
            
            edgePointIndex += 1
        }
        
        inputSpline.solve(closed: true)
        
        let outputSpline = ManualSpline()
        splineReducer.reduce(inputSpline: inputSpline,
                             outputSpline: outputSpline,
                             numberOfTriesTight: 500,
                             numberOfTriesLoose: 300)
        
        return outputSpline
    }
    
}
