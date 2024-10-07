//
//  ImageImportViewController+GestureViewDelegate.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/31/24.
//

import Foundation
import UIKit

extension ImageImportViewController: GestureViewDelegate {
    
    func touchesBegan(touches: [UITouch], points: [Math.Point], allTouchCount: Int) {
        
    }
    
    func touchesMoved(touches: [UITouch], points: [Math.Point], isFromRelease: Bool, allTouchCount: Int) {
        
    }
    
    func touchesEnded(touches: [UITouch], points: [Math.Point], allTouchCount: Int) {
        
    }
    
    func allGestureRecognizersWereCancelled() {
        
    }
    
    func allTouchesWereCancelled(touches: [UITouch], points: [Math.Point]) {
        
    }
    
    func gestureRecognizerShouldBegin(point: Math.Point) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        return true
    }
    
    func gestureRecognizerShouldReceiveTouch(point: Math.Point) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        let cgPoint = point.cgPoint
        if topBar.frame.contains(cgPoint) { return false }
        if bottomBar.frame.contains(cgPoint) { return false }
        return true
    }
    
    func attemptPanBegan(center: Math.Point, numberOfTouches: Int) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        touchCenter = center.cgPoint
        gestureBegan(touchCenter)
        return true
    }
    
    func attemptPanMoved(center: Math.Point, numberOfTouches: Int) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        touchCenter = center.cgPoint
        updateTransform()
        return true
    }
    
    func attemptPanEnded(center: Math.Point, releaseDir: Math.Vector, releaseMagnitude: Float) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        return true
    }
    
    func attemptPinchBegan(center: Math.Point, scale: Float, numberOfTouches: Int) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        touchCenter = center.cgPoint
        startScale = CGFloat(self.scale)
        gestureBegan(touchCenter)
        return true
    }
    
    func attemptPinchMoved(center: Math.Point, scale: Float, numberOfTouches: Int) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        touchCenter = center.cgPoint
        self.scale = startScale * CGFloat(scale)
        updateTransform()
        return true
    }
    
    func attemptPinchEnded(center: Math.Point, scale: Float) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        return true
    }
    
    func attemptRotateBegan(center: Math.Point, rotation: Float, numberOfTouches: Int) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        touchCenter = center.cgPoint
        startRotation = self.rotation
        gestureBegan(touchCenter)
        return true
    }
    
    func attemptRotateMoved(center: Math.Point, rotation: Float, numberOfTouches: Int) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        touchCenter = center.cgPoint
        self.rotation = startRotation + CGFloat(rotation)
        updateTransform()
        return true
    }
    
    func attemptRotateEnded(center: Math.Point, rotation: Float) -> Bool {
        if isRotatingOrResetting {
            return false
        }
        if isFinished {
            return false
        }
        return true
    }
    
    func handleDoubleTap(center: Math.Point, numberOfTouches: Int) {
        
    }
    
}
