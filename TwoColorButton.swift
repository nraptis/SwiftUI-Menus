//
//  TwoColorButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/24/24.
//

import UIKit

class TwoColorButton: DrawableButton {
    
    var colorUp = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    var colorDown = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.44)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    @objc internal override func didToggleControlState() {
        if isPressed {
            backgroundColor = colorDown
        } else {
            backgroundColor = colorUp
        }
        super.didToggleControlState()
        
    }
}
