//
//  Device.swift
//  Jiggle III
//
//  Created by Nicky Taylor on 11/8/23.
//

import UIKit

class Device {
    
    let widthPortrait: Float
    let heightPortrait: Float
    let widthLandscape: Float
    let heightLandscape: Float
    
    let widthPortraitScaled: Float
    let heightPortraitScaled: Float
    let widthLandscapeScaled: Float
    let heightLandscapeScaled: Float
    
    @MainActor private static var _isPad = false
    @MainActor private static var _isPadSet = false
    @MainActor static var isPad: Bool {
        if _isPadSet == false {
            _isPadSet = true
            _isPad = (UIDevice.current.userInterfaceIdiom == .pad)
        }
        return _isPad
    }
    
    @MainActor private static var _isPhone = false
    @MainActor private static var _isPhoneSet = false
    @MainActor static var isPhone: Bool {
        if _isPhoneSet == false {
            _isPhoneSet = true
            _isPhone = (UIDevice.current.userInterfaceIdiom == .phone)
        }
        return _isPhone
    }
    
    @MainActor static var hasSafeAreaTop: Bool {
        guard let scene = UIApplication.shared.connectedScenes.first else {
            return false
        }
        guard let windowScene = scene as? UIWindowScene else {
            return false
        }
        guard let window = windowScene.windows.first else {
            return false
        }
        return window.safeAreaInsets.top > 24
    }
    
    @MainActor static var scale: Float {
        Float(UIScreen.main.scale)
    }
    
    @MainActor init() {
        let _screenWidth = Float(Int(UIScreen.main.bounds.size.width + 0.5))
        let _screenHeight = Float(Int(UIScreen.main.bounds.size.height + 0.5))
        
        widthPortrait = _screenWidth < _screenHeight ? _screenWidth : _screenHeight
        heightPortrait = _screenWidth < _screenHeight ? _screenHeight : _screenWidth
        widthLandscape = heightPortrait
        heightLandscape = widthPortrait
        
        widthPortraitScaled = Float(Int(widthPortrait * Self.scale + 0.5))
        heightPortraitScaled = Float(Int(heightPortrait * Self.scale + 0.5))
        widthLandscapeScaled = heightPortraitScaled
        heightLandscapeScaled = widthPortraitScaled
    }
}
