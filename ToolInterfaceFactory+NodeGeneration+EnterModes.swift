//
//  ToolInterfaceViewModel+NodeGeneration+EnterModes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_EnterMode(orientation: Orientation,
                                       inr: INR_EnterMode,
                                       neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        switch inr {
        case .guides:
            return getGuidesEnterModeToolNode(orientation: orientation,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        case .graph:
            return getGraphEnterModeToolNode(orientation: orientation,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        case .zoom:
            return getZoomEnterModeToolNode(orientation: orientation,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        case .videoRecord:
            return getVideoRecordEnterModeToolNode(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        case .videoExport:
            return getVideoExportEnterModeToolNode(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        case .animationLoops:
            return getAnimationLoopsEnterModeToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        case .animationContinuous:
            return getAnimationContinuousEnterModeToolNode(orientation: orientation,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        case .timeLine:
            return getTimeLineEnterModeToolNode(orientation: orientation,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
            
        case .loopsPage1:
            return getLoopsPage1EnterModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .loopsPage2:
            return getLoopsPage2EnterModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .loopsPage3:
            return getLoopsPage3EnterModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
            
        case .timeLinePage1:
            return getTimeLinePage1EnterModeToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .timeLinePage2:
            return getTimeLinePage2EnterModeToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .timeLinePage3:
            return getTimeLinePage3EnterModeToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
            
        case .continuousPage1:
            return getContinuousPage1EnterModeToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .continuousPage2:
            return getContinuousPage2EnterModeToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .continuousPage3:
            return getContinuousPage3EnterModeToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .graphPage1:
            return getGraphPage1EnterModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .graphPage2:
            return getGraphPage2EnterModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .graphPage3:
            return getGraphPage3EnterModeToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        }
    }
}
