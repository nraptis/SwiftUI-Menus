//
//  GestureView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/9/23.
//

import UIKit
import simd

protocol GestureViewDelegate: AnyObject {
    func touchesBegan(touches: [UITouch], points: [Math.Point], allTouchCount: Int)
    func touchesMoved(touches: [UITouch], points: [Math.Point], isFromRelease: Bool, allTouchCount: Int)
    func touchesEnded(touches: [UITouch], points: [Math.Point], allTouchCount: Int)
    
    func allGestureRecognizersWereCancelled()
    func allTouchesWereCancelled(touches: [UITouch], points: [Math.Point])
    
    func gestureRecognizerShouldBegin(point: Math.Point) -> Bool
    func gestureRecognizerShouldReceiveTouch(point: Math.Point) -> Bool
    
    func attemptPanBegan(center: Math.Point, numberOfTouches: Int) -> Bool
    func attemptPanMoved(center: Math.Point, numberOfTouches: Int) -> Bool
    func attemptPanEnded(center: Math.Point, releaseDir: Math.Vector, releaseMagnitude: Float) -> Bool
    
    func attemptPinchBegan(center: Math.Point, scale: Float, numberOfTouches: Int) -> Bool
    func attemptPinchMoved(center: Math.Point, scale: Float, numberOfTouches: Int) -> Bool
    func attemptPinchEnded(center: Math.Point, scale: Float) -> Bool
    
    func attemptRotateBegan(center: Math.Point, rotation: Float, numberOfTouches: Int) -> Bool
    func attemptRotateMoved(center: Math.Point, rotation: Float, numberOfTouches: Int) -> Bool
    func attemptRotateEnded(center: Math.Point, rotation: Float) -> Bool
    
    func handleDoubleTap(center: Math.Point, numberOfTouches: Int)
}

