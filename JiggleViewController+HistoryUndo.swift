//
//  JiggleViewController+HistoryUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewController {
    
    @MainActor func undo() {
        if toolInterfaceViewModel.isBlocked { return }
        if historyController.canUndo() { historyController.undo() }
    }
    
    @MainActor func enterHistoryUndo(_ historyState: HistoryState) {
        let toolAction = getHistoryInterfaceToolAction(historyState)
        let sliceHistory = ToolActionPhaseSliceApplyHistoryUndo(historyState: historyState)
        let phaseHistory = ToolActionPhase(slice: sliceHistory)
        toolAction.phases.append(phaseHistory)
        toolActionPerform(toolAction)
    }
    
    //
    // "B" is the execution of the history state... Note that some of these
    // will cause a lag thunk, which can temporarily block the UI.
    //
    @MainActor func executeHistoryStateUndo(_ historyState: HistoryState) {
        
        print("==> executeHistoryStateUndo [\(historyState)] (UNDO - B)")
        
        switch historyState.historyStateType {
            
        case .rotateOrFlipJiggle:
            if let historyStateRotateOrFlipJiggle = historyState as? HistoryStateRotateOrFlipJiggle {
                applyHistoryStateRotateOrFlipJiggleUndo(historyStateRotateOrFlipJiggle)
            }
        case .rotateOrFlipGuide:
            if let historyStateRotateOrFlipGuide = historyState as? HistoryStateRotateOrFlipGuide {
                applyHistoryStateRotateOrFlipGuideUndo(historyStateRotateOrFlipGuide)
            }
            
        case .createJiggle:
            if let historyStateCreateJiggle = historyState as? HistoryStateCreateJiggle {
                applyHistoryStateCreateJiggleUndo(historyStateCreateJiggle)
            }
        case .removeJiggle:
            if let historyStateRemoveJiggle = historyState as? HistoryStateRemoveJiggle {
                applyHistoryStateRemoveJiggleUndo(historyStateRemoveJiggle)
            }
        case .transformJiggle:
            if let historyStateTransformJiggle = historyState as? HistoryStateTransformJiggle {
                applyHistoryStateTransformJiggleUndo(historyStateTransformJiggle)
            }
        case .moveControlPoint:
            if let historyStateMoveControlPoint = historyState as? HistoryStateMoveControlPoint {
                applyHistoryStateMoveControlPointUndo(historyStateMoveControlPoint)
            }
        case .createControlPoint:
            if let historyStateCreateControlPoint = historyState as? HistoryStateCreateControlPoint {
                applyHistoryStateCreateControlPointUndo(historyStateCreateControlPoint)
            }
        case .removeControlPoint:
            if let historyStateRemoveControlPoint = historyState as? HistoryStateRemoveControlPoint {
                applyHistoryStateRemoveControlPointUndo(historyStateRemoveControlPoint)
            }
        case .createGuide:
            if let historyStateCreateGuide = historyState as? HistoryStateCreateGuide {
                applyHistoryStateCreateGuideUndo(historyStateCreateGuide)
            }
        case .removeGuide:
            if let historyStateDeleteGuide = historyState as? HistoryStateDeleteGuide {
                applyHistoryStateDeleteGuideUndo(historyStateDeleteGuide)
            }
        case .transformGuide:
            if let historyStateTransformGuide = historyState as? HistoryStateTransformGuide {
                applyHistoryStateTransformGuideUndo(historyStateTransformGuide)
            }
        case .moveGuideControlPoint:
            if let historyStateMoveGuideControlPoint = historyState as? HistoryStateMoveGuideControlPoint {
                applyHistoryStateMoveGuideControlPointUndo(historyStateMoveGuideControlPoint)
            }
        case .createGuideControlPoint:
            if let historyStateCreateGuideControlPoint = historyState as? HistoryStateCreateGuideControlPoint {
                applyHistoryStateCreateGuideControlPointUndo(historyStateCreateGuideControlPoint)
            }
        case .removeGuideControlPoint:
            if let historyStateDeleteGuideControlPoint = historyState as? HistoryStateDeleteGuideControlPoint {
                applyHistoryStateDeleteGuideControlPointUndo(historyStateDeleteGuideControlPoint)
            }
        case .moveWeightCenter:
            if let historyStateMoveWeightCenter = historyState as? HistoryStateMoveWeightCenter {
                applyHistoryStateMoveWeightCenterUndo(historyStateMoveWeightCenter)
            }
        case .moveJiggleCenter:
            if let historyStateMoveJiggleCenter = historyState as? HistoryStateMoveJiggleCenter {
                applyHistoryStateMoveJiggleCenterUndo(historyStateMoveJiggleCenter)
            }
        case .moveWeightGraphPosition:
            if let historyStateMoveWeightGraphPosition = historyState as? HistoryStateMoveWeightGraphPosition {
                applyHistoryStateMoveWeightGraphPositionUndo(historyStateMoveWeightGraphPosition)
            }
        case .moveWeightGraphTangent:
            if let historyStateMoveWeightGraphTangent = historyState as? HistoryStateMoveWeightGraphTangent {
                applyHistoryStateMoveWeightGraphTangentUndo(historyStateMoveWeightGraphTangent)
            }
        case .resetWeightGraph:
            if let historyStateResetWeightGraph = historyState as? HistoryStateResetWeightGraph {
                applyHistoryStateResetWeightGraphUndo(historyStateResetWeightGraph)
            }
        case .jiggleSpeed:
            if let historyStateJiggleSpeed = historyState as? HistoryStateJiggleSpeed {
                applyHistoryStateJiggleSpeedUndo(historyStateJiggleSpeed)
            }
        case .gyroPower:
            if let historyStateGyroPower = historyState as? HistoryStateGyroPower {
                applyHistoryStateGyroPowerUndo(historyStateGyroPower)
            }
        case .jiggleDampen:
            if let historyStateJiggleDampen = historyState as? HistoryStateJiggleDampen {
                applyHistoryStateJiggleDampenUndo(historyStateJiggleDampen)
            }
        case .loopAttributeOne:
            if let historyStateLoopAttributeOne = historyState as? HistoryStateLoopAttributeOne {
                applyHistoryStateLoopAttributeOneUndo(historyStateLoopAttributeOne)
            }
        case .loopAttributesAll:
            if let historyStateLoopAttributesAll = historyState as? HistoryStateLoopAttributesAll {
                applyHistoryStateLoopAttributesAllUndo(historyStateLoopAttributesAll)
            }
        case .continuousAttributeOne:
            if let historyStateContinuousAttributeOne = historyState as? HistoryStateContinuousAttributeOne {
                applyHistoryStateContinuousAttributeOneUndo(historyStateContinuousAttributeOne)
            }
        case .continuousAttributesAll:
            if let historyStateContinuousAttributesAll = historyState as? HistoryStateContinuousAttributesAll {
                applyHistoryStateContinuousAttributesAllUndo(historyStateContinuousAttributesAll)
            }
        }
        toolInterfaceViewModel.handleUndoRedoDidChange()
    }
    
    @MainActor private func applyHistoryStateRotateOrFlipJiggleUndo(_ historyState: HistoryStateRotateOrFlipJiggle) {
        jiggleViewModel.applyHistoryStateRotateOrFlipJiggleUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateRotateOrFlipGuideUndo(_ historyState: HistoryStateRotateOrFlipGuide) {
        jiggleViewModel.applyHistoryStateRotateOrFlipGuideUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateCreateJiggleUndo(_ historyState: HistoryStateCreateJiggle) {
        jiggleViewModel.applyHistoryStateCreateJiggleUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateRemoveJiggleUndo(_ historyState: HistoryStateRemoveJiggle) {
        jiggleViewModel.applyHistoryStateRemoveJiggleUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateTransformJiggleUndo(_ historyState: HistoryStateTransformJiggle) {
        jiggleViewModel.applyHistoryStateTransformJiggleUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateMoveControlPointUndo(_ historyState: HistoryStateMoveControlPoint) {
        jiggleViewModel.applyHistoryStateMoveControlPointUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateCreateControlPointUndo(_ historyState: HistoryStateCreateControlPoint) {
        jiggleViewModel.applyHistoryStateCreateControlPointUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateRemoveControlPointUndo(_ historyState: HistoryStateRemoveControlPoint) {
        jiggleViewModel.applyHistoryStateRemoveControlPointUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateCreateGuideUndo(_ historyState: HistoryStateCreateGuide) {
        jiggleViewModel.applyHistoryStateCreateGuideUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateDeleteGuideUndo(_ historyState: HistoryStateDeleteGuide) {
        jiggleViewModel.applyHistoryStateDeleteGuideUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateTransformGuideUndo(_ historyState: HistoryStateTransformGuide) {
        jiggleViewModel.applyHistoryStateTransformGuideUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateMoveGuideControlPointUndo(_ historyState: HistoryStateMoveGuideControlPoint) {
        jiggleViewModel.applyHistoryStateMoveGuideControlPointUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateCreateGuideControlPointUndo(_ historyState: HistoryStateCreateGuideControlPoint) {
        jiggleViewModel.applyHistoryStateCreateGuideControlPointUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateDeleteGuideControlPointUndo(_ historyState: HistoryStateDeleteGuideControlPoint) {
        jiggleViewModel.applyHistoryStateDeleteGuideControlPointUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateMoveWeightCenterUndo(_ historyState: HistoryStateMoveWeightCenter) {
        jiggleViewModel.applyHistoryStateMoveWeightCenterUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateMoveJiggleCenterUndo(_ historyState: HistoryStateMoveJiggleCenter) {
        jiggleViewModel.applyHistoryStateMoveJiggleCenterUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateMoveWeightGraphPositionUndo(_ historyState: HistoryStateMoveWeightGraphPosition) {
        jiggleViewModel.applyHistoryStateMoveWeightGraphPositionUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateMoveWeightGraphTangentUndo(_ historyState: HistoryStateMoveWeightGraphTangent) {
        jiggleViewModel.applyHistoryStateMoveWeightGraphTangentUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateResetWeightGraphUndo(_ historyState: HistoryStateResetWeightGraph) {
        jiggleViewModel.applyHistoryStateResetWeightGraphUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateJiggleSpeedUndo(_ historyState: HistoryStateJiggleSpeed) {
        jiggleViewModel.applyHistoryStateJiggleSpeedUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateGyroPowerUndo(_ historyState: HistoryStateGyroPower) {
        jiggleViewModel.applyHistoryStateGyroPowerUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateJiggleDampenUndo(_ historyState: HistoryStateJiggleDampen) {
        jiggleViewModel.applyHistoryStateJiggleDampenUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateLoopAttributeOneUndo(_ historyState: HistoryStateLoopAttributeOne) {
        jiggleViewModel.applyHistoryStateLoopAttributeOneUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateLoopAttributesAllUndo(_ historyState: HistoryStateLoopAttributesAll) {
        jiggleViewModel.applyHistoryStateLoopAttributesAllUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateContinuousAttributeOneUndo(_ historyState: HistoryStateContinuousAttributeOne) {
        jiggleViewModel.applyHistoryStateContinuousAttributeOneUndo(historyState)
    }
    
    @MainActor private func applyHistoryStateContinuousAttributesAllUndo(_ historyState: HistoryStateContinuousAttributesAll) {
        jiggleViewModel.applyHistoryStateContinuousAttributesAllUndo(historyState)
    }
}
