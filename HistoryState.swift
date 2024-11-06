//
//  HistoryState.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

enum HistoryStateType {
    
    case rotateOrFlipJiggle
    case rotateOrFlipGuide
    
    case createJiggle
    case removeJiggle
    case transformJiggle
    case moveControlPoint
    case createControlPoint
    case removeControlPoint
    
    case createGuide
    case removeGuide
    case transformGuide
    
    case moveGuideControlPoint
    case createGuideControlPoint
    case removeGuideControlPoint
    
    case moveWeightCenter
    case moveJiggleCenter
    
    
    //case createGuideControlPoint
    //case removeGuideControlPoint
    
    case moveWeightGraphPosition
    case moveWeightGraphTangent
    
    case resetWeightGraph
    
    // Timeline, animation, etc
    case jiggleSpeed
    case jiggleDampen
    case gyroPower
    
    case loopAttributeOne
    case loopAttributesAll
    
    case continuousAttributeOne
    case continuousAttributesAll
    
}

class HistoryState {
    
    typealias Point = Math.Point
    
    let historyStateType: HistoryStateType
    init(_ historyStateType: HistoryStateType) {
        self.historyStateType = historyStateType
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryState")
        }
    }
    
    func readReset() {
        print("Read Reset [Blank]")
    }
    
    func getWorldConfiguration() -> HistoryWorldConfiguration {
        fatalError("This should always be overridden")
    }
    
}
