//
//  HistoryStateRemoveJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

class HistoryStateRemoveJiggle: HistoryState {
    
    let fileBuffer = FileBuffer()
    let jiggleIndex: Int
    convenience init(jiggle: Jiggle, jiggleIndex: Int) {
        self.init(jiggleIndex: jiggleIndex)
        jiggle.save(fileBuffer: fileBuffer)
    }
    
    required init(jiggleIndex: Int) {
        self.jiggleIndex = jiggleIndex
        super.init(.removeJiggle)
    }
    
    override func readReset() {
        fileBuffer.readReset()
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
