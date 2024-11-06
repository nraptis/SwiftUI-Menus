//
//  HistoryStateMoveWeightCenter.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/19/24.
//

import Foundation

class HistoryStateMoveWeightCenter: HistoryState {
    
    let jiggleIndex: Int
    let startCenter: Point
    let endCenter: Point
    init(jiggleIndex: Int,
         startCenter: Point,
         endCenter: Point) {
        self.jiggleIndex = jiggleIndex
        self.startCenter = startCenter
        self.endCenter = endCenter
        super.init(.moveWeightCenter)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateMoveWeightCenter")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .dontCare,
                                               weightModeType: .dontCare,
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
