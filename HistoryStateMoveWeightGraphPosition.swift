//
//  HistoryStateMoveWeightGraphPosition.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/16/24.
//

import Foundation

class HistoryStateMoveWeightGraphPosition: HistoryState {
    
    let jiggleIndex: Int
    
    let isFirstControlPoint: Bool
    let isLastControlPoint: Bool
    let guideIndex: Int
    
    let startHeightManual: Bool
    let startHeightFactor: Float
    let endHeightFactor: Float
    
    init(jiggleIndex: Int,
         isFirstControlPoint: Bool,
         isLastControlPoint: Bool,
         guideIndex: Int,
         startHeightManual: Bool,
         startHeightFactor: Float,
         endHeightFactor: Float) {
        self.jiggleIndex = jiggleIndex
        self.isFirstControlPoint = isFirstControlPoint
        self.isLastControlPoint = isLastControlPoint
        self.guideIndex = guideIndex
        self.startHeightManual = startHeightManual
        self.startHeightFactor = startHeightFactor
        self.endHeightFactor = endHeightFactor
        super.init(.moveWeightGraphPosition)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateDeleteGuideControlPoint")
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
