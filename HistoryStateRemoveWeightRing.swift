//
//  HistoryStateDeleteGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/14/24.
//

import Foundation

class HistoryStateDeleteGuide: HistoryState {
    
    
    let jiggleIndex: Int
    let weightCurveIndex: Int
    let fileBuffer = FileBuffer()
    convenience init(jiggleIndex: Int,
                     weightCurveIndex: Int,
                     guide: Guide) {
        self.init(jiggleIndex: jiggleIndex,
                  weightCurveIndex: weightCurveIndex)
        guide.save(fileBuffer: fileBuffer)
    }
    
    required init(jiggleIndex: Int,
                  weightCurveIndex: Int) {
        self.jiggleIndex = jiggleIndex
        self.weightCurveIndex = weightCurveIndex
        super.init(.removeGuide)
    }
    
    override func readReset() {
        fileBuffer.readReset()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateDeleteGuide")
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
