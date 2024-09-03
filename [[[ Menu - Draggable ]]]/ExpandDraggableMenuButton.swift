//
//  ExpandDraggableMenuButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/20/24.
//

import UIKit

class ExpandDraggableMenuButton: DrawableButton {
    
    let imageCollapseDark = UIImage(named: "ipad_topbar_ec_collapse_light") ?? UIImage()
    let imageCollapseLight = UIImage(named: "ipad_topbar_ec_collapse_dark") ?? UIImage()
    
    let imageExpandDark = UIImage(named: "ipad_topbar_ec_expand_light") ?? UIImage()
    let imageExpandLight = UIImage(named: "ipad_topbar_ec_expand_dark") ?? UIImage()
    
    let imageUnderlayDark = UIImage(named: "ipad_topbar_ec_underlay_light") ?? UIImage()
    let imageUnderlayLight = UIImage(named: "ipad_topbar_ec_underlay_dark") ?? UIImage()
    
    var isExpanded = false
    required init(isExpanded: Bool) {
        
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(top: Bool) {
        super.setUp()
    }
    
    func update(isExpanded: Bool) {
        self.isExpanded = isExpanded
        self.setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.clear(bounds)
        
        var imageIcon: UIImage?
        var imageUnderlay: UIImage?
        
        if ApplicationController.isDarkModeEnabled {
            if isPressed {
                imageUnderlay = imageUnderlayDark
            }
            if isExpanded {
                imageIcon = imageCollapseDark
            } else {
                imageIcon = imageExpandDark
            }
        } else {
            if isPressed {
                imageUnderlay = imageUnderlayLight
            }
            if isExpanded {
                imageIcon = imageCollapseLight
            } else {
                imageIcon = imageExpandLight
            }
        }

        if let imageUnderlay = imageUnderlay {
            let imageCenterX = bounds.origin.x + bounds.size.width / 2.0
            let imageCenterY = bounds.origin.y + bounds.size.height / 2.0
            let imgRect = CGRect(x: imageCenterX - imageUnderlay.size.width / 2.0,
                                 y: imageCenterY - imageUnderlay.size.height / 2.0,
                                 width: imageUnderlay.size.width,
                                 height: imageUnderlay.size.height)
            imageUnderlay.draw(in: imgRect)
        }
        
        if let imageIcon = imageIcon {
            let imageCenterX = bounds.origin.x + bounds.size.width / 2.0
            let imageCenterY = bounds.origin.y + bounds.size.height / 2.0
            let imgRect = CGRect(x: imageCenterX - imageIcon.size.width / 2.0,
                                 y: imageCenterY - imageIcon.size.height / 2.0,
                                 width: imageIcon.size.width,
                                 height: imageIcon.size.height)
            imageIcon.draw(in: imgRect)
        }
        
        
        
    }
    
}
