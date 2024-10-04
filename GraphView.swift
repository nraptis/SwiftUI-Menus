//
//  GraphView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import UIKit
import Combine

class GraphView: UIView {
    
    typealias GrabWeightCurveControlPointData = JiggleDocumentPublisherLibrary.GrabWeightCurveControlPointData
    typealias GrabWeightCurveControlTanHandleData = JiggleDocumentPublisherLibrary.GrabWeightCurveControlTanHandleData
    typealias TanType = JiggleDocument.TanType
    typealias Point = Math.Point
    
    
    let cornerRadius: Int
    required init(cornerRadius: Int) {
        self.cornerRadius = cornerRadius
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var _grabWeightCurveControlPointData = GrabWeightCurveControlPointData()
    var grabWeightCurveControlPointStopPublisher = PassthroughSubject<GrabWeightCurveControlPointData, Never>()
    
    var _grabWeightCurveControlTanHandleData = GrabWeightCurveControlTanHandleData()
    var grabWeightCurveControlTanHandleStopPublisher = PassthroughSubject<GrabWeightCurveControlTanHandleData, Never>()
    
    
    lazy var mediumDotStroke: UIImage = {
        if let image = UIImage(named: "ring_dot_medium_stroke") {
            return image
        }
        return UIImage()
    }()
    
    lazy var mediumDot: UIImage = {
        if let image = UIImage(named: "ring_dot_medium") {
            return image
        }
        return UIImage()
    }()
    
    lazy var weightCurveDotFillDark: UIImage = {
        if let tinted = tintedCircle(image: mediumDot,
                                     tintColor: ToolInterfaceTheme._graphPointFillDark) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var weightCurveDotFillLight: UIImage = {
        if let tinted = tintedCircle(image: mediumDot,
                                     tintColor: ToolInterfaceTheme._graphPointFillLight) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var weightCurveDotStrokeDark: UIImage = {
        if let tinted = tintedCircle(image: mediumDotStroke,
                                     tintColor: ToolInterfaceTheme._graphLineStrokeDark) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var weightCurveDotStrokeLight: UIImage = {
        if let tinted = tintedCircle(image: mediumDotStroke,
                                     tintColor: ToolInterfaceTheme._graphLineStrokeLight) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var tanDotFillDark: UIImage = {
        if let tinted = tintedCircle(image: smallDot, tintColor: ToolInterfaceTheme._graphTanPointFillDark) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var tanDotFillLight: UIImage = {
        if let tinted = tintedCircle(image: smallDot, tintColor: ToolInterfaceTheme._graphTanPointFillLight) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var tanDotStrokeDark: UIImage = {
        if let tinted = tintedCircle(image: smallDotStroke, tintColor: ToolInterfaceTheme._graphLineStrokeDark) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var tanDotStrokeLight: UIImage = {
        if let tinted = tintedCircle(image: smallDotStroke, tintColor: ToolInterfaceTheme._graphLineStrokeLight) {
            return tinted
        }
        return mediumDot
    }()
    
    
    lazy var smallDotStroke: UIImage = {
        if let image = UIImage(named: "ring_dot_small_stroke") {
            return image.withRenderingMode(.alwaysTemplate)
        }
        return UIImage()
    }()
    
    lazy var smallDot: UIImage = {
        if let image = UIImage(named: "ring_dot_small") {
            
            if let result = tintedCircle(image: image, tintColor: UIColor.green) {
                return result
            }
            
            return image.withRenderingMode(.alwaysTemplate)
        }
        return UIImage()
    }()
    
    func tintedCircle(image: UIImage, tintColor: UIColor) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        guard let context = UIGraphicsGetCurrentContext(), let cgImage = image.cgImage else {
            UIGraphicsEndImageContext()
            return nil
        }
        
        // Flip the context to correct orientation
        //context.scaleBy(x: 1.0, y: -1.0)
        //context.translateBy(x: 0.0, y: -image.size.height)
        
        // Set the blend mode to color
        context.setBlendMode(.normal)
        let rect = CGRect(origin: .zero, size: image.size)
        
        // Draw the image into the context
        context.draw(cgImage, in: rect)
        
        // Set the blend mode to source in
        context.setBlendMode(.sourceIn)
        tintColor.setFill()
        context.fill(rect)
        
        // Get the new image
        let tintedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return tintedImage
    }
    
    
    
    
    // Depth Curve Control Point
    var selectedWeightCurveControlPointTouch: UITouch?
    var selectedWeightCurveControlPointStartTouchY = Float(0.0)
    var selectedWeightCurveControlPointStartY = Float(0.0)
    
    // Depth Curve Control Tans
    var selectedWeightCurveControlTanTouch: UITouch?
    var selectedWeightCurveControlTanStartTouchX = Float(0.0)
    var selectedWeightCurveControlTanStartTouchY = Float(0.0)
    var selectedWeightCurveControlTanStartHandleX = Float(0.0)
    var selectedWeightCurveControlTanStartHandleY = Float(0.0)
    var selectedWeightCurveControlTanStartHandleOffsetX = Float(0.0)
    var selectedWeightCurveControlTanStartHandleOffsetY = Float(0.0)
    var selectedWeightCurveControlTanType = TanType.in
    
    weak var weightCurve: WeightCurve?
    weak var jiggle: Jiggle?
    
    weak var jiggleDocument: JiggleDocument?
    weak var jiggleScene: JiggleScene?
    
    private func draw(context: CGContext, image: UIImage, point: CGPoint) {
        
        let width2 = image.size.width * 0.5
        let height2 = image.size.height * 0.5
        let rect = CGRect(x: point.x - width2,
                          y: point.y - height2,
                          width: image.size.width,
                          height: image.size.height)
        
        if let cgImage = image.cgImage {
            context.draw(cgImage, in: rect, byTiling: false)
        }
        
    }
    
    private func drawEmpty(context: CGContext) {
        
        
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.clear(bounds)
        

        let floodPath = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(cornerRadius))

        context.saveGState()
        context.addPath(floodPath.cgPath)
        
        if ApplicationController.isDarkModeEnabled {
            context.setFillColor(ToolInterfaceTheme._graphBackgroundDark.cgColor)
        } else {
            context.setFillColor(ToolInterfaceTheme._graphBackgroundLight.cgColor)
        }
        
        context.fillPath()
        context.restoreGState()
        
        guard let jiggleScene = jiggleScene else {
            drawEmpty(context: context)
            return
        }
        
        guard let jiggle = jiggle else {
            drawEmpty(context: context)
            return
        }
        
        guard let weightCurve = weightCurve else {
            drawEmpty(context: context)
            return
        }
        
        let frameWidth = jiggleScene.graphWidth
        let frameHeight = jiggleScene.graphHeight
        let paddingH = jiggleScene.graphPaddingH
        let paddingV = jiggleScene.graphPaddingV
        
        var splinePoints = [CGPoint]()
        let spline = weightCurve.spline
        let splineFactor = Float(1) / Float(weightCurve.spline.count - 1)
        
        let minX = paddingH
        let minY = paddingV
        let width = (frameWidth - paddingH - paddingH)
        let height = (frameHeight - paddingV - paddingV)
        let maxX = minX + width
        let maxY = minY + height
        
        var position = Float(0.0)
        let x = minX + spline.getX(0.0) * width * splineFactor
        let y = minY + spline.getY(0.0) * height
        var lastX = x
        var lastY = y
        let finalX = minX + spline.getX(spline.maxPos) * width * splineFactor
        let finalY = minY + spline.getY(spline.maxPos) * height
        
        splinePoints.append(CGPoint(x: x, y: y))
        
        let threshold = Float(2.0)
        let thresholdSquared = (threshold * threshold)
        
        while position <= spline.maxPos {
            var x = minX + spline.getX(position) * width * splineFactor
            var y = minY + spline.getY(position) * height
            
            let diffX1 = x - lastX
            let diffY1 = y - lastY
            let distanceSquared1 = diffX1 * diffX1 + diffY1 * diffY1
            
            if distanceSquared1 > thresholdSquared {
                let diffX2 = x - finalX
                let diffY2 = y - finalY
                let distanceSquared2 = diffX2 * diffX2 + diffY2 * diffY2
                if distanceSquared2 > thresholdSquared {
                    lastX = x
                    lastY = y
                    
                    if x < minX { x = minX }
                    if x > maxX { x = maxX }
                    if y < minY { y = minY }
                    if y > maxY { y = maxY }
                    
                    splinePoints.append(CGPoint(x: x, y: y))
                }
            }
            position += 0.05
        }
        splinePoints.append(CGPoint(x: finalX, y: finalY))
        
        //var tanPointPairs = [(CGPoint, CGPoint)]()
        var tanPointPairsIn = [(CGPoint, CGPoint)]()
        var tanPointPairsOut = [(CGPoint, CGPoint)]()
        
        
        
        let controlPointCount = weightCurve.weightCurveControlPointCount
        let controlPointCount1 = (controlPointCount - 1)
        
        for controlPointIndex in 0..<controlPointCount {
            let controlPoint = weightCurve.weightCurveControlPoints[controlPointIndex]
            let tanHandles = controlPoint.getTanHandles(index: controlPointIndex,
                                                        count: controlPointCount,
                                                        frameWidth: frameWidth,
                                                        frameHeight: frameHeight,
                                                        paddingH: paddingH,
                                                        paddingV: paddingV)
            let x = controlPoint.getX(index: controlPointIndex,
                                      count: controlPointCount,
                                      frameWidth: frameWidth,
                                      paddingH: paddingH)
            let y = controlPoint.getY(index: controlPointIndex,
                                      count: controlPointCount,
                                      frameHeight: frameHeight,
                                      paddingV: paddingV)
            let center = CGPoint(x: x, y: y)
            if controlPointIndex != 0 {
                var pointIn = Point(x: tanHandles.inX, y: tanHandles.inY)
                if pointIn.x < minX { pointIn.x = minX }
                if pointIn.x > maxX { pointIn.x = maxX }
                if pointIn.y < minY { pointIn.y = minY }
                if pointIn.y > maxY { pointIn.y = maxY }
                tanPointPairsIn.append((pointIn.cgPoint, center))
            }
            
            if controlPointIndex != controlPointCount1 {
                var pointOut = Point(x: tanHandles.outX, y: tanHandles.outY)
                if pointOut.x < minX { pointOut.x = minX }
                if pointOut.x > maxX { pointOut.x = maxX }
                if pointOut.y < minY { pointOut.y = minY }
                if pointOut.y > maxY { pointOut.y = maxY }
                tanPointPairsOut.append((center, pointOut.cgPoint))
            }

        }
        
        /*
        let weightCurveControlPointCount = weightCurve.weightCurveControlPointCount
        let weightCurveControlPointCount1 = (weightCurveControlPointCount - 1)
        for weightCurveControlPointIndex in 0..<weightCurve.weightCurveControlPointCount {
            let weightCurveControlPoint = weightCurve.weightCurveControlPoints[weightCurveControlPointIndex]
            let tanHandles = weightCurveControlPoint.getTanHandles(index: weightCurveControlPointIndex,
                                                                   count: weightCurve.weightCurveControlPointCount,
                                                                   frameWidth: frameWidth,
                                                                   frameHeight: frameHeight,
                                                                   paddingH: paddingH,
                                                                   paddingV: paddingV)
            
            var pointIn = Point(x: tanHandles.inX, y: tanHandles.inY)
            var pointOut = Point(x: tanHandles.outX, y: tanHandles.outY)
            
            if weightCurveControlPointIndex == 0 {
                let index = weightCurveControlPointIndex
                let count = weightCurve.weightCurveControlPointCount
                let x = weightCurveControlPoint.getX(index: index,
                                                     count: count,
                                                     frameWidth: frameWidth,
                                                     paddingH: paddingH)
                let y = weightCurveControlPoint.getY(index: index,
                                                     count: count,
                                                     frameHeight: frameHeight,
                                                     paddingV: paddingV)
                pointIn.x = x
                pointIn.y = y
            }
            if weightCurveControlPointIndex == weightCurveControlPointCount1 {
                let index = weightCurveControlPointIndex
                let count = weightCurve.weightCurveControlPointCount
                let x = weightCurveControlPoint.getX(index: index,
                                                     count: count,
                                                     frameWidth: frameWidth,
                                                     paddingH: paddingH)
                let y = weightCurveControlPoint.getY(index: index,
                                                     count: count,
                                                     frameHeight: frameHeight,
                                                     paddingV: paddingV)
                pointOut.x = x
                pointOut.y = y
            }
            
            tanPointPairs.append((pointIn.cgPoint, pointOut.cgPoint))
        }
        */
        
        var controlPoints = [CGPoint]()
        for weightCurveControlPointIndex in 0..<weightCurve.weightCurveControlPointCount {
            let weightCurveControlPoint = weightCurve.weightCurveControlPoints[weightCurveControlPointIndex]
            let index = weightCurveControlPointIndex
            let count = weightCurve.weightCurveControlPointCount
            let x = weightCurveControlPoint.getX(index: index,
                                                 count: count,
                                                 frameWidth: frameWidth,
                                                 paddingH: paddingH)
            let y = weightCurveControlPoint.getY(index: index,
                                                 count: count,
                                                 frameHeight: frameHeight,
                                                 paddingV: paddingV)
            controlPoints.append(CGPoint(x: x, y: y))
        }
        
        context.saveGState()
        context.setLineWidth(ToolInterfaceTheme.graphCurveStrokeThickness)
        if ApplicationController.isDarkModeEnabled {
            context.setStrokeColor(ToolInterfaceTheme._graphLineStrokeDark.cgColor)
        } else {
            context.setStrokeColor(ToolInterfaceTheme._graphLineStrokeLight.cgColor)
        }
        context.setLineCap(.butt)
        if splinePoints.count > 0 {
            for splineIndex in 0..<splinePoints.count {
                let point = splinePoints[splineIndex]
                if splineIndex == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
        }
        context.strokePath()
        context.restoreGState()
        
        context.saveGState()
        context.setLineWidth(ToolInterfaceTheme.graphCurveFillThickness)
        //context.setStrokeColor(ToolInterfaceTheme._graphCurveLineFill.cgColor)
        if ApplicationController.isDarkModeEnabled {
            context.setStrokeColor(ToolInterfaceTheme._graphLineFillDark.cgColor)
        } else {
            context.setStrokeColor(ToolInterfaceTheme._graphLineFillLight.cgColor)
        }
        context.setLineCap(.butt)
        if splinePoints.count > 0 {
            for splineIndex in 0..<splinePoints.count {
                let point = splinePoints[splineIndex]
                if splineIndex == 0 {
                    context.move(to: point)
                } else {
                    context.addLine(to: point)
                }
            }
        }
        
        context.strokePath()
        context.restoreGState()
        
        for tanPointPair in tanPointPairsIn {
            let point1 = tanPointPair.0
            let point2 = tanPointPair.1
            context.saveGState()
            context.setLineWidth(ToolInterfaceTheme.graphTanLineStrokeThickness)
            if ApplicationController.isDarkModeEnabled {
                context.setStrokeColor(ToolInterfaceTheme._graphLineStrokeDark.cgColor)
            } else {
                context.setStrokeColor(ToolInterfaceTheme._graphLineStrokeLight.cgColor)
            }
            context.setLineCap(.butt)
            context.move(to: point1)
            context.addLine(to: point2)
            context.strokePath()
            context.restoreGState()
        }
        
        for tanPointPair in tanPointPairsOut {
            let point1 = tanPointPair.0
            let point2 = tanPointPair.1
            context.saveGState()
            context.setLineWidth(ToolInterfaceTheme.graphTanLineStrokeThickness)
            if ApplicationController.isDarkModeEnabled {
                context.setStrokeColor(ToolInterfaceTheme._graphLineStrokeDark.cgColor)
            } else {
                context.setStrokeColor(ToolInterfaceTheme._graphLineStrokeLight.cgColor)
            }
            context.setLineCap(.butt)
            context.move(to: point1)
            context.addLine(to: point2)
            context.strokePath()
            context.restoreGState()
        }
        
        for tanPointPair in tanPointPairsIn {
            let point1 = tanPointPair.0
            let point2 = tanPointPair.1
            context.saveGState()
            context.setLineWidth(ToolInterfaceTheme.graphTanLineFillThickness)
            if ApplicationController.isDarkModeEnabled {
                context.setStrokeColor(ToolInterfaceTheme._graphTanLineFillDark.cgColor)
            } else {
                context.setStrokeColor(ToolInterfaceTheme._graphTanLineFillLight.cgColor)
            }
            context.setLineCap(.butt)
            context.move(to: point1)
            context.addLine(to: point2)
            context.strokePath()
            context.restoreGState()
        }
        
        for tanPointPair in tanPointPairsOut {
            let point1 = tanPointPair.0
            let point2 = tanPointPair.1
            context.saveGState()
            context.setLineWidth(ToolInterfaceTheme.graphTanLineFillThickness)
            if ApplicationController.isDarkModeEnabled {
                context.setStrokeColor(ToolInterfaceTheme._graphTanLineFillDark.cgColor)
            } else {
                context.setStrokeColor(ToolInterfaceTheme._graphTanLineFillLight.cgColor)
            }
            context.setLineCap(.butt)
            context.move(to: point1)
            context.addLine(to: point2)
            context.strokePath()
            context.restoreGState()
        }
        
        let tanDotStroke: UIImage
        if ApplicationController.isDarkModeEnabled {
            tanDotStroke = tanDotStrokeDark
        } else {
            tanDotStroke = tanDotStrokeLight
        }
        
        for tanPointPair in tanPointPairsIn {
            draw(context: context,
                 image: tanDotStroke,
                 point: tanPointPair.0)
        }
        
        for tanPointPair in tanPointPairsOut {
            draw(context: context,
                 image: tanDotStroke,
                 point: tanPointPair.1)
        }

        let tanDotFill: UIImage
        if ApplicationController.isDarkModeEnabled {
            tanDotFill = tanDotFillDark
        } else {
            tanDotFill = tanDotFillLight
        }
        for tanPointPair in tanPointPairsIn {
            draw(context: context,
                 image: tanDotFill,
                 point: tanPointPair.0)
        }
        
        for tanPointPair in tanPointPairsOut {
            draw(context: context,
                 image: tanDotFill,
                 point: tanPointPair.1)
        }
        
        
        let weightCurveDotStroke: UIImage
        if ApplicationController.isDarkModeEnabled {
            weightCurveDotStroke = weightCurveDotStrokeDark
        } else {
            weightCurveDotStroke = weightCurveDotStrokeLight
        }
        for controlPoint in controlPoints {
            draw(context: context,
                 image: weightCurveDotStroke,
                 point: controlPoint)
        }
        
        let weightCurveDotFill: UIImage
        if ApplicationController.isDarkModeEnabled {
            weightCurveDotFill = weightCurveDotFillDark
        } else {
            weightCurveDotFill = weightCurveDotFillLight
        }
        for controlPoint in controlPoints {
            draw(context: context,
                 image: weightCurveDotFill,
                 point: controlPoint)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let jiggleScene = jiggleScene else {
            killDragAll()
            return
        }
        
        let frameWidth = jiggleScene.graphWidth
        let frameHeight = jiggleScene.graphHeight
        let paddingH = jiggleScene.graphPaddingH
        let paddingV = jiggleScene.graphPaddingV
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptGrabWeightCurve(touch: touch,
                                   at: point,
                                   frameWidth: frameWidth,
                                   frameHeight: frameHeight,
                                   paddingH: paddingH,
                                   paddingV: paddingV)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let jiggleScene = jiggleScene else {
            killDragAll()
            return
        }
        
        let frameWidth = jiggleScene.graphWidth
        let frameHeight = jiggleScene.graphHeight
        let paddingH = jiggleScene.graphPaddingH
        let paddingV = jiggleScene.graphPaddingV
        
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptUpdateWeightCurve(touch: touch,
                                     at: point,
                                     isFromRelease: false,
                                     frameWidth: frameWidth,
                                     frameHeight: frameHeight,
                                     paddingH: paddingH,
                                     paddingV: paddingV)
            
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let jiggleScene = jiggleScene else {
            killDragAll()
            return
        }
        
        let frameWidth = jiggleScene.graphWidth
        let frameHeight = jiggleScene.graphHeight
        let paddingH = jiggleScene.graphPaddingH
        let paddingV = jiggleScene.graphPaddingV
        
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptUpdateWeightCurve(touch: touch,
                                     at: point,
                                     isFromRelease: true,
                                     frameWidth: frameWidth,
                                     frameHeight: frameHeight,
                                     paddingH: paddingH,
                                     paddingV: paddingV)

            
        }
        killDragAll()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let jiggleScene = jiggleScene else {
            killDragAll()
            return
        }
        
        let frameWidth = jiggleScene.graphWidth
        let frameHeight = jiggleScene.graphHeight
        let paddingH = jiggleScene.graphPaddingH
        let paddingV = jiggleScene.graphPaddingV
        
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptUpdateWeightCurve(touch: touch,
                                     at: point,
                                     isFromRelease: true,
                                     frameWidth: frameWidth,
                                     frameHeight: frameHeight,
                                     paddingH: paddingH,
                                     paddingV: paddingV)

            
        }
        killDragAll()
    }
    
    func attemptGrabWeightCurve(touch: UITouch,
                                at point: Point,
                                frameWidth: Float,
                                frameHeight: Float,
                                paddingH: Float,
                                paddingV: Float) {
        
        guard let jiggleDocument = jiggleDocument else {
            killDragAll()
            return
        }
        
        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        
        guard selectedWeightCurveControlPointTouch === nil else {
            return
        }
        
        guard selectedWeightCurveControlTanTouch === nil else {
            return
        }
        
        
        
        let selectDepthControlPointDistanceThreshold = JiggleDocument.selectDepthControlPointDistanceThreshold
        var bestControlPointDistance = selectDepthControlPointDistanceThreshold * selectDepthControlPointDistanceThreshold
        var bestControlPointIndex = -1
        for weightCurveControlPointIndex in 0..<jiggle.weightCurve.weightCurveControlPointCount {
            let weightCurveControlPoint = jiggle.weightCurve.weightCurveControlPoints[weightCurveControlPointIndex]
            
            let count = jiggle.weightCurve.weightCurveControlPointCount
            let x = weightCurveControlPoint.getX(index: weightCurveControlPointIndex,
                                                 count: count,
                                                 frameWidth: frameWidth,
                                                 paddingH: paddingH)
            let y = weightCurveControlPoint.getY(index: weightCurveControlPointIndex,
                                                 count: count,
                                                 frameHeight: frameHeight,
                                                 paddingV: paddingV)
            
            let diffX = x - point.x
            let diffY = y - point.y
            let dist = diffX * diffX + diffY * diffY
            if dist < bestControlPointDistance {
                bestControlPointDistance = dist
                bestControlPointIndex = weightCurveControlPointIndex
            }
        }
        
        let minX = paddingH
        let minY = paddingV
        let width = (frameWidth - paddingH - paddingH)
        let height = (frameHeight - paddingV - paddingV)
        let maxX = minX + width
        let maxY = minY + height
        
        let selectDepthControlTanDistanceThreshold = JiggleDocument.selectDepthControlTanDistanceThreshold
        var bestControlTanDistance = selectDepthControlTanDistanceThreshold * selectDepthControlTanDistanceThreshold
        var bestControlTanType = TanType.in
        var bestControlTanIndex = -1
        
        let weightCurveControlPointCount1 = (jiggle.weightCurve.weightCurveControlPointCount - 1)
        for weightCurveControlPointIndex in 0..<jiggle.weightCurve.weightCurveControlPointCount {
            let weightCurveControlPoint = jiggle.weightCurve.weightCurveControlPoints[weightCurveControlPointIndex]
            
            let count = jiggle.weightCurve.weightCurveControlPointCount
            let tanHandles = weightCurveControlPoint.getTanHandles(index: weightCurveControlPointIndex,
                                                                   count: count,
                                                                   frameWidth: frameWidth,
                                                                   frameHeight: frameHeight,
                                                                   paddingH: paddingH,
                                                                   paddingV: paddingV)
            
            var inX = tanHandles.inX
            if inX < minX { inX = minX }
            if inX > maxX { inX = maxX }
            
            var inY = tanHandles.inY
            if inY < minY { inY = minY }
            if inY > maxY { inY = maxY }
            
            var outX = tanHandles.outX
            if outX < minX { outX = minX }
            if outX > maxX { outX = maxX }
            
            var outY = tanHandles.outY
            if outY < minY { outY = minY }
            if outY > maxY { outY = maxY }
            
            let diffInX = inX - point.x
            let diffInY = inY - point.y
            let distIn = diffInX * diffInX + diffInY * diffInY
            
            let diffOutX = outX - point.x
            let diffOutY = outY - point.y
            let distOut = diffOutX * diffOutX + diffOutY * diffOutY
                 
            if weightCurveControlPointIndex != 0 {
                if distIn < bestControlTanDistance {
                    bestControlTanDistance = distIn
                    bestControlTanIndex = weightCurveControlPointIndex
                    bestControlTanType = .in
                }
            }
               
            if weightCurveControlPointIndex != weightCurveControlPointCount1 {
                if distOut < bestControlTanDistance {
                    bestControlTanDistance = distOut
                    bestControlTanIndex = weightCurveControlPointIndex
                    bestControlTanType = .out
                }
            }
        }
        
        func selectPoint() {
            let weightCurveControlPoint = jiggle.weightCurve.weightCurveControlPoints[bestControlPointIndex]
            
            let count = jiggle.weightCurve.weightCurveControlPointCount
            let y = weightCurveControlPoint.getY(index: bestControlPointIndex,
                                                 count: count,
                                                 frameHeight: frameHeight,
                                                 paddingV: paddingV)
            
            selectedWeightCurveControlPointTouch = touch
            selectedWeightCurveControlPointStartTouchY = point.y
            selectedWeightCurveControlPointStartY = y
            
            _handleGraphSelection(graphIndex: bestControlPointIndex)
            
            if let selectedWeightCurveControlPoint = jiggle.getSelectedWeightCurveControlPointBasedOnGraphIndex() {
                _grabWeightCurveControlPointData.didChange = false
                _grabWeightCurveControlPointData.startHeightFactor = selectedWeightCurveControlPoint.normalizedHeightFactor
                _grabWeightCurveControlPointData.endHeightFactor = selectedWeightCurveControlPoint.normalizedHeightFactor
                _grabWeightCurveControlPointData.startManual = selectedWeightCurveControlPoint.isManualHeightEnabled
                _grabWeightCurveControlPointData.jiggleIndex = jiggleDocument.getJiggleIndex(jiggle)
                _grabWeightCurveControlPointData.isFirstControlPoint = jiggle.getSelectedWeightCurveGraphIndexIsFirstControlPoint()
                _grabWeightCurveControlPointData.isLastControlPoint = jiggle.getSelectedWeightCurveGraphIndexIsLastControlPoint()
                _grabWeightCurveControlPointData.guideIndex = jiggle.getSelectedWeightCurveGraphIndexGuideIndex()
                
            }
        }
        
        func selectTan() {
            let weightCurveControlPoint = jiggle.weightCurve.weightCurveControlPoints[bestControlTanIndex]
            let count = jiggle.weightCurve.weightCurveControlPointCount
            let tanHandles = weightCurveControlPoint.getTanHandles(index: bestControlTanIndex,
                                                                   count: count,
                                                                   frameWidth: frameWidth,
                                                                   frameHeight: frameHeight,
                                                                   paddingH: paddingH,
                                                                   paddingV: paddingV)
            
            var inX = tanHandles.inX
            if inX < minX { inX = minX }
            if inX > maxX { inX = maxX }
            
            var inY = tanHandles.inY
            if inY < minY { inY = minY }
            if inY > maxY { inY = maxY }
            
            var outX = tanHandles.outX
            if outX < minX { outX = minX }
            if outX > maxX { outX = maxX }
            
            var outY = tanHandles.outY
            if outY < minY { outY = minY }
            if outY > maxY { outY = maxY }
            
            selectedWeightCurveControlTanTouch = touch
            selectedWeightCurveControlTanStartTouchX = point.x
            selectedWeightCurveControlTanStartTouchY = point.y
            switch bestControlTanType {
            case .in:
                selectedWeightCurveControlTanStartHandleX = inX
                selectedWeightCurveControlTanStartHandleY = inY
                
                selectedWeightCurveControlTanStartHandleOffsetX = tanHandles.inX - inX
                selectedWeightCurveControlTanStartHandleOffsetY = tanHandles.inY - inY
                
                selectedWeightCurveControlTanType = .in
            case .out:
                selectedWeightCurveControlTanStartHandleX = outX
                selectedWeightCurveControlTanStartHandleY = outY
                
                selectedWeightCurveControlTanStartHandleOffsetX = tanHandles.outX - outX
                selectedWeightCurveControlTanStartHandleOffsetY = tanHandles.outY - outY
                
                selectedWeightCurveControlTanType = .out
            }
            
            /*
            selectedTimeLineControlTanTouch = touch
            selectedTimeLineControlTanStartTouchX = point.x
            selectedTimeLineControlTanStartTouchY = point.y
            switch bestControlTanType {
            case .in:
                selectedTimeLineControlTanStartHandleX = inX
                selectedTimeLineControlTanStartHandleY = inY
                
                selectedTimeLineControlTanStartHandleOffsetX = tanHandles.inX - inX
                selectedTimeLineControlTanStartHandleOffsetY = tanHandles.inY - inY
                
                selectedTimeLineControlTanType = .in
            case .out:
                selectedTimeLineControlTanStartHandleX = outX
                selectedTimeLineControlTanStartHandleY = outY
                
                selectedTimeLineControlTanStartHandleOffsetX = tanHandles.outX - outX
                selectedTimeLineControlTanStartHandleOffsetY = tanHandles.outY - outY
                
                selectedTimeLineControlTanType = .out
            }
        */

            _handleGraphSelection(graphIndex: bestControlTanIndex)
            
            if let selectedWeightCurveControlPoint = jiggle.getSelectedWeightCurveControlPointBasedOnGraphIndex() {
                _grabWeightCurveControlTanHandleData.didChange = false
                _grabWeightCurveControlTanHandleData.startDirection = selectedWeightCurveControlPoint.normalizedTanDirection
                _grabWeightCurveControlTanHandleData.startMagnitudeIn = selectedWeightCurveControlPoint.normalizedTanMagnitudeIn
                _grabWeightCurveControlTanHandleData.startMagnitudeOut = selectedWeightCurveControlPoint.normalizedTanMagnitudeOut
                _grabWeightCurveControlTanHandleData.startManual = selectedWeightCurveControlPoint.isManualTanHandleEnabled
                _grabWeightCurveControlTanHandleData.startType = selectedWeightCurveControlTanType
                _grabWeightCurveControlTanHandleData.endDirection = selectedWeightCurveControlPoint.normalizedTanDirection
                _grabWeightCurveControlTanHandleData.endMagnitudeIn = selectedWeightCurveControlPoint.normalizedTanMagnitudeIn
                _grabWeightCurveControlTanHandleData.endMagnitudeOut = selectedWeightCurveControlPoint.normalizedTanMagnitudeOut
                _grabWeightCurveControlTanHandleData.jiggleIndex = jiggleDocument.getJiggleIndex(jiggle)
                _grabWeightCurveControlTanHandleData.isFirstControlPoint = jiggle.getSelectedWeightCurveGraphIndexIsFirstControlPoint()
                _grabWeightCurveControlTanHandleData.isLastControlPoint = jiggle.getSelectedWeightCurveGraphIndexIsLastControlPoint()
                _grabWeightCurveControlTanHandleData.guideIndex = jiggle.getSelectedWeightCurveGraphIndexGuideIndex()
            }
        }
        
        if bestControlPointIndex != -1 {
            if bestControlTanIndex != -1 {
                // Observation: We should slightly favor tan. Else it can
                // get stuck, in a bad-ish way.
                if (bestControlPointDistance + Math.epsilon) < bestControlTanDistance {
                    selectPoint()
                } else {
                    selectTan()
                }
            } else {
                selectPoint()
            }
        } else if bestControlTanIndex != -1 {
            selectTan()
        }
    }
    
    
    func attemptUpdateWeightCurve(touch: UITouch,
                                  at point: Point,
                                  isFromRelease: Bool,
                                  frameWidth: Float,
                                  frameHeight: Float,
                                  paddingH: Float,
                                  paddingV: Float) {
        if selectedWeightCurveControlTanTouch !== nil {
            attemptUpdateWeightCurveControlTan(touch: touch,
                                               at: point,
                                               isFromRelease: isFromRelease,
                                               frameWidth: frameWidth,
                                               frameHeight: frameHeight,
                                               paddingH: paddingH,
                                               paddingV: paddingV)
        } else if selectedWeightCurveControlPointTouch !== nil {
            attemptUpdateWeightCurveControlPoint(touch: touch,
                                                 at: point,
                                                 isFromRelease: isFromRelease,
                                                 frameWidth: frameWidth,
                                                 frameHeight: frameHeight,
                                                 paddingH: paddingH,
                                                 paddingV: paddingV)
        } else {
            killDragAll()
        }
    }
    
    func attemptUpdateWeightCurveControlPoint(touch: UITouch,
                                              at point: Point,
                                              isFromRelease: Bool,
                                              frameWidth: Float,
                                              frameHeight: Float,
                                              paddingH: Float,
                                              paddingV: Float) {
        
        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        guard let selectedWeightCurveControlPointTouch = selectedWeightCurveControlPointTouch else {
            killDragAll()
            return
        }
        guard let selectedWeightCurveControlPoint = jiggle.getSelectedWeightCurveControlPointBasedOnGraphIndex() else {
            killDragAll()
            return
        }
        guard let weightCurveControlIndex = jiggle.getWeightCurveControlIndex(weightCurveControlPoint: selectedWeightCurveControlPoint) else {
            killDragAll()
            return
        }
        
        guard touch === selectedWeightCurveControlPointTouch else {
            return
        }
        
        let deltaY = point.y - selectedWeightCurveControlPointStartTouchY
        var pointY = selectedWeightCurveControlPointStartY + deltaY
        var minY = jiggle.weightCurve.minY
        var maxY = jiggle.weightCurve.maxY
        let count = jiggle.weightCurve.weightCurveControlPointCount
        let tanHandles = selectedWeightCurveControlPoint.getTanHandlesRelativeOnlyY(index: weightCurveControlIndex,
                                                                                    count: count,
                                                                                    frameHeight: frameHeight,
                                                                                    paddingV: paddingV)
        /*
        // Check the out tan handle.
        if jiggle.selectedWeightCurveControlIndex < (jiggle.weightCurve.weightCurveControlPointCount - 1) {
            if tanHandles.outY < 0.0 {
                minY -= tanHandles.outY
            }
            if tanHandles.outY > 0.0 {
                maxY -= tanHandles.outY
            }
        }
        
        // Check the in tan handle.
        if jiggle.selectedWeightCurveControlIndex > 0 {
            if tanHandles.inY < 0.0 {
                minY -= tanHandles.inY
            }
            if tanHandles.inY > 0.0 {
                maxY -= tanHandles.inY
            }
        }
        */
         
        let rangeY = jiggle.weightCurve.rangeY
        if pointY < minY {
            pointY = minY
        }
        if pointY > maxY {
            pointY = maxY
        }
        if rangeY > Math.epsilon {
            var heightFactor = (pointY - jiggle.weightCurve.minY) / rangeY
            heightFactor = (1.0 - heightFactor)
            if heightFactor < 0.0 { heightFactor = 0.0 }
            if heightFactor > 1.0 { heightFactor = 1.0 }
            selectedWeightCurveControlPoint.normalizedHeightFactor = heightFactor
            selectedWeightCurveControlPoint.isManualHeightEnabled = true
        }
        jiggle.updateSelectedWeightCurveControlPointHeightFromGraph(frameWidth: frameWidth,
                                                                    frameHeight: frameHeight,
                                                                    paddingH: paddingH,
                                                                    paddingV: paddingV)
        
        if !isFromRelease {
            _grabWeightCurveControlPointData.didChange = true
        }
        
        _grabWeightCurveControlPointData.endHeightFactor = selectedWeightCurveControlPoint.normalizedHeightFactor
        
        applyMeshChanges(weightCurveControlIndex: weightCurveControlIndex)
    }
    
    func attemptUpdateWeightCurveControlTan(touch: UITouch,
                                            at point: Point,
                                            isFromRelease: Bool,
                                            frameWidth: Float,
                                            frameHeight: Float,
                                            paddingH: Float,
                                            paddingV: Float) {
        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        guard let selectedWeightCurveControlTanTouch = selectedWeightCurveControlTanTouch else {
            killDragAll()
            return
        }
        guard let selectedWeightCurveControlPoint = jiggle.getSelectedWeightCurveControlPointBasedOnGraphIndex() else {
            killDragAll()
            return
        }
        guard let weightCurveControlIndex = jiggle.getWeightCurveControlIndex(weightCurveControlPoint: selectedWeightCurveControlPoint) else {
            killDragAll()
            return
        }
        guard touch == selectedWeightCurveControlTanTouch else {
            return
        }
        let deltaX = point.x - selectedWeightCurveControlTanStartTouchX
        let deltaY = point.y - selectedWeightCurveControlTanStartTouchY
        let tanHandleX = selectedWeightCurveControlTanStartHandleX + deltaX + selectedWeightCurveControlTanStartHandleOffsetX
        let tanHandleY = selectedWeightCurveControlTanStartHandleY + deltaY + selectedWeightCurveControlTanStartHandleOffsetY
        
        let count = jiggle.weightCurve.weightCurveControlPointCount
        let x = selectedWeightCurveControlPoint.getX(index: weightCurveControlIndex,
                                                     count: count,
                                                     frameWidth: frameWidth,
                                                     paddingH: paddingH)
        let y = selectedWeightCurveControlPoint.getY(index: weightCurveControlIndex,
                                                     count: count,
                                                     frameHeight: frameHeight,
                                                     paddingV: paddingV)
        let diffX = tanHandleX - x
        let diffY = tanHandleY - y
        switch selectedWeightCurveControlTanType {
        case .in:
            jiggle.updateSelectedWeightCurveControlPointTanHandleIn(weightCurveControlPoint: selectedWeightCurveControlPoint,
                                                                            tanHandleX: diffX,
                                                                            tanHandleY: diffY,
                                                                            frameWidth: frameWidth,
                                                                            frameHeight: frameHeight,
                                                                            paddingH: paddingH,
                                                                            paddingV: paddingV)
        case .out:
            jiggle.updateSelectedWeightCurveControlPointTanHandleOut(weightCurveControlPoint: selectedWeightCurveControlPoint,
                                                                             tanHandleX: diffX,
                                                                             tanHandleY: diffY,
                                                                             frameWidth: frameWidth,
                                                                             frameHeight: frameHeight,
                                                                             paddingH: paddingH,
                                                                             paddingV: paddingV)
        }
        
        if !isFromRelease {
            _grabWeightCurveControlTanHandleData.didChange = true
        }
        _grabWeightCurveControlTanHandleData.endDirection = selectedWeightCurveControlPoint.normalizedTanDirection
        _grabWeightCurveControlTanHandleData.endMagnitudeIn = selectedWeightCurveControlPoint.normalizedTanMagnitudeIn
        _grabWeightCurveControlTanHandleData.endMagnitudeOut = selectedWeightCurveControlPoint.normalizedTanMagnitudeOut
        
        applyMeshChanges(weightCurveControlIndex: weightCurveControlIndex)
    }
    
    private func applyMeshChanges(weightCurveControlIndex: Int) {
        
        guard let jiggleScene = jiggleScene else {
            return
        }
        
        guard let jiggleViewModel = jiggleScene.jiggleViewModel else {
            return
        }
        
        guard let jiggleDocument = jiggleDocument else {
            return
        }
        
        if let jiggle = jiggle {
            
            jiggleDocument.refreshGraphModify(jiggle: jiggle,
                                              weightCurveControlIndex: weightCurveControlIndex,
                                              displayMode: jiggleViewModel.displayMode,
                                              isGraphEnabled: jiggleViewModel.isGraphEnabled)
                
            /*
            let swivelType = ForceableTypeWithNone.forced
            let meshCommand = JiggleMeshCommand(spline: false,
                                                triangulationType: .beautiful,
                                                meshType: .weightsOnly,
                                                outlineType: .ifNeeded,
                                                swivelType: swivelType,
                                                weightCurveType: .ifNeeded)
            let guideCommand = GuideCommand.none
            let worldScale = jiggleDocument.getWorldScale()
            let isSelected = (jiggleDocument.getSelectedJiggle() === jiggle)
            let isDarkModeEnabled = ApplicationController.isDarkModeEnabled
            
            jiggle.execute(meshCommand: meshCommand,
                           isSelected: isSelected,
                           isDarkModeEnabled: isDarkModeEnabled,
                           worldScale: worldScale, 
                           guideCommand: guideCommand,
                           forceGuideCommand: false,
                           orientation: jiggleDocument.orientation)
            */
        }
        setNeedsDisplay()
    }
    
    private func _handleGraphSelection(graphIndex: Int) {

        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        
        let weightCurveControlIndex = jiggle.getWeightCurveControlIndex(graphIndex: graphIndex)
        jiggle.selectedWeightCurveGraphIndex = graphIndex
        jiggle.switchSelectedWeightCurveControlIndex(index: weightCurveControlIndex)
        
    }
    
    private func killDragAll() {
        killDragWeightCurveControlPoint()
        killDragWeightCurveControlTan()
    }
    
    func killDragWeightCurveControlPoint() {
        if let jiggleDocument = jiggleDocument {
            if selectedWeightCurveControlPointTouch !== nil {
                if let jiggle = jiggle {
                    if _grabWeightCurveControlPointData.jiggleIndex == jiggleDocument.getJiggleIndex(jiggle) {
                        grabWeightCurveControlPointStopPublisher.send(_grabWeightCurveControlPointData)
                    }
                    
                }
            }
        }
        selectedWeightCurveControlPointTouch = nil
    }
    
    func killDragWeightCurveControlTan() {
        if let jiggleDocument = jiggleDocument {
            if selectedWeightCurveControlTanTouch !== nil {
                if let jiggle = jiggle {
                    if _grabWeightCurveControlTanHandleData.jiggleIndex == jiggleDocument.getJiggleIndex(jiggle) {
                        grabWeightCurveControlTanHandleStopPublisher.send(_grabWeightCurveControlTanHandleData)
                    }
                }
            }
        }
        selectedWeightCurveControlTanTouch = nil
    }
}
