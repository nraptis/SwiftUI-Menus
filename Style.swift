//
//  Style.swift
//  Bounce
//
//  Created by Raptis, Nicholas on 8/24/16.
//  Copyright © 2016 Darkswarm LLC. All rights reserved.
//

import UIKit
import SwiftUI

class Style {
    
    static func checkMark(width: CGFloat, height: CGFloat) -> Path {
        
        var path = Path()
        var points = [CGPoint]()
        
        points.append(CGPoint(x: 0.39 * width, y: 0.55 * height))
        points.append(CGPoint(x: 0.41 * width, y: 0.55 * height))
        points.append(CGPoint(x: 0.78 * width, y: 0.18 * height))
        points.append(CGPoint(x: 0.81 * width, y: 0.18 * height))
        
        points.append(CGPoint(x: 0.91 * width, y: 0.28 * height))
        points.append(CGPoint(x: 0.91 * width, y: 0.31 * height))
        
        points.append(CGPoint(x: 0.41 * width, y: 0.81 * height))
        points.append(CGPoint(x: 0.39 * width, y: 0.81 * height))
        
        points.append(CGPoint(x: 0.08 * width, y: 0.50 * height))
        points.append(CGPoint(x: 0.08 * width, y: 0.47 * height))
        
        
        points.append(CGPoint(x: 0.18 * width, y: 0.37 * height))
        points.append(CGPoint(x: 0.21 * width, y: 0.37 * height))

        for pointIndex in 0..<points.count {
            let point = points[pointIndex]
            if pointIndex == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        return path
    }
    
    static func checkMarkStroke(width: CGFloat, height: CGFloat) -> Path {
        
        var path = Path()
        var points = [CGPoint]()
        
        points.append(CGPoint(x: 0.39 * width, y: 0.52 * height))
        points.append(CGPoint(x: 0.41 * width, y: 0.52 * height))
        points.append(CGPoint(x: 0.77 * width, y: 0.16 * height))
        points.append(CGPoint(x: 0.82 * width, y: 0.16 * height))
        points.append(CGPoint(x: 0.93 * width, y: 0.27 * height))
        points.append(CGPoint(x: 0.93 * width, y: 0.32 * height))
        points.append(CGPoint(x: 0.42 * width, y: 0.83 * height))
        points.append(CGPoint(x: 0.38 * width, y: 0.83 * height))
        points.append(CGPoint(x: 0.06 * width, y: 0.51 * height))
        points.append(CGPoint(x: 0.06 * width, y: 0.46 * height))
        points.append(CGPoint(x: 0.17 * width, y: 0.35 * height))
        points.append(CGPoint(x: 0.22 * width, y: 0.35 * height))
        

        for pointIndex in 0..<points.count {
            let point = points[pointIndex]
            if pointIndex == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        return path
    }
    
    static func checkMarkFat(width: CGFloat, height: CGFloat) -> Path {
        
        var path = Path()
        var points = [CGPoint]()
        
        points.append(CGPoint(x: 0.41 * width, y: 0.54 * height))
        points.append(CGPoint(x: 0.43 * width, y: 0.54 * height))
        points.append(CGPoint(x: 0.72 * width, y: 0.25 * height))
        points.append(CGPoint(x: 0.75 * width, y: 0.25 * height))
        points.append(CGPoint(x: 0.86 * width, y: 0.36 * height))
        points.append(CGPoint(x: 0.86 * width, y: 0.39 * height))
        points.append(CGPoint(x: 0.44 * width, y: 0.81 * height))
        points.append(CGPoint(x: 0.40 * width, y: 0.81 * height))
        points.append(CGPoint(x: 0.13 * width, y: 0.54 * height))
        points.append(CGPoint(x: 0.13 * width, y: 0.51 * height))
        points.append(CGPoint(x: 0.24 * width, y: 0.40 * height))
        points.append(CGPoint(x: 0.27 * width, y: 0.40 * height))
        
        for pointIndex in 0..<points.count {
            let point = points[pointIndex]
            if pointIndex == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        return path
    }
    
    static func path(fromPoints points: inout [CGPoint], inRect rect: CGRect) -> Path {
        var path = Path()
        for i in 0..<points.count {
            var point = CGPoint(x: points[i].x, y: points[i].y)
            point.x = rect.origin.x + rect.size.width * (point.x)
            point.y = rect.origin.y + rect.size.height * (point.y)
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        return path
    }
    
    static func setSymbolBackspacer(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.53, y: 0.66))
        points.append(CGPoint(x: 0.53, y: 0.69))
        points.append(CGPoint(x: 0.26, y: 0.69))
        points.append(CGPoint(x: 0.08, y: 0.51))
        points.append(CGPoint(x: 0.08, y: 0.49))
        points.append(CGPoint(x: 0.26, y: 0.31))
        points.append(CGPoint(x: 0.79, y: 0.31))
        points.append(CGPoint(x: 0.82, y: 0.34))
        points.append(CGPoint(x: 0.82, y: 0.66))
        points.append(CGPoint(x: 0.79, y: 0.69))
        points.append(CGPoint(x: 0.53, y: 0.69))
        points.append(CGPoint(x: 0.53, y: 0.66))
        points.append(CGPoint(x: 0.76, y: 0.66))
        points.append(CGPoint(x: 0.78, y: 0.63))
        points.append(CGPoint(x: 0.78, y: 0.37))
        points.append(CGPoint(x: 0.76, y: 0.35))
        points.append(CGPoint(x: 0.29, y: 0.35))
        points.append(CGPoint(x: 0.27, y: 0.37))
        points.append(CGPoint(x: 0.27, y: 0.63))
        points.append(CGPoint(x: 0.29, y: 0.66))
    }
    
    static func setSymbolCloseX(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.50, y: 0.38))
        points.append(CGPoint(x: 0.77, y: 0.11))
        points.append(CGPoint(x: 0.80, y: 0.11))
        points.append(CGPoint(x: 0.89, y: 0.20))
        points.append(CGPoint(x: 0.89, y: 0.23))
        points.append(CGPoint(x: 0.62, y: 0.50))
        points.append(CGPoint(x: 0.89, y: 0.77))
        points.append(CGPoint(x: 0.89, y: 0.80))
        points.append(CGPoint(x: 0.80, y: 0.89))
        points.append(CGPoint(x: 0.77, y: 0.89))
        points.append(CGPoint(x: 0.50, y: 0.62))
        points.append(CGPoint(x: 0.23, y: 0.89))
        points.append(CGPoint(x: 0.20, y: 0.89))
        points.append(CGPoint(x: 0.11, y: 0.80))
        points.append(CGPoint(x: 0.11, y: 0.77))
        points.append(CGPoint(x: 0.38, y: 0.50))
        points.append(CGPoint(x: 0.11, y: 0.23))
        points.append(CGPoint(x: 0.11, y: 0.20))
        points.append(CGPoint(x: 0.20, y: 0.11))
        points.append(CGPoint(x: 0.23, y: 0.11))
    }
    
