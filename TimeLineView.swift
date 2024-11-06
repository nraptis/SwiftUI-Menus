//
//  TimelineView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import UIKit
import Combine

class TimeLineView: UIView {
    
    //typealias GrabTimeLineControlPointData = JiggleDocumentPublisherLibrary.GrabTimeLineControlPointData
    //typealias GrabTimeLineControlTanHandleData = JiggleDocumentPublisherLibrary.GrabTimeLineControlTanHandleData
    
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
    
    //var _grabTimeLineControlPointData = GrabTimeLineControlPointData()
    //var grabTimeLineControlPointStopPublisher = PassthroughSubject<GrabTimeLineControlPointData, Never>()
    
    //var _grabTimeLineControlTanHandleData = GrabTimeLineControlTanHandleData()
    //var grabTimeLineControlTanHandleStopPublisher = PassthroughSubject<GrabTimeLineControlTanHandleData, Never>()
    
    var controlPointDidChange = false
    var controlTanDidChange = false
    
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
    
    lazy var timeLineDotFillDark: UIImage = {
        if let tinted = tintedCircle(image: mediumDot,
                                     tintColor: ToolInterfaceTheme._graphPointFillDark) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var timeLineDotFillLight: UIImage = {
        if let tinted = tintedCircle(image: mediumDot,
                                     tintColor: ToolInterfaceTheme._graphPointFillLight) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var timeLineDotStrokeDark: UIImage = {
        if let tinted = tintedCircle(image: mediumDotStroke,
                                     tintColor: ToolInterfaceTheme._graphLineStrokeDark) {
            return tinted
        }
        return mediumDot
    }()
    
    lazy var timeLineDotStrokeLight: UIImage = {
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
    var selectedTimeLineControlPointTouch: UITouch?
    var selectedTimeLineControlPointStartTouchX = Float(0.0)
    var selectedTimeLineControlPointStartTouchY = Float(0.0)
    var selectedTimeLineControlPointStartX = Float(0.0)
    var selectedTimeLineControlPointStartY = Float(0.0)
    
    
    // Depth Curve Control Tans
    var selectedTimeLineControlTanTouch: UITouch?
    var selectedTimeLineControlTanStartTouchX = Float(0.0)
    var selectedTimeLineControlTanStartTouchY = Float(0.0)
    var selectedTimeLineControlTanStartHandleX = Float(0.0)
    var selectedTimeLineControlTanStartHandleY = Float(0.0)
    var selectedTimeLineControlTanStartHandleOffsetX = Float(0.0)
    var selectedTimeLineControlTanStartHandleOffsetY = Float(0.0)
    
    var selectedTimeLineControlTanType = TanType.in
    
    weak var jiggle: Jiggle?
    
    weak var jiggleDocument: JiggleDocument?
    weak var jiggleScene: JiggleScene?
    weak var jiggleViewModel: JiggleViewModel?
    
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
        
        guard let jiggleViewModel = jiggleViewModel else {
            drawEmpty(context: context)
            return
        }
        
        let timeLine = jiggle.timeLine
        
        let selectedSwatch = timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
        
        let selectedChannel = selectedSwatch.selectedChannel
        
        
        let frameWidth = jiggleScene.timeLineWidth
        let frameHeight = jiggleScene.timeLineHeight
        let paddingH = jiggleScene.timeLinePaddingH
        let paddingV = jiggleScene.timeLinePaddingV
        
        var splinePoints = [CGPoint]()
        let spline = selectedChannel.spline
        
        //let splineFactor = Float(1) / Float(spline.count - 1)
        
        let minX = paddingH
        let minY = paddingV
        let width = (frameWidth - paddingH - paddingH)
        let height = (frameHeight - paddingV - paddingV)
        let maxX = minX + width
        let maxY = minY + height
        
        var position = Float(0.0)
        let x = minX + 0.0 * width
        let y = minY + spline.getY(0.0) * height
        var lastX = x
        var lastY = y
        let finalX = minX + 1.0 * width
        let finalY = minY + spline.getY(spline.maxPos) * height
        
        splinePoints.append(CGPoint(x: x, y: y))
        
        let threshold = Float(2.0)
        let thresholdSquared = (threshold * threshold)
        
        while position <= spline.maxPos {
            var x = minX + spline.getX(position) * width
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
        
        var tanPointPairsIn = [(CGPoint, CGPoint)]()
        var tanPointPairsOut = [(CGPoint, CGPoint)]()
        
        //var MINI_P_PAIR = [(CGPoint, CGPoint)]()
        
        var controlPoints = [CGPoint]()
        
        let controlPointCount = selectedChannel.controlPointCount
        let controlPointCount1 = (controlPointCount - 1)
        
        for controlPointIndex in 0..<controlPointCount {
            let controlPoint = selectedChannel.controlPoints[controlPointIndex]
            let tanHandles = controlPoint.getTanHandles(count: controlPointCount,
                                                        frameWidth: frameWidth,
                                                        frameHeight: frameHeight,
                                                        paddingH: paddingH,
                                                        paddingV: paddingV) // TODONR: A
            
            let x = controlPoint.getX(frameWidth: frameWidth,
                                      paddingH: paddingH)
            let y = controlPoint.getY(frameHeight: frameHeight,
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
        
        for controlPointIndex in 0..<selectedChannel.controlPointCount {
            let controlPoint = selectedChannel.controlPoints[controlPointIndex]
            let x = controlPoint.getX(frameWidth: frameWidth,
                                      paddingH: paddingH)
            let y = controlPoint.getY(frameHeight: frameHeight,
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
        
        /*
         for tanPointPair in MINI_P_PAIR {
         let point1 = tanPointPair.0
         let point2 = tanPointPair.1
         context.saveGState()
         context.setLineWidth(ToolInterfaceTheme.graphTanLineStrokeThickness)
         context.setStrokeColor(UIColor.blue.withAlphaComponent(0.7).cgColor)
         context.setLineCap(.butt)
         context.move(to: point1)
         context.addLine(to: point2)
         context.strokePath()
         context.restoreGState()
         }
         */
        
        
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
        
        let timeLineDotStroke: UIImage
        if ApplicationController.isDarkModeEnabled {
            timeLineDotStroke = timeLineDotStrokeDark
        } else {
            timeLineDotStroke = timeLineDotStrokeLight
        }
        for controlPoint in controlPoints {
            draw(context: context,
                 image: timeLineDotStroke,
                 point: controlPoint)
        }
        
        let timeLineDotFill: UIImage
        if ApplicationController.isDarkModeEnabled {
            timeLineDotFill = timeLineDotFillDark
        } else {
            timeLineDotFill = timeLineDotFillLight
        }
        
        for controlPoint in controlPoints {
            draw(context: context,
                 image: timeLineDotFill,
                 point: controlPoint)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        guard let jiggleScene = jiggleScene else {
            killDragAll()
            return
        }
        
        let frameWidth = jiggleScene.timeLineWidth
        let frameHeight = jiggleScene.timeLineHeight
        let paddingH = jiggleScene.timeLinePaddingH
        let paddingV = jiggleScene.timeLinePaddingV
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptGrabTimeLine(touch: touch,
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
        
        let frameWidth = jiggleScene.timeLineWidth
        let frameHeight = jiggleScene.timeLineHeight
        let paddingH = jiggleScene.timeLinePaddingH
        let paddingV = jiggleScene.timeLinePaddingV
        
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptUpdateTimeLine(touch: touch,
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
        
        let frameWidth = jiggleScene.timeLineWidth
        let frameHeight = jiggleScene.timeLineHeight
        let paddingH = jiggleScene.timeLinePaddingH
        let paddingV = jiggleScene.timeLinePaddingV
        
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptUpdateTimeLine(touch: touch,
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
        
        let frameWidth = jiggleScene.timeLineWidth
        let frameHeight = jiggleScene.timeLineHeight
        let paddingH = jiggleScene.timeLinePaddingH
        let paddingV = jiggleScene.timeLinePaddingV
        
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            attemptUpdateTimeLine(touch: touch,
                                  at: point,
                                  isFromRelease: true,
                                  frameWidth: frameWidth,
                                  frameHeight: frameHeight,
                                  paddingH: paddingH,
                                  paddingV: paddingV)
            
            
        }
        killDragAll()
    }
    
    func attemptGrabTimeLine(touch: UITouch,
                             at point: Point,
                             frameWidth: Float,
                             frameHeight: Float,
                             paddingH: Float,
                             paddingV: Float) {
        
        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        
        guard let jiggleViewModel = jiggleViewModel else {
            killDragAll()
            return
        }
        
        let selectedSwatch = jiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
        let selectedChannel = selectedSwatch.selectedChannel
        
        guard selectedTimeLineControlPointTouch === nil else {
            return
        }
        
        guard selectedTimeLineControlTanTouch === nil else {
            return
        }
        
        let selectDepthControlPointDistanceThreshold = JiggleDocument.selectDepthControlPointDistanceThreshold
        var bestControlPointDistance = selectDepthControlPointDistanceThreshold * selectDepthControlPointDistanceThreshold
        var bestControlPointIndex = -1
        let controlPointCount = selectedChannel.controlPointCount
        for controlPointIndex in 0..<selectedChannel.controlPointCount {
            let controlPoint = selectedChannel.controlPoints[controlPointIndex]
            
            let x = controlPoint.getX(frameWidth: frameWidth,
                                      paddingH: paddingH)
            let y = controlPoint.getY(frameHeight: frameHeight,
                                      paddingV: paddingV)
            
            let diffX = x - point.x
            let diffY = y - point.y
            let dist = diffX * diffX + diffY * diffY
            if dist < bestControlPointDistance {
                bestControlPointDistance = dist
                bestControlPointIndex = controlPointIndex
            }
        }
        
        let selectDepthControlTanDistanceThreshold = JiggleDocument.selectDepthControlTanDistanceThreshold
        var bestControlTanDistance = selectDepthControlTanDistanceThreshold * selectDepthControlTanDistanceThreshold
        var bestControlTanType = TanType.in
        var bestControlTanIndex = -1
        
        
        let minX = paddingH
        let minY = paddingV
        let width = (frameWidth - paddingH - paddingH)
        let height = (frameHeight - paddingV - paddingV)
        let maxX = minX + width
        let maxY = minY + height
        
        let controlPointCount1 = (controlPointCount - 1)
        for controlPointIndex in 0..<controlPointCount {
            let controlPoint = selectedChannel.controlPoints[controlPointIndex]
            
            let tanHandles = controlPoint.getTanHandles(count: controlPointCount,
                                                        frameWidth: frameWidth,
                                                        frameHeight: frameHeight,
                                                        paddingH: paddingH,
                                                        paddingV: paddingV) // TODONR: B
            
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
            
            if controlPointIndex != 0 {
                if distIn < bestControlTanDistance {
                    bestControlTanDistance = distIn
                    bestControlTanIndex = controlPointIndex
                    bestControlTanType = .in
                }
            }
            
            if controlPointIndex != controlPointCount1 {
                if distOut < bestControlTanDistance {
                    bestControlTanDistance = distOut
                    bestControlTanIndex = controlPointIndex
                    bestControlTanType = .out
                }
            }
        }
        
        
        func selectPoint() {
            let controlPoint = selectedChannel.controlPoints[bestControlPointIndex]
            
            let x = controlPoint.getX(frameWidth: frameWidth,
                                      paddingH: paddingH)
            let y = controlPoint.getY(frameHeight: frameHeight,
                                      paddingV: paddingV)
            
            selectedTimeLineControlPointTouch = touch
            selectedTimeLineControlPointStartTouchX = point.x
            selectedTimeLineControlPointStartTouchY = point.y
            selectedTimeLineControlPointStartX = x
            selectedTimeLineControlPointStartY = y
            
            _handleTimeLineSelection(controlIndex: bestControlPointIndex)
            
            controlPointDidChange = false
            
            if let toolInterfaceViewModel = jiggleViewModel.toolInterfaceViewModel {
                toolInterfaceViewModel.handleTimePointOrTanHandleUpdate()
            }
            
            jiggleViewModel.timeLineDragNotifyStarted()
        }
        
        func selectTan() {
            
            let controlPoint = selectedChannel.controlPoints[bestControlTanIndex]
            let tanHandles = controlPoint.getTanHandles(count: controlPointCount,
                                                        frameWidth: frameWidth,
                                                        frameHeight: frameHeight,
                                                        paddingH: paddingH,
                                                        paddingV: paddingV) // TODONR: C
            
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
            
            _handleTimeLineSelection(controlIndex: bestControlTanIndex)
            
            controlTanDidChange = false
            
            if let toolInterfaceViewModel = jiggleViewModel.toolInterfaceViewModel {
                toolInterfaceViewModel.handleTimePointOrTanHandleUpdate()
            }
            
            jiggleViewModel.timeLineDragNotifyStarted()
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
    
    func attemptUpdateTimeLine(touch: UITouch,
                               at point: Point,
                               isFromRelease: Bool,
                               frameWidth: Float,
                               frameHeight: Float,
                               paddingH: Float,
                               paddingV: Float) {
        if selectedTimeLineControlTanTouch !== nil {
            attemptUpdateTimeLineControlTan(touch: touch,
                                            at: point,
                                            isFromRelease: isFromRelease,
                                            frameWidth: frameWidth,
                                            frameHeight: frameHeight,
                                            paddingH: paddingH,
                                            paddingV: paddingV)
        } else if selectedTimeLineControlPointTouch !== nil {
            attemptUpdateTimeLineControlPoint(touch: touch,
                                              at: point,
                                              isFromRelease: isFromRelease)
        } else {
            killDragAll()
        }
    }
    
    func attemptUpdateTimeLineControlPoint(touch: UITouch,
                                           at point: Point,
                                           isFromRelease: Bool) {
        
        guard let jiggleViewModel = jiggleViewModel else {
            killDragAll()
            return
        }
        
        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        
        let selectedSwatch = jiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
        let selectedChannel = selectedSwatch.selectedChannel
        
        guard let selectedTimeLineControlPointTouch = selectedTimeLineControlPointTouch else {
            killDragAll()
            return
        }
        
        
        let selectedControlIndex = selectedChannel.selectedControlIndex
        guard let selectedControlPoint = selectedChannel.getSelectedControlPoint() else {
            killDragAll()
            return
        }
        
        guard touch === selectedTimeLineControlPointTouch else {
            return
        }
        
        let deltaX = point.x - selectedTimeLineControlPointStartTouchX
        let deltaY = point.y - selectedTimeLineControlPointStartTouchY
        
        var pointX = selectedTimeLineControlPointStartX + deltaX
        var pointY = selectedTimeLineControlPointStartY + deltaY
        
        let minX = jiggle.timeLine.minX
        let minY = jiggle.timeLine.minY
        
        let maxX = jiggle.timeLine.maxX
        let maxY = jiggle.timeLine.maxY
        
        let rangeX = jiggle.timeLine.rangeX
        if pointX < minX {
            pointX = minX
        }
        if pointX > maxX {
            pointX = maxX
        }
        
        let controlPointCount = selectedChannel.controlPointCount
        let controlPointCount1 = (controlPointCount - 1)
        
        if selectedControlIndex >= controlPointCount1 {
            pointX = maxX
            selectedControlPoint.normalizedX = 1.0
            selectedControlPoint.isManualPositionEnabled = true
        } else if selectedControlIndex <= 0 {
            pointX = minY
            selectedControlPoint.normalizedX = 0.0
            selectedControlPoint.isManualPositionEnabled = true
        } else {
            if rangeX > Math.epsilon {
                var widthFactor = ((pointX - jiggle.timeLine.minX) / rangeX)
                if widthFactor < 0.0 { widthFactor = 0.0 }
                if widthFactor > 1.0 { widthFactor = 1.0 }
                selectedControlPoint.normalizedX = widthFactor
                selectedControlPoint.isManualPositionEnabled = true
            } else {
                selectedControlPoint.normalizedX = 0.5
                selectedControlPoint.isManualPositionEnabled = true
            }
        }
        
        let rangeY = jiggle.timeLine.rangeY
        if pointY < minY {
            pointY = minY
        }
        if pointY > maxY {
            pointY = maxY
        }
        if rangeY > Math.epsilon {
            var heightFactor = (pointY - jiggle.timeLine.minY) / rangeY
            heightFactor = (1.0 - heightFactor)
            if heightFactor < 0.0 { heightFactor = 0.0 }
            if heightFactor > 1.0 { heightFactor = 1.0 }
            selectedControlPoint.normalizedY = heightFactor
            selectedControlPoint.isManualPositionEnabled = true
        }
        
        if selectedControlIndex >= controlPointCount1 {
            selectedChannel.controlPoints[0].normalizedY = selectedControlPoint.normalizedY
            selectedChannel.controlPoints[0].isManualPositionEnabled = true
        } else if selectedControlIndex <= 0 {
            selectedChannel.controlPoints[controlPointCount1].normalizedY = selectedControlPoint.normalizedY
            selectedChannel.controlPoints[controlPointCount1].isManualPositionEnabled = true
        }
        
        if jiggleViewModel.isAnimationLoopsAppliedToAll {
            
            jiggleViewModel.timeLineDupeCurrentChannel(jiggle)
            
        } else {
            
            jiggleViewModel.timeLineComputeCurrentChannel(jiggle)
            
        }
        
        setNeedsDisplay()
        
        if !isFromRelease {
            controlPointDidChange = true
        }
    }
    
    func attemptUpdateTimeLineControlTan(touch: UITouch,
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
        
        guard let jiggleViewModel = jiggleViewModel else {
            killDragAll()
            return
        }
        
        let selectedSwatch = jiggle.timeLine.getSelectedSwatch(swatch: jiggleViewModel.timeLineSelectedSwatch)
        
        let selectedChannel = selectedSwatch.selectedChannel
        
        guard let selectedTimeLineControlTanTouch = selectedTimeLineControlTanTouch else {
            killDragAll()
            return
        }
        
        guard let selectedControlPoint = selectedChannel.getSelectedControlPoint() else {
            killDragAll()
            return
        }
        
        guard touch == selectedTimeLineControlTanTouch else {
            return
        }
        
        let deltaX = point.x - selectedTimeLineControlTanStartTouchX
        let deltaY = point.y - selectedTimeLineControlTanStartTouchY
        let tanHandleX = selectedTimeLineControlTanStartHandleX + deltaX + selectedTimeLineControlTanStartHandleOffsetX
        let tanHandleY = selectedTimeLineControlTanStartHandleY + deltaY + selectedTimeLineControlTanStartHandleOffsetY
        
        let x = selectedControlPoint.getX(frameWidth: frameWidth,
                                          paddingH: paddingH)
        let y = selectedControlPoint.getY(frameHeight: frameHeight,
                                          paddingV: paddingV)
        
        let diffX = tanHandleX - x
        let diffY = tanHandleY - y
        
        switch selectedTimeLineControlTanType {
        case .in:
            selectedChannel.updateSelectedControlPointTanHandleIn(controlPoint: selectedControlPoint,
                                                                  tanHandleX: diffX,
                                                                  tanHandleY: diffY,
                                                                  frameWidth: frameWidth,
                                                                  frameHeight: frameHeight,
                                                                  paddingH: paddingH,
                                                                  paddingV: paddingV)
        case .out:
            selectedChannel.updateSelectedControlPointTanHandleOut(controlPoint: selectedControlPoint,
                                                                   tanHandleX: diffX,
                                                                   tanHandleY: diffY,
                                                                   frameWidth: frameWidth,
                                                                   frameHeight: frameHeight,
                                                                   paddingH: paddingH,
                                                                   paddingV: paddingV)
        }
        
        if jiggleViewModel.isAnimationLoopsAppliedToAll {
            
            jiggleViewModel.timeLineDupeCurrentChannel(jiggle)
            
        } else {
            
            jiggleViewModel.timeLineComputeCurrentChannel(jiggle)
            
        }
        
        setNeedsDisplay()
        
        if !isFromRelease {
            controlTanDidChange = true
        }
    }
    
    private func _handleTimeLineSelection(controlIndex: Int) {
        guard let jiggle = jiggle else {
            killDragAll()
            return
        }
        
        guard let jiggleViewModel = jiggleViewModel else {
            killDragAll()
            return
        }
        
        jiggle.switchSelectedTimeLineControlIndex(index: controlIndex,
                                                  currentSwatch: jiggleViewModel.timeLineSelectedSwatch)
        jiggleViewModel.snapshotTimeLineHistoryForTimeLineViewDrag(jiggle: jiggle)
    }
    
    private func killDragAll() {
        killDragTimeLineControlPoint()
        killDragTimeLineControlTan()
    }
    
    func killDragTimeLineControlPoint() {
        if selectedTimeLineControlPointTouch !== nil {
            if let jiggleViewModel = jiggleViewModel {
                if controlPointDidChange {
                    jiggleViewModel.recordTimeLineHistoryForTimeLineViewDrag()
                }
                
                if let toolInterfaceViewModel = jiggleViewModel.toolInterfaceViewModel {
                    toolInterfaceViewModel.handleTimePointOrTanHandleUpdate()
                }
                
                selectedTimeLineControlPointTouch = nil
                selectedTimeLineControlTanTouch = nil
                jiggleViewModel.timeLineDragNotifyFinished()
            }
        }
        
        controlPointDidChange = false
        selectedTimeLineControlPointTouch = nil
    }
    
    func killDragTimeLineControlTan() {
        if selectedTimeLineControlTanTouch !== nil {
            if let jiggleViewModel = jiggleViewModel {
                if controlTanDidChange {
                    jiggleViewModel.recordTimeLineHistoryForTimeLineViewDrag()
                }
                
                if let toolInterfaceViewModel = jiggleViewModel.toolInterfaceViewModel {
                    toolInterfaceViewModel.handleTimePointOrTanHandleUpdate()
                }
                
                selectedTimeLineControlPointTouch = nil
                selectedTimeLineControlTanTouch = nil
                jiggleViewModel.timeLineDragNotifyFinished()
            }
            
        }
        selectedTimeLineControlTanTouch = nil
        controlTanDidChange = false
    }
}
