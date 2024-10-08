//
//  DrawableButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/11/23.
//

import UIKit

class DrawableButton: UIButton {
    
    override var isEnabled: Bool {
        set {
            super.isEnabled = newValue
            setNeedsDisplay()
        }
        get {
            return super.isEnabled
        }
    }
    
    var isPressed: Bool {
        isTouchInside && isTracking
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    func setUp() {
        
        //translatesAutoresizingMaskIntoConstraints = false
        self.addTarget(self, action: #selector(didToggleControlState), for: .touchDown)
        self.addTarget(self, action: #selector(didToggleControlState), for: .touchDragInside)
        self.addTarget(self, action: #selector(didToggleControlState), for: .touchDragOutside)
        self.addTarget(self, action: #selector(didToggleControlState), for: .touchCancel)
        self.addTarget(self, action: #selector(didToggleControlState), for: .touchUpInside)
        self.addTarget(self, action: #selector(didToggleControlState), for: .touchUpOutside)
    }
    
    class func getCornerType(ul:Bool, ur:Bool, dr:Bool, dl:Bool) -> UIRectCorner {
        var result:UIRectCorner = UIRectCorner(rawValue: 0)
        if ul == true {result = result.union(UIRectCorner.topLeft)}
        if ur == true {result = result.union(UIRectCorner.topRight)}
        if dr == true {result = result.union(UIRectCorner.bottomRight)}
        if dl == true {result = result.union(UIRectCorner.bottomLeft)}
        return result;
    }
    
    @objc internal func didToggleControlState() {
        self.setNeedsDisplay()
    }
}
