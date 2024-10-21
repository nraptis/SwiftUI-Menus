//
//  ToolInterfaceViewModel+NodeGeneration+EnterModes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_EnterMode(_ inr: INR_EnterMode,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        switch inr {
        case .guides:
            return ToolInterfaceFactory.getGuidesEnterModeToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        case .graph:
            return ToolInterfaceFactory.getGraphEnterModeToolNode(orientation: orientation,
                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                  neighborTypeRight: neighborTypeRight)
        case .zoom:
            return ToolInterfaceFactory.getZoomEnterModeToolNode(orientation: orientation,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
        case .videoRecord:
            return ToolInterfaceFactory.getVideoRecordEnterModeToolNode(orientation: orientation,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        case .videoExport:
            return ToolInterfaceFactory.getVideoExportEnterModeToolNode(orientation: orientation,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        case .animationLoops:
            return ToolInterfaceFactory.getAnimationLoopsEnterModeToolNode(orientation: orientation,
                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                           neighborTypeRight: neighborTypeRight)
        case .animationContinuous:
            return ToolInterfaceFactory.getAnimationContinuousEnterModeToolNode(orientation: orientation,
                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                neighborTypeRight: neighborTypeRight)
        case .timeLine:
            return ToolInterfaceFactory.getTimeLineEnterModeToolNode(orientation: orientation,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        case .timeLinePage2:
            return ToolInterfaceFactory.getTimeLinePage2EnterModeToolNode(orientation: orientation,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
        case .loopsPage1:
            return ToolInterfaceFactory.getLoopsPage1EnterModeToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .loopsPage2:
            return ToolInterfaceFactory.getLoopsPage2EnterModeToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .loopsPage3:
            return ToolInterfaceFactory.getLoopsPage3EnterModeToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        }
    }
}
