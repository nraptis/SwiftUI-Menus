//
//  ToolInterfaceViewModel+NodeGeneration+Buttons.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_Button(orientation: Orientation,
                                    inr: INR_Button,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .menu:
            return getMenuButtonToolNode(orientation: orientation,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        case .undo:
            return getUndoButtonToolNode(orientation: orientation,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        case .redo:
            return getRedoButtonToolNode(orientation: orientation,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        case .zoomReset:
            return getZoomResetButtonToolNode(orientation: orientation,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        case .zoomJiggle:
            return getZoomJiggleButtonToolNode(orientation: orientation,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        case .zoomIn:
            return getZoomInButtonToolNode(orientation: orientation,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        case .zoomOut:
            return getZoomOutButtonToolNode(orientation: orientation,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        case .generateTopography:
            return getGenerateTopographyButtonToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .flipJiggleHorizontal:
            return getFlipJiggleHorizontalButtonToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        case .flipJiggleVertical:
            return getFlipJiggleVerticalButtonToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .rotateJiggleLeft:
            return getRotateJiggleLeftButtonToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .rotateJiggleRight:
            return getRotateJiggleRightButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        case .selectPreviousJiggle:
            return getSelectPreviousJiggleButtonToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        case .selectPreviousJigglePoint:
            return getSelectPreviousJigglePointButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .selectNextJiggle:
            return getSelectNextJiggleButtonToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .selectNextJigglePoint:
            return getSelectNextJigglePointButtonToolNode(orientation: orientation,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        case .unfreezeJiggles:
            return getUnfreezeAllJigglesButtonToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .freezeJiggle:
            return getFreezeSelectedJiggleButtonToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        case .cloneJiggle:
            return getCloneJiggleButtonToolNode(orientation: orientation,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        case .deleteJiggle:
            return getDeleteJiggleButtonToolNode(orientation: orientation,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        case .deleteJigglePoint:
            return getDeleteJigglePointButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        case .flipGuideHorizontal:
            return getFlipGuideHorizontalButtonToolNode(orientation: orientation,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        case .flipGuideVertical:
            return getFlipGuideVerticalButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        case .rotateGuideLeft:
            return getRotateGuideLeftButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .rotateGuideRight:
            return getRotateGuideRightButtonToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .selectPreviousGuide:
            return getSelectPreviousGuideButtonToolNode(orientation: orientation,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        case .selectPreviousGuidePoint:
            return getSelectPreviousGuidePointButtonToolNode(orientation: orientation,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        case .selectNextGuide:
            return getSelectNextGuideButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .selectNextGuidePoint:
            return getSelectNextGuidePointButtonToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        case .unfreezeGuides:
            return getUnfreezeAllGuidesButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        case .freezeGuide:
            return getFreezeSelectedGuideButtonToolNode(orientation: orientation,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        case .cloneGuide:
            return getCloneGuideButtonToolNode(orientation: orientation,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        case .deleteGuide:
            return getDeleteGuideButtonToolNode(orientation: orientation,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        case .deleteGuidePoint:
            return getDeleteGuidePointButtonToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .timeLineAmplify:
            return getTimeLineAmplifyButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .timeLineDampen:
            return getTimeLineDampenButtonToolNode(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        case .timeLineInvertVertical:
            return getTimeLineInvertVerticalButtonToolNode(orientation: orientation,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        case .timeLineInvertHorizontal:
            return getTimeLineInvertHorizontalButtonToolNode(orientation: orientation,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        case .timeLineDupeCurrentChannel:
            return getTimeLineDupeCurrentChannelButtonToolNode(orientation: orientation,
                                                               neighborTypeLeft: neighborTypeLeft,
                                                               neighborTypeRight: neighborTypeRight)
        case .timeLineDupeAll:
            return getTimeLineDupeAllButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .timeLineFlipAll:
            return getTimeLineFlipAllButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .timeLineSyncFrames:
            return getTimeLineSyncFramesButtonToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .timeLineResetCurve:
            return getTimeLineResetCurveButtonToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
            
        case .timeLineResetCurveSmall:
            return getTimeLineResetCurveSmallButtonToolNode(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
            
            
        case .timeLineResetDivot:
            return getTimeLineResetDivotButtonToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
            
            
        case .timeLineResetDivotSmall:
            return getTimeLineResetDivotSmallButtonToolNode(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
            
            
        case .timeLineResetFlat:
            return getTimeLineResetFlatButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
            
            
        case .timeLineResetSwan:
            return getTimeLineResetSwanButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
            
            
        case .timeLineShiftDown:
            return getTimeLineShiftDownButtonToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
            
            
        case .timeLineShiftUp:
            return getTimeLineShiftUpButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
            
        case .resetWeightGraphStandard:
            return getResetWeightGraphStandardButtonToolNode(orientation: orientation,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        case .resetWeightGraphStandardDampened:
            return getResetWeightGraphStandardDampenedButtonToolNode(orientation: orientation,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
            
        case .resetWeightGraphLinear:
            return getResetWeightGraphLinearButtonToolNode(orientation: orientation,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        case .resetWeightGraphLinearDampened:
            return getResetWeightGraphLinearDampenedButtonToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
            
        case .resetWeightGraphInverse:
            return getResetWeightGraphInverseButtonToolNode(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        case .resetWeightGraphInverseDampened:
            return getResetWeightGraphInverseDampenedButtonToolNode(orientation: orientation,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
            
        case .swivelPanReset:
            return getSwivelPanResetButtonToolNode(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        case .swivelPanLeft:
            return getSwivelPanLeftButtonToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .swivelPanRight:
            return getSwivelPanRightButtonToolNode(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
            
        case .continuousResetAngleDiag1:
            return getContinuousResetAngleDiag1ButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .continuousResetAngleDiag2:
            return getContinuousResetAngleDiag2ButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .continuousResetAngleHorizontal:
            return getContinuousResetAngleHorizontalButtonToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        case .continuousResetAngleVertical:
            return getContinuousResetAngleVerticalButtonToolNode(orientation: orientation,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
        case .continuousResetEndRotation:
            return getContinuousResetEndRotationButtonToolNode(orientation: orientation,
                                                               neighborTypeLeft: neighborTypeLeft,
                                                               neighborTypeRight: neighborTypeRight)
        case .continuousResetEndScale:
            return getContinuousResetEndScaleButtonToolNode(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        case .continuousResetStartRotation:
            return getContinuousResetStartRotationButtonToolNode(orientation: orientation,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
        case .continuousResetStartScale:
            return getContinuousResetStartScaleButtonToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .continuousResetSwoop:
            return getContinuousResetSwoopButtonToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        case .continuousSyncFrames:
            return getContinuousSyncFramesButtonToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
            
        case .imageImporterButtonBack:
            return getImageImportBackButtonToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .imageImporterRotateRight:
            return getImageImporterRotateRightButtonToolNode(orientation: orientation,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        case .imageImporterRotateLeft:
            return getImageImporterRotateLeftButtonToolNode(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        case .imageImporterResetAspectFit:
            return getImageImporterResetAspectFitButtonToolNode(orientation: orientation,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        case .imageImporterResetAspectFill:
            return getImageImporterResetAspectFillButtonToolNode(orientation: orientation,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
        case .loadScreenBack:
            return getLoadSceneBackButtonToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        }
    }
}
