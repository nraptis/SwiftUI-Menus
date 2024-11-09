//
//  HistoryStateCreateJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

class HistoryStateCreateJiggle: HistoryState {
    
    let fileBuffer = FileBuffer()
    convenience init(fileBuffer: FileBuffer) {
        self.init()
        self.fileBuffer.copy(fileBuffer: fileBuffer)
        //jiggle.save(fileBuffer: fileBuffer)
    }
    
    required init() {
        super.init(.createJiggle)
    }
    
    override func readReset() {
        fileBuffer.readReset()
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateCreateJiggle")
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
