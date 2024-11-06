//
//  KeyboardHandler.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class KeyboardHandler: NSObject {
    
    private var _isKeyboardVisible: Bool = false
    private var _keyboardHeight: CGFloat = 0.0
    private var _keyboardWidth: CGFloat = 0.0
    
    var willExpandHandler: ((_ : CGFloat, _ : TimeInterval, _ : UIView.AnimationOptions) -> Void)? //height, duration, animation options
    var willCollapseHandler: ((_ :  TimeInterval, _ : UIView.AnimationOptions) -> Void)? //duration, animation options
    
    private static var resizeEpsilon: CGFloat = 24.0

    override init() {
        super.init()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidChangeHeight), name: UIResponder.keyboardDidChangeFrameNotification, object: nil)
    }

    static func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        _isKeyboardVisible = true
        
        guard let info = notification.userInfo else { return }
        guard let sizeValue = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        guard let optionsValue = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else { return }
        guard let durationValue = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }

        let keyboardSize = sizeValue.cgRectValue
        let options = UIView.AnimationOptions(rawValue: optionsValue.uintValue)
        let duration = TimeInterval(durationValue.floatValue)
        
        if CGFloat(fabsf(Float(keyboardSize.height - _keyboardHeight))) < KeyboardHandler.resizeEpsilon {
            if CGFloat(fabsf(Float(keyboardSize.width - _keyboardWidth))) < KeyboardHandler.resizeEpsilon {
                return
            }
        }
        _keyboardHeight = keyboardSize.height
        _keyboardWidth = keyboardSize.width
        willExpandHandler?(keyboardSize.height, duration, options)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        guard _isKeyboardVisible else { return }
        _keyboardHeight = 0.0
        _keyboardWidth = 0.0
        _isKeyboardVisible = false
        guard let info = notification.userInfo else { return }
        guard let optionsValue = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else { return }
        guard let durationValue = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }
        let options = UIView.AnimationOptions(rawValue: optionsValue.uintValue)
        let duration = TimeInterval(durationValue.floatValue)
        self.willCollapseHandler?(duration, options)
    }

    @objc func keyboardDidChangeHeight(notification: NSNotification) {
        guard _isKeyboardVisible else { return }
        guard let info = notification.userInfo else { return }
        guard let sizeValue = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        guard let optionsValue = info[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber else { return }
        guard let durationValue = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber else { return }
        
        let keyboardSize = sizeValue.cgRectValue
        let options = UIView.AnimationOptions(rawValue: optionsValue.uintValue)
        let duration = TimeInterval(durationValue.floatValue)
        
        if CGFloat(fabsf(Float(keyboardSize.height - _keyboardHeight))) < KeyboardHandler.resizeEpsilon {
            if CGFloat(fabsf(Float(keyboardSize.width - _keyboardWidth))) < KeyboardHandler.resizeEpsilon {
                return
            }
        }
        _keyboardHeight = keyboardSize.height
        _keyboardWidth = keyboardSize.width
        
        self.willExpandHandler?(keyboardSize.height, duration, options)
    }
    
}
