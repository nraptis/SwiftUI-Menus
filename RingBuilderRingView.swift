//
//  RingBuilderRingView.swift
//  Manifold
//
//  Created by Nicky Taylor on 8/3/24.
//

import UIKit
import Combine

class RingBuilderRingView: UIView {
    
    struct DeconvertedPoint {
        let angle: CGFloat
        let magnitude: CGFloat
    }
    
    static let padding = CGFloat(6.0)
    
    static let strokeThicknessOuter = CGFloat(2.5)
    static let strokeThicknessOtter = CGFloat(2.5)
    
    static let fillThicknessOuter = CGFloat(1.5)
    static let fillThicknessOtter = CGFloat(1.5)
    
    let ringBuilderWidget = RingBuilderWidget()
    
    var dragTouch: UITouch?
    var dragStartTouchPoint = CGPoint.zero
    var dragStartReferencePoint = CGPoint.zero
    
    private func getOuterCircleCenter() -> CGPoint {
        CGPoint(x: bounds.midX,
                y: bounds.midY)
    }
    
    private func getOuterCircleRadius() -> CGFloat {
        let width = bounds.size.width
        let height = bounds.size.height
        let diameter = min(width, height) - (Self.padding + Self.padding)
        return (diameter * 0.5)
    }
    
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
    
    private func drawCircle(context: CGContext,
                            center: CGPoint,
                            radius: CGFloat,
                            lineWidth: CGFloat,
                            color: UIColor) {
        
        context.saveGState()
        context.setLineWidth(lineWidth)
        context.setStrokeColor(color.cgColor)
        
        context.addArc(center: center,
                       radius: radius,
                       startAngle: 0.0,
                       endAngle: CGFloat.pi * 2.0,
                       clockwise: true)
        
        context.strokePath()
        context.restoreGState()
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        var numberOfRings = ringBuilderWidget.numberOfRings
        if numberOfRings > RingBuilder.maximumNumberOfRings { numberOfRings = RingBuilder.maximumNumberOfRings }
        if numberOfRings < RingBuilder.minimumNumberOfRings { numberOfRings = RingBuilder.minimumNumberOfRings }
        
        var angle = CGFloat(ringBuilderWidget.angle)
        var magnitude = CGFloat(ringBuilderWidget.magnitude)
        if magnitude < 0.0 { magnitude = 0.0 }
        if magnitude > 1.0 { magnitude = 1.0 }
        
        let referencePoint = convert(angle: angle, magnitude: magnitude)
        
        struct Circle {
            let center: CGPoint
            let radius: CGFloat
        }
        
        let outerCircleCenter = getOuterCircleCenter()
        let outerCircleRadius = getOuterCircleRadius()
        
        var circlePercents = [CGFloat]()
        for index in 0..<numberOfRings {
            let percent = CGFloat(index + 1) / CGFloat(numberOfRings + 1)
            circlePercents.append(percent)
        }
        
        var circleRadii = [CGFloat]()
        for index in 0..<numberOfRings {
            let radius = circlePercents[index] * outerCircleRadius
            circleRadii.append(radius)
        }
        
        let ease: CGFloat
        if numberOfRings <= 1 {
            ease = 0.8
        } else if numberOfRings == 2 {
            ease = 0.75
        } else if numberOfRings == 3 {
            ease = 0.7
        } else if numberOfRings == 4 {
            ease = 0.65
        } else {
            ease = 0.6
        }
        let shiftPercentX = sin(angle) * magnitude
        let shiftPercentY = -cos(angle) * magnitude
        var circles = [Circle]()
        for index in 0..<numberOfRings {
            let percent = circlePercents[index]
            let radius = circleRadii[index]
            
            let maxMoveAmount = (outerCircleRadius - radius) * ease
            
            let center = CGPoint(x: outerCircleCenter.x + shiftPercentX * maxMoveAmount,
                                 y: outerCircleCenter.y + shiftPercentY * maxMoveAmount)
            let circle = Circle(center: center, radius: radius)
            circles.append(circle)
        }
        
        let _strokeColor = strokeColor()
        let _fillColor = fillColor()
        drawCircle(context: context,
                   center: outerCircleCenter,
                   radius: outerCircleRadius,
                   lineWidth: Self.strokeThicknessOuter,
                   color: _strokeColor)
        
        for circle in circles {
            drawCircle(context: context,
                       center: circle.center,
                       radius: circle.radius,
                       lineWidth: Self.strokeThicknessOtter,
                       color: _strokeColor)
        }
        
        drawCircle(context: context,
                   center: outerCircleCenter,
                   radius: outerCircleRadius,
                   lineWidth: Self.fillThicknessOuter,
                   color: _fillColor)
        for circleIndex in circles.indices {
            let circle = circles[circleIndex]
            let _fillColor = fillColor(index: circleIndex)
            drawCircle(context: context,
                       center: circle.center,
                       radius: circle.radius,
                       lineWidth: Self.fillThicknessOtter,
                       color: _fillColor)
        }
    }
    
