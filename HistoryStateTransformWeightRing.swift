//
//  HistoryStateTransformGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/15/24.
//

import Foundation

class HistoryStateTransformGuide: HistoryState {
    
    let jiggleIndex: Int
    let weightCurveIndex: Int
    let startCenter: Point
    let startScale: Float
    let startRotation: Float
    let endCenter: Point
    let endScale: Float
    let endRotation: Float
    init(jiggleIndex: Int,
         weightCurveIndex: Int,
         startCenter: Point, startScale: Float, startRotation: Float,
         endCenter: Point, endScale: Float, endRotation: Float) {
        self.jiggleIndex = jiggleIndex
        self.weightCurveIndex = weightCurveIndex
        self.startCenter = startCenter
        self.startScale = startScale
        self.startRotation = startRotation
        self.endCenter = endCenter
        self.endScale = endScale
        self.endRotation = endRotation
        super.init(.transformGuide)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateRemoveJiggle")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .dontCare,
                                               weightModeType: .forceEnter(.guides),
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
