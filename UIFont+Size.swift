//
//  UIFont+Size.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/21/24.
//

import Foundation
import UIKit

extension UIFont {
    func stringWidth(_ text: String) -> CGFloat {
        
        /*
        let stringObject = text as NSString
        let resultSize = stringObject.boundingRect(with: CGSize(width: 4096.0, height: 4096.0),
                                                   options: .usesLineFragmentOrigin,
                                                   attributes: [NSAttributedString.Key.font : self],
                                                   context: nil)
        return resultSize.width
        */
        
        let fontAttribute = [NSAttributedString.Key.font: self]
        
        let size = text.size(withAttributes: fontAttribute)
        return CGFloat(Int(size.width + 1.5)) // + 1.0
        
    }
    
    func scaleHorizontally(scaleX: CGFloat, size: CGFloat) -> UIFont {
        var fontDescriptor = self.fontDescriptor
        fontDescriptor = fontDescriptor.withMatrix(CGAffineTransform(scaleX: scaleX, y: 1.0))
        return UIFont(descriptor: fontDescriptor, size: size)
    }
}
