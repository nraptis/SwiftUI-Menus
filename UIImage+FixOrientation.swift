//
//  UIImage+FixOrientation.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import UIKit

extension UIImage {
    
    /*
     static func fixOrientation(image: UIImage?) -> UIImage? {
     if let image = image {
     if image.imageOrientation == .up {
     return image
     }
     if let cgImage = image.cgImage {
     return UIImage.init(cgImage: cgImage, scale: image.scale, orientation: .up)
     }
     }
     return nil
     }
     */
    
    
    static func fixedOrientation(for image: UIImage) -> UIImage? {
        
        if image.imageOrientation == .up {
            return image
        } else {
            UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
            image.draw(in: CGRect(origin: .zero, size: image.size))
            let result = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return result
        }
    }
    
}
