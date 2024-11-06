//
//  HistoryStateRotateOrFlipJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/8/24.
//

import Foundation

class HistoryStateRotateOrFlipJiggle: HistoryState {
    
    let fileBufferBefore: FileBuffer
    let fileBufferAfter: FileBuffer
    let jiggleIndex: Int

    required init(jiggleIndex: Int,
                  fileBufferBefore: FileBuffer,
                  fileBufferAfter: FileBuffer) {
        self.jiggleIndex = jiggleIndex
        self.fileBufferBefore = fileBufferBefore
        self.fileBufferAfter = fileBufferAfter
        super.init(.rotateOrFlipJiggle)
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
