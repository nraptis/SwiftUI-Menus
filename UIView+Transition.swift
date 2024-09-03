//
//  UIView+Transition.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/27/24.
//

import UIKit

extension UIView {
    
    func transitionChildren(previousView: UIView,
                            previousConstraint: NSLayoutConstraint,
                            currentView: UIView,
                            currentConstraint: NSLayoutConstraint,
                            reversed: Bool,
                            time: CGFloat,
                            completion: @escaping () -> Void) {
        
        let positionLeft = (-bounds.size.width)
        let positionCenter = CGFloat(0.0)
        let positionRight = (bounds.size.width)
        
        previousView.activate()
        currentView.activate()
        
        previousConstraint.constant = positionCenter
        if reversed {
            // newView starts on left
            currentConstraint.constant = positionLeft
        } else {
            // newView starts on right
            currentConstraint.constant = positionRight
        }
        
        self.layoutIfNeeded()
        
        UIView.animate(withDuration: TimeInterval(time), delay: 0.0, options: .curveLinear, animations: {
            if reversed {
                // previousView ends on right
                previousConstraint.constant = positionRight
            } else {
                // previousView ends on left
                previousConstraint.constant = positionLeft
            }
            currentConstraint.constant = positionCenter
            self.layoutIfNeeded()
        }) { _ in
            previousView.deactivate()
            completion()
        }
    }
}
