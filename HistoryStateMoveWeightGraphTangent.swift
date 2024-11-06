//
//  HistoryStateMoveWeightGraphTangent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/16/24.
//

import Foundation

class HistoryStateMoveWeightGraphTangent: HistoryState {
    
    let jiggleIndex: Int
    let isFirstControlPoint: Bool
    let isLastControlPoint: Bool
    let guideIndex: Int
    let tanType: JiggleDocument.TanType
    let startTangentManual: Bool
    let startDirection: Float
    let startMagnitudeIn: Float
    let startMagnitudeOut: Float
    let endDirection: Float
    let endMagnitudeIn: Float
    let endMagnitudeOut: Float
    
    init(jiggleIndex: Int,
         isFirstControlPoint: Bool,
         isLastControlPoint: Bool,
         guideIndex: Int,
         tanType: JiggleDocument.TanType,
         startTangentManual: Bool,
         startDirection: Float,
         startMagnitudeIn: Float,
         startMagnitudeOut: Float,
         endDirection: Float,
         endMagnitudeIn: Float,
         endMagnitudeOut: Float) {
        
        self.jiggleIndex = jiggleIndex
        
        self.isFirstControlPoint = isFirstControlPoint
        self.isLastControlPoint = isLastControlPoint
        self.guideIndex = guideIndex
        
        self.tanType = tanType
        
        self.startTangentManual = startTangentManual
        
        self.startDirection = startDirection
        self.startMagnitudeIn = startMagnitudeIn
        self.startMagnitudeOut = startMagnitudeOut
        
        self.endDirection = endDirection
        self.endMagnitudeIn = endMagnitudeIn
        self.endMagnitudeOut = endMagnitudeOut
        
        super.init(.moveWeightGraphTangent)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateMoveWeightGraphTangent")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .dontCare,
                                               weightModeType: .dontCare,
                                               graphType: .forceEnter,
                                               guidesType: .forceEnter,
                                               phoneExpandedTopType: .forceEnter,
                                               phoneExpandedBottomType: .dontCare,
                                               timeLineType: .dontCare,
                                               animationLoopType: .dontCare,
                                               animationContinuousType: .dontCare,
                                               animationLoopsPageType: .dontCare,
                                               animationTimeLinePageType: .dontCare,
                                               animationContinuousPageType: .dontCare)
        return result
    }
}
