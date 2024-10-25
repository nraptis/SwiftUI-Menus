//
//  ExpandToolbarButtonRenderContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/9/24.
//

import UIKit

class ExpandToolbarButtonRenderContent: UIView {

    weak var expandToolbarButton: ExpandToolbarButton?
    
    var dragWobbleSin = CGFloat(0.0)
    var dragWobbleDamper = CGFloat(0.0)
    
    let isAtTopOfScreen: Bool
    
    
    weak var leftConstraint: NSLayoutConstraint?
    required init(expandToolbarButton: ExpandToolbarButton,
                  isAtTopOfScreen: Bool) {
        self.isAtTopOfScreen = isAtTopOfScreen
        self.expandToolbarButton = expandToolbarButton
        
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        self.backgroundColor = .clear
        
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func update(deltaTime: Float,
                isDragging: Bool) {
        
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
        
        guard let expandToolbarButton = expandToolbarButton else { return }
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        if ApplicationController.isDarkModeEnabled {
            if expandToolbarButton.isPressed {
                centerImage(context: context, image: ExpandToolbarButton.imageFrameDarkPressed, offset: .zero, alpha: 1.0)
            } else {
                centerImage(context: context, image: ExpandToolbarButton.imageFrameDark, offset: .zero, alpha: 1.0)
            }
            
        } else {
            if expandToolbarButton.isPressed {
                centerImage(context: context, image: ExpandToolbarButton.imageFrameLightPressed, offset: .zero, alpha: 1.0)
            } else {
                centerImage(context: context, image: ExpandToolbarButton.imageFrameLight, offset: .zero, alpha: 1.0)
            }
        }
        
        if ApplicationController.isDarkModeEnabled {
            if expandToolbarButton.isUpArrow {
                if expandToolbarButton.isPressed {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowUpDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowUpDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            } else {
                if expandToolbarButton.isPressed {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowDownDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowDownDark, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            }
        } else {
            if expandToolbarButton.isUpArrow {
                if expandToolbarButton.isPressed {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowUpLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowUpLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            } else {
                
                if expandToolbarButton.isPressed {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowDownLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 0.7)
                } else {
                    centerImage(context: context, image: ExpandToolbarButton.imageArrowDownLight, offset: CGPoint(x: 0.0, y: 0.0), alpha: 1.0)
                }
            }
        }
    }
    
    func centerImage(context: CGContext, image: UIImage, offset: CGPoint, alpha: CGFloat) {
        
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
}
