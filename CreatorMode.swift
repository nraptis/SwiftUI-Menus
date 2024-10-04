//
//  CreatorMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/4/24.
//

import Foundation

enum CreatorMode: UInt8 {
    
    case none
    
    case makeJiggle
    case drawJiggle
    
    case addJigglePoint
    case removeJigglePoint
    
    case makeGuide
    case drawGuide
    
    case addGuidePoint
    case removeGuidePoint
    
    case moveJiggleCenter
    case moveGuideCenter
}
