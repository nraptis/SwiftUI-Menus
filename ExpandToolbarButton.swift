//
//  ExpandToolbarButton.swift
//  Bounce
//
//  Created by Raptis, Nicholas on 9/28/17.
//  Copyright © 2017 Darkswarm LLC. All rights reserved.
//

import UIKit

class ExpandToolbarButton: DrawableButton, UIGestureRecognizerDelegate {
    
    let imageFrameDark = UIImage(named: "phone_ec_box_dark") ?? UIImage()
    let imageFrameDarkPressed = UIImage(named: "phone_ec_box_dark_pressed") ?? UIImage()
    
    let imageFrameLight = UIImage(named: "phone_ec_box_light") ?? UIImage()
    let imageFrameLightPressed = UIImage(named: "phone_ec_box_light_pressed") ?? UIImage()
    
    let imageArrowDownDark = UIImage(named: "phone_ec_arrow_down_dark") ?? UIImage()
    let imageArrowDownLight = UIImage(named: "phone_ec_arrow_down_light") ?? UIImage()
    
    let imageArrowUpDark = UIImage(named: "phone_ec_arrow_up_dark") ?? UIImage()
    let imageArrowUpLight = UIImage(named: "phone_ec_arrow_up_light") ?? UIImage()
    
    lazy var longPressRecognizer: UILongPressGestureRecognizer = {
        let result = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        return result
    }()
    
    var isDragging = false
    var dragStartGestureX = CGFloat(0.0)
    var dragStartConstraintLeft = CGFloat(0.0)
    var dragWobbleSin = CGFloat(0.0)
    var dragWobbleDamper = CGFloat(0.0)
    var safeWidth = CGFloat(255.0)
    
    var isAtTopOfScreen: Bool = false
    var isUpArrow: Bool = false
    
    weak var leftConstraint: NSLayoutConstraint?
    required init(isAtTopOfScreen: Bool) {
        self.isAtTopOfScreen = isAtTopOfScreen
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.backgroundColor = UIColor.red.withAlphaComponent(0.25)
        
        setNeedsDisplay()
        
        longPressRecognizer.cancelsTouchesInView = true
        longPressRecognizer.delegate = self
        addGestureRecognizer(longPressRecognizer)
        
        clipsToBounds = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(top: Bool) {
        super.setUp()
    }
    
    func update(deltaTime: Float, safeWidth: CGFloat) {
        
        self.safeWidth = safeWidth
        
        if isDragging {
            dragWobbleDamper += CGFloat(deltaTime) * 4.0
            if dragWobbleDamper > 1.0 {
                dragWobbleDamper = 1.0
            }
        }
        
        if dragWobbleDamper > 0.0 {
            dragWobbleSin += CGFloat(deltaTime) * 8.0
            if dragWobbleSin > CGFloat(Math.pi2) {
                dragWobbleSin -= CGFloat(Math.pi2)
            }
            if isDragging == false {
                dragWobbleDamper -= CGFloat(deltaTime) * 3.0
                if dragWobbleDamper < 0.0 {
                    dragWobbleDamper = 0.0
                }
            }
            updateTransform()
        } else {
            dragWobbleSin = CGFloat(Math.pi_2)
        }
    }
    
    var scale = 1.0
    var rotation = 0.0
    var translate = CGPoint.zero
    
    func updateTransform() {
        
        //var transform = CGAffineTransform.identity
        
        if dragWobbleDamper <= 0.0 {
            dragWobbleDamper = 0.0
            scale = 1.0
            rotation = 0.0
            translate = CGPoint.zero
        } else {
            
            scale = 1.0 + dragWobbleDamper * 0.25
            rotation = CGFloat(sinf(Float(dragWobbleSin))) * 0.075 * dragWobbleDamper
            
            var translateAmount = CGFloat(0.0)
            if !isAtTopOfScreen { 
                translateAmount = -12.0
            }
            
            
            translateAmount *= dragWobbleDamper
            translate = CGPoint(x: 0.0, y: translateAmount)
            
            
            //transform = transform.translatedBy(x: 0.0, y: translateAmount)
            //transform = transform.rotated(by: rotation)
            //transform = transform.scaledBy(x: scale, y: scale)
        }
        //self.transform = transform
        setNeedsDisplay()
        
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        if ApplicationController.isDarkModeEnabled {
            if isPressed {
                centerImage(context: context, image: imageFrameDarkPressed, offset: .zero, alpha: 1.0)
            } else {
                centerImage(context: context, image: imageFrameDark, offset: .zero, alpha: 1.0)
            }
            
        } else {
            if isPressed {
                centerImage(context: context, image: imageFrameLightPressed, offset: .zero, alpha: 1.0)
            } else {
                centerImage(context: context, image: imageFrameLight, offset: .zero, alpha: 1.0)
            }
        }
        
        if ApplicationController.isDarkModeEnabled {
            if isUpArrow {
                if isPressed {
                    centerImage(context: context, image: imageArrowUpDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: imageArrowUpDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            } else {
                if isPressed {
                    centerImage(context: context, image: imageArrowDownDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: imageArrowDownDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            }
        } else {
            if isUpArrow {
                if isPressed {
                    centerImage(context: context, image: imageArrowUpLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: imageArrowUpLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            } else {
                
                if isPressed {
                    centerImage(context: context, image: imageArrowDownLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: imageArrowDownLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            }
        }
    }
    
    func centerImage(context: CGContext, image: UIImage, offset: CGPoint, alpha: CGFloat) {
        let imageCenterX = bounds.origin.x + bounds.size.width / 2.0
        let imageCenterY = bounds.origin.y + bounds.size.height / 2.0
        
        // Save the current graphics state
            context.saveGState()
        
        context.translateBy(x: bounds.midX - offset.x + translate.x,
                            y: bounds.midY - offset.y + translate.y)
        context.scaleBy(x: scale, y: scale)
        context.rotate(by: rotation)
        
        let imgRect = CGRect(x: -image.size.width / 2.0,
                             y: -image.size.height / 2.0,
                             width: image.size.width,
                             height: image.size.height)
        
        context.setBlendMode(.normal)  // Ensure normal blending
        context.setAlpha(alpha)        // Set alpha for transparency
        
        if let cgImage = image.cgImage {
            context.draw(cgImage, in: imgRect)
        }
        
        context.restoreGState()
    }
    
    @objc func handleLongPress() {
        guard let rootView = ApplicationController.rootViewController.view else {
            return
        }
        let point = longPressRecognizer.location(in: rootView)
        switch(longPressRecognizer.state) {
        case .began:
            dragStartGestureX = point.x
            dragStartConstraintLeft = 0.0
            if let leftConstraint = leftConstraint {
                dragStartConstraintLeft = leftConstraint.constant
            }
            isDragging = true
            break
        case .changed:
            if isDragging {
                if let leftConstraint = leftConstraint {
                    let dragMaxX = safeWidth - bounds.width
                    let dragMinX = CGFloat(0.0)
                    var newLeft = dragStartConstraintLeft + (point.x - dragStartGestureX)
                    if newLeft < dragMinX { newLeft = dragMinX }
                    if newLeft > dragMaxX { newLeft = dragMaxX }
                    leftConstraint.constant = newLeft
                    updateTransform()
                }
            }
            break
        default:
            isDragging = false
            break
        }
    }
}
