//
//  HistoryStateCreateControlPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/13/24.
//

import Foundation

class HistoryStateCreateControlPoint: HistoryState {
    
    let jiggleIndex: Int
    let controlPointIndex: Int
    let point: Point
    init(jiggleIndex: Int,
         controlPointIndex: Int,
         point: Point) {
        self.jiggleIndex = jiggleIndex
        self.controlPointIndex = controlPointIndex
        self.point = point
        super.init(.createControlPoint)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateCreateControlPoint")
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