    static func setSymbolThickX(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.50, y: 0.32))
        points.append(CGPoint(x: 0.74, y: 0.08))
        points.append(CGPoint(x: 0.77, y: 0.08))
        points.append(CGPoint(x: 0.92, y: 0.23))
        points.append(CGPoint(x: 0.92, y: 0.26))
        points.append(CGPoint(x: 0.68, y: 0.50))
        
        points.append(CGPoint(x: 0.92, y: 0.74))
        points.append(CGPoint(x: 0.92, y: 0.77))
        points.append(CGPoint(x: 0.77, y: 0.92))
        points.append(CGPoint(x: 0.74, y: 0.92))
        
        points.append(CGPoint(x: 0.50, y: 0.68))
        
        points.append(CGPoint(x: 0.26, y: 0.92))
        points.append(CGPoint(x: 0.23, y: 0.92))
        
        points.append(CGPoint(x: 0.08, y: 0.77))
        
        points.append(CGPoint(x: 0.08, y: 0.74))
        points.append(CGPoint(x: 0.32, y: 0.50))
        
        points.append(CGPoint(x: 0.08, y: 0.26))
        points.append(CGPoint(x: 0.08, y: 0.23))
        points.append(CGPoint(x: 0.23, y: 0.08))
        points.append(CGPoint(x: 0.26, y: 0.08))
    }
    
    static func setSymbolChevronLeft(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.21, y: 0.51))
        points.append(CGPoint(x: 0.21, y: 0.49))
        points.append(CGPoint(x: 0.56, y: 0.14))
        points.append(CGPoint(x: 0.59, y: 0.14))
        points.append(CGPoint(x: 0.68, y: 0.23))
        points.append(CGPoint(x: 0.68, y: 0.26))
        points.append(CGPoint(x: 0.44, y: 0.50))
        points.append(CGPoint(x: 0.68, y: 0.74))
        points.append(CGPoint(x: 0.68, y: 0.77))
        points.append(CGPoint(x: 0.59, y: 0.86))
        points.append(CGPoint(x: 0.56, y: 0.86))
    }
    
    static func setSymbolChevronDown(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.50, y: 0.56))
        points.append(CGPoint(x: 0.74, y: 0.32))
        points.append(CGPoint(x: 0.77, y: 0.32))
        points.append(CGPoint(x: 0.86, y: 0.41))
        points.append(CGPoint(x: 0.86, y: 0.44))
        points.append(CGPoint(x: 0.51, y: 0.79))
        points.append(CGPoint(x: 0.49, y: 0.79))
        points.append(CGPoint(x: 0.14, y: 0.44))
        points.append(CGPoint(x: 0.14, y: 0.41))
        points.append(CGPoint(x: 0.23, y: 0.32))
        points.append(CGPoint(x: 0.26, y: 0.32))
    }
    
    static func setSymbolChevronRight(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.41, y: 0.14))
        points.append(CGPoint(x: 0.44, y: 0.14))
        points.append(CGPoint(x: 0.79, y: 0.49))
        points.append(CGPoint(x: 0.79, y: 0.51))
        points.append(CGPoint(x: 0.44, y: 0.86))
        points.append(CGPoint(x: 0.41, y: 0.86))
        points.append(CGPoint(x: 0.32, y: 0.77))
        points.append(CGPoint(x: 0.32, y: 0.74))
        points.append(CGPoint(x: 0.56, y: 0.50))
        points.append(CGPoint(x: 0.32, y: 0.26))
        points.append(CGPoint(x: 0.32, y: 0.23))
    }
    
    static func setSymbolChevronUp(points: inout [CGPoint]) {
        points.removeAll()
        points.append(CGPoint(x: 0.49, y: 0.21))
        points.append(CGPoint(x: 0.51, y: 0.21))
        points.append(CGPoint(x: 0.86, y: 0.56))
        points.append(CGPoint(x: 0.86, y: 0.59))
        points.append(CGPoint(x: 0.77, y: 0.68))
        points.append(CGPoint(x: 0.74, y: 0.68))
        points.append(CGPoint(x: 0.50, y: 0.44))
        points.append(CGPoint(x: 0.26, y: 0.68))
        points.append(CGPoint(x: 0.23, y: 0.68))
        points.append(CGPoint(x: 0.14, y: 0.59))
        points.append(CGPoint(x: 0.14, y: 0.56))
    }
    
}