class GestureView: UIView {
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] GestureView")
        }
    }
    
    typealias Point = Math.Point
    typealias Vector = Math.Vector
    
    var isPanGestureActive = false
    var isPinchGestureActive = false
    var isRotationGestureActive = false
    
    lazy var panGestureRecognizer: UIPanGestureRecognizer = {
        let result = UIPanGestureRecognizer(target: self, action: #selector(didPan(_:)))
        result.delegate = self
        result.maximumNumberOfTouches = 2
        result.cancelsTouchesInView = false
        result.delaysTouchesEnded = false
        return result
    }()
    
    lazy var pinchGestureRecognizer: UIPinchGestureRecognizer = {
        let result = UIPinchGestureRecognizer(target: self, action: #selector(didPinch(_:)))
        result.delegate = self
        result.cancelsTouchesInView = false
        result.delaysTouchesEnded = false
        return result
    }()
    
    lazy var rotationGestureRecognizer: UIRotationGestureRecognizer = {
        let result = UIRotationGestureRecognizer(target: self, action: #selector(didRotate(_:)))
        result.delegate = self
        result.cancelsTouchesInView = false
        result.delaysTouchesEnded = false
        return result
    }()
    
    lazy var doubleTapGestureRecognizer: UITapGestureRecognizer = {
        let result = UITapGestureRecognizer(target: self, action: #selector(didDoubleTap(_:)))
        result.delegate = self
        result.cancelsTouchesInView = false
        result.numberOfTapsRequired = 2
        result.delaysTouchesEnded = false
        return result
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addGestureRecognizer(panGestureRecognizer)
        addGestureRecognizer(pinchGestureRecognizer)
        addGestureRecognizer(rotationGestureRecognizer)
        addGestureRecognizer(doubleTapGestureRecognizer)
        isMultipleTouchEnabled = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addGestureRecognizer(panGestureRecognizer)
        addGestureRecognizer(pinchGestureRecognizer)
        addGestureRecognizer(rotationGestureRecognizer)
        addGestureRecognizer(doubleTapGestureRecognizer)
        isMultipleTouchEnabled = true
    }
    
    unowned var delegate: GestureViewDelegate?
    
    func update(deltaTime: Float) {
        if _cancelGestureTimer > 0.0 {
            _cancelGestureTimer -= deltaTime
            if _cancelGestureTimer <= 0.0 {
                _cancelGestureTimer = 0.0
                panGestureRecognizer.isEnabled = true
                pinchGestureRecognizer.isEnabled = true
                rotationGestureRecognizer.isEnabled = true
                doubleTapGestureRecognizer.isEnabled = true
            }
        }
        
        if _cancelTouchTimer > 0.0 {
            _cancelTouchTimer -= deltaTime
            if _cancelGestureTimer <= 0.0 {
                _cancelGestureTimer = 0.0
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var allTouchCount = 0
        if let event = event {
            if let allTouches = event.allTouches {
                for touch in allTouches {
                    switch touch.phase {
                    case .began:
                        allTouchCount += 1
                    case .moved:
                        allTouchCount += 1
                    case .stationary:
                        allTouchCount += 1
                    case .regionEntered:
                        allTouchCount += 1
                    case .regionMoved:
                        allTouchCount += 1
                    case .regionExited:
                        allTouchCount += 1
                    default:
                        break
                    }
                }
            }
        }
        
        var _touches = [UITouch]()
        var _points = [Point]()
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            _touches.append(touch)
            _points.append(point)
        }
        
        delegate?.touchesBegan(touches: _touches,
                               points: _points,
                               allTouchCount: allTouchCount)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var allTouchCount = 0
        if let event = event {
            if let allTouches = event.allTouches {
                for touch in allTouches {
                    switch touch.phase {
                    case .began:
                        allTouchCount += 1
                    case .moved:
                        allTouchCount += 1
                    case .stationary:
                        allTouchCount += 1
                    case .regionEntered:
                        allTouchCount += 1
                    case .regionMoved:
                        allTouchCount += 1
                    case .regionExited:
                        allTouchCount += 1
                    default:
                        break
                    }
                }
            }
        }
        
        var _touches = [UITouch]()
        var _points = [Point]()
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            _touches.append(touch)
            _points.append(point)
        }
        
        delegate?.touchesMoved(touches: _touches,
                               points: _points,
                               isFromRelease: false,
                               allTouchCount: allTouchCount)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var allTouchCount = 0
        if let event = event {
            if let allTouches = event.allTouches {
                for touch in allTouches {
                    switch touch.phase {
                    case .began:
                        allTouchCount += 1
                    case .moved:
                        allTouchCount += 1
                    case .stationary:
                        allTouchCount += 1
                    case .regionEntered:
                        allTouchCount += 1
                    case .regionMoved:
                        allTouchCount += 1
                    case .regionExited:
                        allTouchCount += 1
                    default:
                        break
                    }
                }
            }
        }
        
        var _touches = [UITouch]()
        var _points = [Point]()
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            _touches.append(touch)
            _points.append(point)
        }
        
        delegate?.touchesMoved(touches: _touches,
                               points: _points,
                               isFromRelease: true,
                               allTouchCount: allTouchCount)
        delegate?.touchesEnded(touches: _touches,
                               points: _points,
                               allTouchCount: allTouchCount)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        var allTouchCount = 0
        if let event = event {
            if let allTouches = event.allTouches {
                for touch in allTouches {
                    switch touch.phase {
                    case .began:
                        allTouchCount += 1
                    case .moved:
                        allTouchCount += 1
                    case .stationary:
                        allTouchCount += 1
                    case .regionEntered:
                        allTouchCount += 1
                    case .regionMoved:
                        allTouchCount += 1
                    case .regionExited:
                        allTouchCount += 1
                    default:
                        break
                    }
                }
            }
        }
        
        
        var _touches = [UITouch]()
        var _points = [Point]()
        for touch in touches {
            let location = touch.location(in: self)
            let point = Point(x: Float(location.x),
                              y: Float(location.y))
            _touches.append(touch)
            _points.append(point)
        }
        
        delegate?.touchesEnded(touches: _touches,
                               points: _points,
                               allTouchCount: allTouchCount)
    }
    
    private var _gesturePreviousCenter = Point.zero
    private var _gestureCenter = Point.zero
    
    private var _panVelocityDir = Vector.zero
    private var _panVelocityMagnitude = Float(0.0)
    private var _panGestureRecognizerTouchCount = 0
    @objc func didPan(_ panGestureRecognizer: UIPanGestureRecognizer) -> Void {
        
        guard let delegate = delegate,
              _cancelGestureTimer <= 0.0,
              _cancelTouchTimer <= 0.0 else {
            cancelAllGestureRecognizers()
            return
        }
        
        let _center = panGestureRecognizer.location(in: self)
        _gestureCenter.x = Float(_center.x); _gestureCenter.y = Float(_center.y)
        
        let _velocity = panGestureRecognizer.velocity(in: self)
        _panVelocityDir.x = Float(_velocity.x); _panVelocityDir.y = Float(_velocity.y)
        _panVelocityMagnitude = (_panVelocityDir.x * _panVelocityDir.x) + (_panVelocityDir.y * _panVelocityDir.y)
        if _panVelocityMagnitude > Math.epsilon {
            _panVelocityMagnitude = sqrtf(_panVelocityMagnitude)
            _panVelocityDir.x = _panVelocityDir.x / _panVelocityMagnitude
            _panVelocityDir.y = _panVelocityDir.y / _panVelocityMagnitude
        } else {
            _panVelocityMagnitude = 0.0
            _panVelocityDir.x = 0.0
            _panVelocityDir.y = 0.0
        }
        
        switch panGestureRecognizer.state {
        case .began:
            isPanGestureActive = true
            if !delegate.attemptPanBegan(center: _gestureCenter, numberOfTouches: panGestureRecognizer.numberOfTouches) {
                cancelAllGestureRecognizers()
                return
            }
            _panGestureRecognizerTouchCount = panGestureRecognizer.numberOfTouches
        case .changed:
            if panGestureRecognizer.numberOfTouches != _panGestureRecognizerTouchCount {
                if panGestureRecognizer.numberOfTouches > _panGestureRecognizerTouchCount {
                    if !delegate.attemptPanBegan(center: _gestureCenter, numberOfTouches: panGestureRecognizer.numberOfTouches) {
                        cancelAllGestureRecognizers()
                        return
                    }
                    _panGestureRecognizerTouchCount = panGestureRecognizer.numberOfTouches
                } else {
                    // Our center hopped, revert to previous
                    _gestureCenter = _gesturePreviousCenter
                    if delegate.attemptPanEnded(center: _gestureCenter,
                                                releaseDir: _panVelocityDir,
                                                releaseMagnitude: _panVelocityMagnitude) { }
                    cancelAllGestureRecognizers()
                    return
                }
            } else {
                if !delegate.attemptPanMoved(center: _gestureCenter, numberOfTouches: panGestureRecognizer.numberOfTouches) {
                    cancelAllGestureRecognizers()
                    return
                }
            }
        default:
            isPanGestureActive = false
            if delegate.attemptPanEnded(center: _gestureCenter,
                                        releaseDir: _panVelocityDir,
                                        releaseMagnitude: _panVelocityMagnitude) { }
            cancelAllGestureRecognizers()
            return
        }
        _gesturePreviousCenter = _gestureCenter
    }
    
    private var _pinchTouchCount = 0
    @objc func didPinch(_ pinchGestureRecognizer: UIPinchGestureRecognizer) -> Void {
        
        guard let delegate = delegate,
              _cancelGestureTimer <= 0.0,
              _cancelTouchTimer <= 0.0 else {
            cancelAllGestureRecognizers()
            return
        }
        
        let _center = pinchGestureRecognizer.location(in: self)
        _gestureCenter.x = Float(_center.x); _gestureCenter.y = Float(_center.y)
        
        switch pinchGestureRecognizer.state {
        case .began:
            isPinchGestureActive = true
            if !delegate.attemptPinchBegan(center: _gestureCenter,
                                           scale: Float(pinchGestureRecognizer.scale),
                                           numberOfTouches: pinchGestureRecognizer.numberOfTouches) {
                cancelAllGestureRecognizers()
                return
            }
            _pinchTouchCount = pinchGestureRecognizer.numberOfTouches
        case .changed:
            if _pinchTouchCount != pinchGestureRecognizer.numberOfTouches {
                if pinchGestureRecognizer.numberOfTouches > _pinchTouchCount {
                    pinchGestureRecognizer.scale = 1.0
                    if !delegate.attemptPinchBegan(center: _gestureCenter,
                                                   scale: Float(pinchGestureRecognizer.scale), 
                                                   numberOfTouches: pinchGestureRecognizer.numberOfTouches) {
                        cancelAllGestureRecognizers()
                        return
                    }
                    _pinchTouchCount = pinchGestureRecognizer.numberOfTouches
                } else {
                    // Our center hopped, revert to previous
                    _gestureCenter = _gesturePreviousCenter
                    
                    if delegate.attemptPinchEnded(center: _gestureCenter,
                                                  scale: Float(pinchGestureRecognizer.scale)) { }
                    cancelAllGestureRecognizers()
                    return
                }
            } else {
                if !delegate.attemptPinchMoved(center: _gestureCenter,
                                               scale: Float(pinchGestureRecognizer.scale),
                                               numberOfTouches: pinchGestureRecognizer.numberOfTouches) {
                    cancelAllGestureRecognizers()
                    return
                }
            }
        default:
            isPinchGestureActive = false
            if delegate.attemptPinchEnded(center: _gestureCenter,
                                          scale: Float(pinchGestureRecognizer.scale)) { }
            cancelAllGestureRecognizers()
            return
        }
        _gesturePreviousCenter = _gestureCenter
    }
    
    private var _rotateTouchCount = 0
    @objc func didRotate(_ rotationGestureRecognizer: UIRotationGestureRecognizer) -> Void {
        guard let delegate = delegate,
              _cancelGestureTimer <= 0.0,
              _cancelTouchTimer <= 0.0 else {
            cancelAllGestureRecognizers()
            return
        }
        
        let _center = rotationGestureRecognizer.location(in: self)
        _gestureCenter.x = Float(_center.x); _gestureCenter.y = Float(_center.y)
        
        switch rotationGestureRecognizer.state {
        case .began:
            isRotationGestureActive = true
            
            if !delegate.attemptRotateBegan(center: _gestureCenter,
                                            rotation: Float(rotationGestureRecognizer.rotation),
                                            numberOfTouches: rotationGestureRecognizer.numberOfTouches) {
                cancelAllGestureRecognizers()
                return
            }
            _rotateTouchCount = rotationGestureRecognizer.numberOfTouches
        case .changed:
            if _rotateTouchCount != rotationGestureRecognizer.numberOfTouches {
                if rotationGestureRecognizer.numberOfTouches > _rotateTouchCount {
                    rotationGestureRecognizer.rotation = 0.0
                    if !delegate.attemptRotateBegan(center: _gestureCenter,
                                                    rotation: Float(rotationGestureRecognizer.rotation),
                                                    numberOfTouches: rotationGestureRecognizer.numberOfTouches) {
                        cancelAllGestureRecognizers()
                        return
                    }
                    _rotateTouchCount = rotationGestureRecognizer.numberOfTouches
                } else {
                    // Our center hopped, revert to previous
                    _gestureCenter = _gesturePreviousCenter
                    
                    if delegate.attemptRotateEnded(center: _gestureCenter,
                                                   rotation: Float(rotationGestureRecognizer.rotation)) { }
                    cancelAllGestureRecognizers()
                    return
                }
            } else {
                if !delegate.attemptRotateMoved(center: _gestureCenter,
                                                rotation: Float(rotationGestureRecognizer.rotation),
                                                numberOfTouches: rotationGestureRecognizer.numberOfTouches) {
                    cancelAllGestureRecognizers()
                    return
                }
            }
        default:
            isRotationGestureActive = false
            if delegate.attemptRotateEnded(center: _gestureCenter,
                                           rotation: Float(rotationGestureRecognizer.rotation)) { }
            cancelAllGestureRecognizers()
            return
        }
        _gesturePreviousCenter = _gestureCenter
    }
    
    @objc func didDoubleTap(_ tapGestureRecognizer: UITapGestureRecognizer) -> Void {
        if let delegate = delegate {
            let _center = tapGestureRecognizer.location(in: self)
            delegate.handleDoubleTap(center: Math.Point(x: Float(_center.x),
                                                        y: -Float(center.y)),
                                     numberOfTouches: tapGestureRecognizer.numberOfTouches)
        }
    }
    
    private var _cancelGestureTimer = Float(0.0)
    func cancelAllGestureRecognizers() {
        _cancelGestureTimer = 0.065
        panGestureRecognizer.isEnabled = false
        pinchGestureRecognizer.isEnabled = false
        rotationGestureRecognizer.isEnabled = false
        doubleTapGestureRecognizer.isEnabled = false
        
        isPanGestureActive = false
        isPinchGestureActive = false
        isRotationGestureActive = false
        
        
        if let delegate = delegate {
            delegate.allGestureRecognizersWereCancelled()
        }
    }
    
    private var _cancelTouchTimer = Float(0.0)
    func cancelAllTouches(touches: [UITouch], 
                          points: [Math.Point]) {
        _cancelTouchTimer = 0.065
        
        if let delegate = delegate {
            delegate.allTouchesWereCancelled(touches: touches,
                                             points: points)
        }
    }
    
    func cancelAllGestureRecognizersAndTouches(touches: [UITouch],
                                               points: [Math.Point]) {
        cancelAllGestureRecognizers()
        cancelAllTouches(touches: touches,
                         points: points)
    }
}

extension GestureView: UIGestureRecognizerDelegate {
    
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard let delegate = delegate else {
            return true
        }
        let position = gestureRecognizer.location(in: self)
        return delegate.gestureRecognizerShouldBegin(point: .init(x: Float(position.x),
                                                                  y: Float(position.y)))
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        guard let delegate = delegate else {
            return true
        }
        let position = touch.location(in: self)
        return delegate.gestureRecognizerShouldReceiveTouch(point: .init(x: Float(position.x),
                                                                         y: Float(position.y)))
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, 
                           shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
