//
//  HistoryStateCreateGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/14/24.
//

import Foundation

class HistoryStateCreateGuide: HistoryState {
    
    let jiggleIndex: Int
    let fileBuffer = FileBuffer()
    convenience init(jiggleIndex: Int,
                     guide: Guide) {
        self.init(jiggleIndex: jiggleIndex)
        guide.save(fileBuffer: fileBuffer)
    }
    
    required init(jiggleIndex: Int) {
        self.jiggleIndex = jiggleIndex
        super.init(.createGuide)
    }
    
    override func readReset() {
        fileBuffer.readReset()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateCreateGuide")
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
