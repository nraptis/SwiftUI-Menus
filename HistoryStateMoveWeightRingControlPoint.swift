//
//  HistoryStateMoveGuideControlPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/15/24.
//

import Foundation

class HistoryStateMoveGuideControlPoint: HistoryState {
    
    let jiggleIndex: Int
    let weightCurveIndex: Int
    let guideControlPointIndex: Int
    let startPoint: Point
    let endPoint: Point
    init(jiggleIndex: Int,
         weightCurveIndex: Int,
         guideControlPointIndex: Int,
         startPoint: Point,
         endPoint: Point) {
        self.jiggleIndex = jiggleIndex
        self.weightCurveIndex = weightCurveIndex
        self.guideControlPointIndex = guideControlPointIndex
        self.startPoint = startPoint
        self.endPoint = endPoint
        super.init(.moveGuideControlPoint)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateMoveGuideControlPoint")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .dontCare,
                                               weightModeType: .forceEnter(.points),
                                               graphType: .dontCare,
                                               guidesType: .forceEnter,
                                               phoneExpandedTopType: .dontCare,
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
