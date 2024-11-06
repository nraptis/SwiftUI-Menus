//
//  HistoryStateDeleteGuideControlPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/15/24.
//

import Foundation

class HistoryStateDeleteGuideControlPoint: HistoryState {
    
    let jiggleIndex: Int
    let weightCurveIndex: Int
    let guideControlPointIndex: Int
    let point: Point
    init(jiggleIndex: Int,
         weightCurveIndex: Int,
         guideControlPointIndex: Int,
         point: Point) {
        self.jiggleIndex = jiggleIndex
        self.weightCurveIndex = weightCurveIndex
        self.guideControlPointIndex = guideControlPointIndex
        self.point = point
        super.init(.removeGuideControlPoint)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateDeleteGuideControlPoint")
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
