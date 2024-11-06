//
//  HistoryStateTransformJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

class HistoryStateTransformJiggle: HistoryState {
    
    let jiggleIndex: Int
    let startCenter: Point
    let startScale: Float
    let startRotation: Float
    let endCenter: Point
    let endScale: Float
    let endRotation: Float
    init(jiggleIndex: Int,
         startCenter: Point, startScale: Float, startRotation: Float,
         endCenter: Point, endScale: Float, endRotation: Float) {
        self.jiggleIndex = jiggleIndex
        self.startCenter = startCenter
        self.startScale = startScale
        self.startRotation = startRotation
        self.endCenter = endCenter
        self.endScale = endScale
        self.endRotation = endRotation
        super.init(.transformJiggle)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateRemoveJiggle")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .forceEnter(.jiggles),
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
