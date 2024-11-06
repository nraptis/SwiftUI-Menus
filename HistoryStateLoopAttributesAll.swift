//
//  HistoryStateLoopAttributesAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/3/24.
//

import Foundation

class HistoryStateLoopAttributesAll: HistoryState {
    
    let jiggleIndex: Int
    let startAttributes: [LoopAttribute]
    let endAttributes: [LoopAttribute]
    init(jiggleIndex: Int,
         startAttributes: [LoopAttribute],
         endAttributes: [LoopAttribute]) {
        self.jiggleIndex = jiggleIndex
        self.startAttributes = startAttributes
        self.endAttributes = endAttributes
        super.init(.loopAttributesAll)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateLoopAttributesAll")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        
        /*
        if startAttributes.count > 0 {
            switch startAttributes[0].loopAttributeType {
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
        }
        */
        
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
