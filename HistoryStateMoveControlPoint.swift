//
//  HistoryStateMoveControlPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/10/24.
//

import Foundation

class HistoryStateMoveControlPoint: HistoryState {
    
    let jiggleIndex: Int
    let controlPointIndex: Int
    let startPoint: Point
    let endPoint: Point
    init(jiggleIndex: Int,
         controlPointIndex: Int,
         startPoint: Point,
         endPoint: Point) {
        self.jiggleIndex = jiggleIndex
        self.controlPointIndex = controlPointIndex
        self.startPoint = startPoint
        self.endPoint = endPoint
        super.init(.moveControlPoint)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateMoveControlPoint")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .forceEnter(.points),
                                               weightModeType: .dontCare,
                                               graphType: .dontCare,
                                               guidesType: .forceLeave,
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
