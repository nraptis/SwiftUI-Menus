//
//  UIView+Activate.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/1/24.
//

import UIKit

extension UIView {
    
    func activate() {
        isHidden = false
        isUserInteractionEnabled = true
    }
    
    func deactivate() {
        isHidden = true
        isUserInteractionEnabled = false
    }
    
}
