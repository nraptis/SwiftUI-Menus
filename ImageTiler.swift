//
//  ImageTiler.swift
//  Bounce
//
//  Created by Raptis, Nicholas on 1/23/17.
//  Copyright © 2017 Darkswarm LLC. All rights reserved.
//

import UIKit

class ImageTiler: UIView {
    
    var image: UIImage?
    
    var _scale = CGFloat(1.0)
    var scale = CGFloat(1.0) {
        didSet {
            if _scale != scale {
                _scale = scale
                setNeedsDisplay()
            }
        }
    }
    
    var _offsetX: CGFloat = 0.0
    var _offsetY: CGFloat = 0.0
    var offset = CGPoint.zero {
        didSet {
            if _offsetX != offset.x {
                _offsetX = offset.x
                setNeedsDisplay()
            }
            if _offsetY != offset.y {
                _offsetY = offset.y
                setNeedsDisplay()
            }
        }
    }
    
    init(image: UIImage?) {
        self.image = image
        super.init(frame: CGRect(x: 0.0, y: 0.0, width: 512.0, height: 512.0))
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        
        guard let drawImage = image else {
            return
        }
        guard drawImage.cgImage != nil else {
            return
        }
        
        let imgWidth = CGFloat(Int(drawImage.size.width / _scale + 0.5))
        let imgHeight = CGFloat(Int(drawImage.size.height / _scale + 0.5))
        
        print("drawed with wid: \(_scale) scale: \(_scale)")
        
        guard imgWidth > 8.0 && imgHeight > 8.0 else {
            return
        }
        
        let rect = bounds
        
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.saveGState()
        
        let drawStartX: CGFloat = 0.0
        let drawStartY: CGFloat = 0.0
        
        var drawX: CGFloat = drawStartX
        var drawY: CGFloat = drawStartY
        
        while drawX < rect.width {
            drawY = drawStartY
            while drawY < rect.height {
                drawImage.draw(in: CGRect(x: drawX, y: drawY, width: imgWidth, height: imgHeight))
                drawY += imgHeight
            }
            drawX += imgWidth
        }
        context.restoreGState()
    }
}
