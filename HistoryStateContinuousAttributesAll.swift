//
//  HistoryStateContinuousAttributesAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/5/24.
//

import Foundation

class HistoryStateContinuousAttributesAll: HistoryState {
    
    let jiggleIndex: Int
    let startAttributes: [ContinuousAttribute]
    let endAttributes: [ContinuousAttribute]
    init(jiggleIndex: Int,
         startAttributes: [ContinuousAttribute],
         endAttributes: [ContinuousAttribute]) {
        self.jiggleIndex = jiggleIndex
        self.startAttributes = startAttributes
        self.endAttributes = endAttributes
        super.init(.continuousAttributesAll)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateContinuousAttributesAll")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        
        let result = HistoryWorldConfiguration(documentMode: .view,
                                               editModeType: .dontCare,
                                               weightModeType: .dontCare,
                                               graphType: .dontCare,
                                               guidesType: .dontCare,
                                               phoneExpandedTopType: .dontCare,
                                               phoneExpandedBottomType: .dontCare,
                                               timeLineType: .dontCare,
                                               animationLoopType: .forceLeave,
                                               animationContinuousType: .forceEnter,
                                               animationLoopsPageType: .dontCare,
                                               animationTimeLinePageType: .forcePage1,
                                               animationContinuousPageType: .dontCare)
        return result
    }
}
