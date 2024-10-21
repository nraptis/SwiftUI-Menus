//
//  ToolInterfaceViewModel+NodeGeneration+ExitModes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_ExitMode(_ inr: INR_ExitMode,
                                          neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .guides:
            return ToolInterfaceFactory.getGuidesExitModeToolNode(orientation: orientation,
                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                  neighborTypeRight: neighborTypeRight)
        case .graph:
            return ToolInterfaceFactory.getGraphExitModeToolNode(orientation: orientation,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
        case .zoom:
            return ToolInterfaceFactory.getZoomExitModeToolNode(orientation: orientation,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        case .videoRecord:
            return ToolInterfaceFactory.getVideoRecordExitModeToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .videoExport:
            return ToolInterfaceFactory.getVideoExportExitModeToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .animationLoops:
            return ToolInterfaceFactory.getAnimationLoopsExitModeToolNode(orientation: orientation,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
        case .animationContinuous:
            return ToolInterfaceFactory.getAnimationContinuousExitModeToolNode(orientation: orientation,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
        case .timeLine:
            return ToolInterfaceFactory.getTimeLineExitModeToolNode(orientation: orientation,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        case .timeLinePage2:
            return ToolInterfaceFactory.getTimeLinePage2ExitModeToolNode(orientation: orientation,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        case .loopsPage2:
            return ToolInterfaceFactory.getLoopsPage2ExitModeToolNode(orientation: orientation,
                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                      neighborTypeRight: neighborTypeRight)
        case .loopsPage3:
            return ToolInterfaceFactory.getLoopsPage3ExitModeToolNode(orientation: orientation,
                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                      neighborTypeRight: neighborTypeRight)
        }
    }
}