    func convert(angle: CGFloat, magnitude: CGFloat) -> CGPoint {
        let outerCircleCenter = getOuterCircleCenter()
        let outerCircleRadius = getOuterCircleRadius()
        let dirX = sin(angle)
        let dirY = -cos(angle)
        return CGPoint(x: outerCircleCenter.x + dirX * magnitude * outerCircleRadius,
                       y: outerCircleCenter.y + dirY * magnitude * outerCircleRadius)
    }
    
    func deconvert(point: CGPoint) -> DeconvertedPoint {
        let outerCircleCenter = getOuterCircleCenter()
        let outerCircleRadius = getOuterCircleRadius()
        let diffX = outerCircleCenter.x - point.x
        let diffY = outerCircleCenter.y - point.y
        let lengthSquared = diffX * diffX + diffY * diffY
        if lengthSquared > CGFloat(0.5) {
            let length = sqrt(lengthSquared)
            let factorX = diffX / length
            let factorY = diffY / length
            var magnitude = CGFloat(0.0)
            if outerCircleRadius > 0.5 {
                magnitude = length / outerCircleRadius
                if magnitude < 0.0 { magnitude = 0.0 }
                if magnitude > 1.0 { magnitude = 1.0 }
            }
            let angle = -atan2(diffX, diffY)
            return DeconvertedPoint(angle: angle,
                                    magnitude: magnitude)
        } else {
            return DeconvertedPoint(angle: 0.0,
                                    magnitude: 0.0)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if dragTouch !== nil { return }
        for touch in touches {
            let location = touch.location(in: self)
            var angle = CGFloat(ringBuilderWidget.angle)
            var magnitude = CGFloat(ringBuilderWidget.magnitude)
            if magnitude < 0.0 { magnitude = 0.0 }
            if magnitude > 1.0 { magnitude = 1.0 }
            dragTouch = touch
            dragStartTouchPoint = location
            dragStartReferencePoint = convert(angle: angle, magnitude: magnitude)
        }
        setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let dragTouch = dragTouch {
            for touch in touches {
                if dragTouch === touch {
                    let location = touch.location(in: self)
                    let diffX = location.x - dragStartTouchPoint.x
                    let diffY = location.y - dragStartTouchPoint.y
                    let dragReferencePoint = CGPoint(x: dragStartReferencePoint.x + diffX,
                                                     y: dragStartReferencePoint.y + diffY)
                    let backwards = deconvert(point: dragReferencePoint)
                    ringBuilderWidget.set(angle: Float(backwards.angle))
                    ringBuilderWidget.set(magnitude: Float(backwards.magnitude))
                }
            }
        }
        setNeedsDisplay()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        killDragAll()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        killDragAll()
    }

    private func killDragAll() {
        if dragTouch !== nil {
            ringBuilderWidget.save()
            dragTouch = nil
        }
    }
}

