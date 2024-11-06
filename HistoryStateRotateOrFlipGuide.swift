//
//  HistoryStateRotateOrFlipGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/8/24.
//

import Foundation

class HistoryStateRotateOrFlipGuide: HistoryState {
    
    let fileBufferBefore: FileBuffer
    let fileBufferAfter: FileBuffer
    let jiggleIndex: Int
    let guideIndex: Int
    required init(jiggleIndex: Int,
                  guideIndex: Int,
                  fileBufferBefore: FileBuffer,
                  fileBufferAfter: FileBuffer) {
        self.jiggleIndex = jiggleIndex
        self.guideIndex = guideIndex
        self.fileBufferBefore = fileBufferBefore
        self.fileBufferAfter = fileBufferAfter
        super.init(.rotateOrFlipGuide)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateRotateOrFlipJiggle")
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
