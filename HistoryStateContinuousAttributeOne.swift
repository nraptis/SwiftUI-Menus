//
//  HistoryStateContinuousAttributeOne.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/5/24.
//

import Foundation

class HistoryStateContinuousAttributeOne: HistoryState {
    
    let jiggleIndex: Int
    let startAttribute: ContinuousAttribute
    let endAttribute: ContinuousAttribute
    init(jiggleIndex: Int,
         startAttribute: ContinuousAttribute,
         endAttribute: ContinuousAttribute) {
        self.jiggleIndex = jiggleIndex
        self.startAttribute = startAttribute
        self.endAttribute = endAttribute
        super.init(.continuousAttributeOne)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateContinuousAttributeOne")
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

