//
//  HistoryStateJiggleSpeed.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/9/24.
//

import Foundation

class HistoryStateJiggleSpeed: HistoryState {
    
    let selectedJiggleIndex: Int
    let valueNodes: [HistorySingleJiggleValueNode]
    init(selectedJiggleIndex: Int,
         valueNodes: [HistorySingleJiggleValueNode]) {
        self.selectedJiggleIndex = selectedJiggleIndex
        self.valueNodes = valueNodes
        super.init(.jiggleSpeed)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateRemoveJiggle")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .view,
                                               editModeType: .dontCare,
                                               weightModeType: .dontCare,
                                               graphType: .dontCare,
                                               guidesType: .forceEnter,
                                               phoneExpandedTopType: .dontCare,
                                               phoneExpandedBottomType: .dontCare,
                                               timeLineType: .forceLeave,
                                               animationLoopType: .forceLeave,
                                               animationContinuousType: .dontCare,
                                               animationLoopsPageType: .dontCare,
                                               animationTimeLinePageType: .dontCare,
                                               animationContinuousPageType: .dontCare)
        return result
    }
}
