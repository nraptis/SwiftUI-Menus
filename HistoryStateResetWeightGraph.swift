//
//  HistoryStateResetWeightGraph.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/17/24.
//

import Foundation

class HistoryStateResetWeightGraph: HistoryState {
    
    struct StorageNode {
        let startHeightManual: Bool
        let startHeightFactor: Float
        let startTangentManual: Bool
        let startDirection: Float
        let startMagnitudeIn: Float
        let startMagnitudeOut: Float
    }
    
    let jiggleIndex: Int
    let storageNodes: [StorageNode]
    required init(jiggleIndex: Int,
                  storageNodes: [StorageNode]) {
        self.jiggleIndex = jiggleIndex
        self.storageNodes = storageNodes
        super.init(.resetWeightGraph)
    }
    
    deinit {
        if ApplicationController.DEBUG_DEALLOCS {
            print("[--] HistoryStateResetWeightGraph")
        }
    }
    
    override func getWorldConfiguration() -> HistoryWorldConfiguration {
        let result = HistoryWorldConfiguration(documentMode: .edit,
                                               editModeType: .dontCare,
                                               weightModeType: .dontCare,
                                               graphType: .forceEnter,
                                               guidesType: .forceEnter,
                                               phoneExpandedTopType: .forceEnter,
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
