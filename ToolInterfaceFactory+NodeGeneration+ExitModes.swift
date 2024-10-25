//
//  ToolInterfaceViewModel+NodeGeneration+ExitModes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_ExitMode(orientation: Orientation,
                                      inr: INR_ExitMode,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .guides:
            return getGuidesExitModeToolNode(orientation: orientation,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        case .graph:
            return getGraphExitModeToolNode(orientation: orientation,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        case .zoom:
            return getZoomExitModeToolNode(orientation: orientation,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        case .videoRecord:
            return getVideoRecordExitModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .videoExport:
            return getVideoExportExitModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .animationLoops:
            return getAnimationLoopsExitModeToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .animationContinuous:
            return getAnimationContinuousExitModeToolNode(orientation: orientation,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        case .timeLine:
            return getTimeLineExitModeToolNode(orientation: orientation,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        case .timeLinePage2:
            return getTimeLinePage2ExitModeToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .graphPage2:
            return getGraphPage2ExitModeToolNode(orientation: orientation,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        case .animationContinuousPage2:
            return getAnimationContinuousPage2ExitModeToolNode(orientation: orientation,
                                                               neighborTypeLeft: neighborTypeLeft,
                                                               neighborTypeRight: neighborTypeRight)
        case .loopsPage1:
            return getLoopsPage1ExitModeToolNode(orientation: orientation,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        case .loopsPage2:
            return getLoopsPage2ExitModeToolNode(orientation: orientation,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        case .loopsPage3:
            return getLoopsPage3ExitModeToolNode(orientation: orientation,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        }
    }
}
