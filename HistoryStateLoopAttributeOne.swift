//
//  HistoryStateLoopAttributeSingle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/3/24.
//

import Foundation

class HistoryStateLoopAttributeOne: HistoryState {
    
    let jiggleIndex: Int
    let startAttribute: LoopAttribute
    let endAttribute: LoopAttribute
    init(jiggleIndex: Int,
         startAttribute: LoopAttribute,
         endAttribute: LoopAttribute) {
        self.jiggleIndex = jiggleIndex
        self.startAttribute = startAttribute
        self.endAttribute = endAttribute
        super.init(.loopAttributeOne)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateLoopAttributeOne")
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
                                               timeLineType: .forceEnter,
                                               animationLoopType: .forceEnter,
                                               animationContinuousType: .dontCare,
                                               animationLoopsPageType: .dontCare,
                                               animationTimeLinePageType: .forcePage1,
                                               animationContinuousPageType: .dontCare)
        return result
        
        /*
        switch startAttribute.loopAttributeType {
        case .timeLineFrameOffset, .timeLineDuration:
            let result = HistoryWorldConfiguration(documentMode: .view,
                                                   editModeType: .dontCare,
                                                   weightModeType: .dontCare,
                                                   graphType: .dontCare,
                                                   guidesType: .dontCare,
                                                   phoneExpandedTopType: .dontCare,
                                                   phoneExpandedBottomType: .dontCare,
                                                   timeLineType: .forceLeave,
                                                   animationLoopType: .forceEnter,
                                                   animationContinuousType: .dontCare,
                                                   animationLoopsPageType: .dontCare,
                                                   animationTimeLinePageType: .dontCare,
                                                   animationContinuousPageType: .dontCare)
            return result
        default:
            let result = HistoryWorldConfiguration(documentMode: .view,
                                                   editModeType: .dontCare,
                                                   weightModeType: .dontCare,
                                                   graphType: .dontCare,
                                                   guidesType: .dontCare,
                                                   phoneExpandedTopType: .dontCare,
                                                   phoneExpandedBottomType: .dontCare,
                                                   timeLineType: .forceEnter,
                                                   animationLoopType: .forceEnter,
                                                   animationContinuousType: .dontCare,
                                                   animationLoopsPageType: .dontCare,
                                                   animationTimeLinePageType: .dontCare,
                                                   animationContinuousPageType: .dontCare)
            return result
        }
        */
        
        
    }
}
