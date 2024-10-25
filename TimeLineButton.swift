//
//  TimeLineButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/23/24.
//

import UIKit

class TimeLineButton: DrawableButton {
    
    var scale = CGFloat(1.0)
    let cornerRadius: Int
    let imageDark: UIImage
    let imageLight: UIImage
    let isSelectedSwatch: Bool
    required init(cornerRadius: Int,
                  imageDark: UIImage,
                  imageLight: UIImage,
                  isSelectedSwatch: Bool) {
        self.cornerRadius = cornerRadius
        self.imageDark = imageDark
        self.imageLight = imageLight
        self.isSelectedSwatch = isSelectedSwatch
        
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        
        setNeedsDisplay()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(top: Bool) {
        super.setUp()
    }
    
    @objc override internal func didToggleControlState() {
        super.didToggleControlState()
        if isPressed {
            scale = 1.35
        } else {
            scale = 1.0
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        
        let roundedRectPath = UIBezierPath(roundedRect: bounds, cornerRadius: CGFloat(cornerRadius))
        
        context.saveGState()
        context.addPath(roundedRectPath.cgPath)
        if ApplicationController.isDarkModeEnabled {
            context.setFillColor(ToolInterfaceTheme._graphBackgroundDark.cgColor)
        } else {
            context.setFillColor(ToolInterfaceTheme._graphBackgroundLight.cgColor)
        }
        context.fillPath()
        context.restoreGState()
        
        
        context.saveGState()
        context.addPath(roundedRectPath.cgPath)
        if ApplicationController.isDarkModeEnabled {
            context.setStrokeColor(ToolInterfaceTheme._graphBorderDark.cgColor)
        } else {
            context.setStrokeColor(ToolInterfaceTheme._graphBorderLight.cgColor)
        }
        context.setLineWidth(Device.isPad ? 2.0 : 1.0)
        context.strokePath()
        context.restoreGState()
        
        
        if ApplicationController.isDarkModeEnabled {
            centerImage(context: context, image: imageDark, offset: .zero, alpha: 1.0)
        } else {
            centerImage(context: context, image: imageLight, offset: .zero, alpha: 1.0)
        }
        
    }
    
    func centerImage(context: CGContext, image: UIImage, offset: CGPoint, alpha: CGFloat) {
        
        context.saveGState()
        
        context.translateBy(x: bounds.midX,
                            y: bounds.midY)
        context.scaleBy(x: -scale, y: -scale)
        
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
