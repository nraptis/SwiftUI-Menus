//
//  TimelineClippingView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/11/24.
//

import UIKit

class TimeLineClippingView: UIView {
    
    
    
    let insetLeft: Int
    let insetRight: Int
    let insetTop: Int
    let insetBottom: Int
    let cornerRadius: Int
    required init(insetLeft: Int, insetRight: Int, insetTop: Int, insetBottom: Int, cornerRadius: Int) {
        self.insetLeft = insetLeft
        self.insetRight = insetRight
        self.insetTop = insetTop
        self.insetBottom = insetBottom
        self.cornerRadius = cornerRadius
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
        isUserInteractionEnabled = false
        
        
        
    }
    
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        context.clear(bounds)
        
        let strokeRect = CGRect(x: bounds.origin.x + CGFloat(insetLeft),
                                y: bounds.origin.y + CGFloat(insetTop),
                                width: bounds.size.width - CGFloat(insetLeft + insetRight),
                                height: bounds.size.height - CGFloat(insetTop + insetBottom))
        let cutOutPath = UIBezierPath(roundedRect: strokeRect, cornerRadius: CGFloat(cornerRadius))
        context.saveGState()
        context.addPath(cutOutPath.cgPath)
        //TODO: Diff
        
        if ApplicationController.isDarkModeEnabled {
            context.setStrokeColor(ToolInterfaceTheme._graphBorderDark.cgColor)
        } else {
            context.setStrokeColor(ToolInterfaceTheme._graphBorderLight.cgColor)
        }
        
        context.setLineWidth(Device.isPad ? 2.0 : 1.0)
        context.strokePath()
        context.restoreGState()
    }
}


