//
//  RingBuilderView+Color.swift
//  Manifold
//
//  Created by Nicky Taylor on 8/3/24.
//

import Foundation
import UIKit

extension RingBuilderRingView {
    
    static var redOuter = CGFloat(1.0)
    static var greenOuter = CGFloat(1.0)
    static var blueOuter = CGFloat(1.0)
    
    static var redInner = CGFloat(0.941176470588235)
    static var greenInner = CGFloat(0.945098039215686)
    static var blueInner = CGFloat(0.070588235294118)
    
    func strokeColor() -> UIColor {
        UIColor(red: CGFloat(0.44),
                green: CGFloat(0.44),
                blue: CGFloat(0.44),
                alpha: 1.0)
    }
    
    func fillColor() -> UIColor {
        
        let redOuter = Self.redOuter
        let greenOuter = Self.greenOuter
        let blueOuter = Self.blueOuter
        
        return UIColor(red: CGFloat(redOuter),
                       green: CGFloat(greenOuter),
                       blue: CGFloat(blueOuter),
                       alpha: 1.0)
    }
    
    func fillColor(index: Int) -> UIColor {
        
        let numberOfRings = ringBuilderWidget.numberOfRings
        
        let red: CGFloat
        let green: CGFloat
        let blue: CGFloat
        
        let redOuter = Self.redOuter
        let greenOuter = Self.greenOuter
        let blueOuter = Self.blueOuter
        
        let redInner = Self.redInner
        let greenInner = Self.greenInner
        let blueInner = Self.blueInner
        
        var percent = CGFloat(1.0)
        if numberOfRings > 0 {
            percent = CGFloat(index) / CGFloat(numberOfRings)
        }
        
        red = redOuter + (redInner - redOuter) * (1.0 - percent)
        green = greenOuter + (greenInner - greenOuter) * (1.0 - percent)
        blue = blueOuter + (blueInner - blueOuter) * (1.0 - percent)
        
        return UIColor(red: red,
                       green: green,
                       blue: blue,
                       alpha: 1.0)
    }
}
