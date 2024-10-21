//
//  ToolInterfaceViewModel+NodeGeneration+Buttons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_Button(_ inr: INR_Button,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .menu:
            return ToolInterfaceFactory.getMenuButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .undo:
            return ToolInterfaceFactory.getUndoButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .redo:
            return ToolInterfaceFactory.getRedoButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
            
        case .zoomReset:
            return ToolInterfaceFactory.getZoomResetButtonToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        case .zoomJiggle:
            return ToolInterfaceFactory.getZoomJiggleButtonToolNode(orientation: orientation,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        case .zoomIn:
            return ToolInterfaceFactory.getZoomInButtonToolNode(orientation: orientation,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        case .zoomOut:
            return ToolInterfaceFactory.getZoomOutButtonToolNode(orientation: orientation,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
            
        case .generateTopography:
            return ToolInterfaceFactory.getGenerateTopographyButtonToolNode(orientation: orientation,
                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                            neighborTypeRight: neighborTypeRight)
            
        case .flipJiggleHorizontal:
            return ToolInterfaceFactory.getFlipJiggleHorizontalButtonToolNode(orientation: orientation,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
            
        case .flipJiggleVertical:
            return ToolInterfaceFactory.getFlipJiggleVerticalButtonToolNode(orientation: orientation,
                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                            neighborTypeRight: neighborTypeRight)
        case .rotateJiggleLeft:
            return ToolInterfaceFactory.getRotateJiggleLeftButtonToolNode(orientation: orientation,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
        case .rotateJiggleRight:
            return ToolInterfaceFactory.getRotateJiggleRightButtonToolNode(orientation: orientation,
                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                           neighborTypeRight: neighborTypeRight)
        case .selectPreviousJiggle:
            return ToolInterfaceFactory.getSelectPreviousJiggleButtonToolNode(orientation: orientation,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        case .selectPreviousJigglePoint:
            return ToolInterfaceFactory.getSelectPreviousJigglePointButtonToolNode(orientation: orientation,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        case .selectNextJiggle:
            return ToolInterfaceFactory.getSelectNextJiggleButtonToolNode(orientation: orientation,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
        case .selectNextJigglePoint:
            return ToolInterfaceFactory.getSelectNextJigglePointButtonToolNode(orientation: orientation,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
        case .unfreezeJiggles:
            return ToolInterfaceFactory.getUnfreezeAllJigglesButtonToolNode(orientation: orientation,
                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                            neighborTypeRight: neighborTypeRight)
        case .freezeJiggle:
            return ToolInterfaceFactory.getFreezeSelectedJiggleButtonToolNode(orientation: orientation,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        case .cloneJiggle:
            return ToolInterfaceFactory.getCloneJiggleButtonToolNode(orientation: orientation,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        case .deleteJiggle:
            return ToolInterfaceFactory.getDeleteJiggleButtonToolNode(orientation: orientation,
                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                      neighborTypeRight: neighborTypeRight)
        case .deleteJigglePoint:
            return ToolInterfaceFactory.getDeleteJigglePointButtonToolNode(orientation: orientation,
                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                           neighborTypeRight: neighborTypeRight)
            
        case .flipGuideHorizontal:
            return ToolInterfaceFactory.getFlipGuideHorizontalButtonToolNode(orientation: orientation,
                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                             neighborTypeRight: neighborTypeRight)
        case .flipGuideVertical:
            return ToolInterfaceFactory.getFlipGuideVerticalButtonToolNode(orientation: orientation,
                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                           neighborTypeRight: neighborTypeRight)
        case .rotateGuideLeft:
            return ToolInterfaceFactory.getRotateGuideLeftButtonToolNode(orientation: orientation,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        case .rotateGuideRight:
            return ToolInterfaceFactory.getRotateGuideRightButtonToolNode(orientation: orientation,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
        case .selectPreviousGuide:
            return ToolInterfaceFactory.getSelectPreviousGuideButtonToolNode(orientation: orientation,
                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                             neighborTypeRight: neighborTypeRight)
        case .selectPreviousGuidePoint:
            return ToolInterfaceFactory.getSelectPreviousGuidePointButtonToolNode(orientation: orientation,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        case .selectNextGuide:
            return ToolInterfaceFactory.getSelectNextGuideButtonToolNode(orientation: orientation,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        case .selectNextGuidePoint:
            return ToolInterfaceFactory.getSelectNextGuidePointButtonToolNode(orientation: orientation,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        case .unfreezeGuides:
            return ToolInterfaceFactory.getUnfreezeAllGuidesButtonToolNode(orientation: orientation,
                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                           neighborTypeRight: neighborTypeRight)
        case .freezeGuide:
            return ToolInterfaceFactory.getFreezeSelectedGuideButtonToolNode(orientation: orientation,
                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                             neighborTypeRight: neighborTypeRight)
        case .cloneGuide:
            return ToolInterfaceFactory.getCloneGuideButtonToolNode(orientation: orientation,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        case .deleteGuide:
            return ToolInterfaceFactory.getDeleteGuideButtonToolNode(orientation: orientation,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        case .deleteGuidePoint:
            return ToolInterfaceFactory.getDeleteGuidePointButtonToolNode(orientation: orientation,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
            
        case .timeLineAmplify:
            return ToolInterfaceFactory.getTimeLineAmplifyButtonToolNode(orientation: orientation,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        case .timeLineDampen:
            return ToolInterfaceFactory.getTimeLineDampenButtonToolNode(orientation: orientation,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        case .timeLineInvertVertical:
            return ToolInterfaceFactory.getTimeLineInvertVerticalButtonToolNode(orientation: orientation,
                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                neighborTypeRight: neighborTypeRight)
        case .timeLineInvertHorizontal:
            return ToolInterfaceFactory.getTimeLineInvertHorizontalButtonToolNode(orientation: orientation,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        case .timeLineDupeDuration:
            return ToolInterfaceFactory.getTimeLineDupeDurationButtonToolNode(orientation: orientation,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        case .timeLineDupeCurrentChannel:
            return ToolInterfaceFactory.getTimeLineDupeCurrentChannelButtonToolNode(orientation: orientation,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        case .timeLineDupeAll:
            return ToolInterfaceFactory.getTimeLineDupeAllButtonToolNode(orientation: orientation,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        case .timeLineFlipAll:
            return ToolInterfaceFactory.getTimeLineFlipAllButtonToolNode(orientation: orientation,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        case .timeLineResetDefaultCurrentChannel:
            return ToolInterfaceFactory.getTimeLineResetDefaultCurrentChannelButtonToolNode(orientation: orientation,
                                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                                            neighborTypeRight: neighborTypeRight)
        case .timeLineResetFlatCurrentChannel:
            return ToolInterfaceFactory.getTimeLineResetFlatCurrentChannelButtonToolNode(orientation: orientation,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        case .timeLineResetCurveCurrentChannel:
            return ToolInterfaceFactory.getTimeLineResetCurveCurrentChannelButtonToolNode(orientation: orientation,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        case .timeLineBreakPoint:
            return ToolInterfaceFactory.getTimeLineBreakPointButtonToolNode(orientation: orientation,
                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                            neighborTypeRight: neighborTypeRight)
        }
    }
}
