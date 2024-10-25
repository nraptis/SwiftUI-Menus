//
//  JiggleViewController+History.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewController {
    
    func redo() {
        if toolInterfaceViewModel.isBlocked { return }
        if historyController.canRedo() { historyController.redo() }
    }
    
    //
    // No matter what, the history action is enqueued for at least 2 display link
    // refreshes, otherwise the loading thunk might freeze the button. For many of
    // the history state changes, we require a "world configuration" change, which
    // just means that we need to "switch modes" in the menus, metal scene, or both...
    //
    func enterHistoryRedo(_ historyState: HistoryState) {
        let toolAction = getHistoryInterfaceToolAction(historyState)
        let sliceHistory = ToolActionPhaseSliceApplyHistoryRedo(historyState: historyState)
        let phaseHistory = ToolActionPhase(slice: sliceHistory)
        toolAction.phases.append(phaseHistory)
        toolActionPerform(toolAction)
    }
    
    //
    // "B" is the execution of the history state... Note that some of these
    // will cause a lag thunk, which can temporarily block the UI.
    //
    func executeHistoryStateRedo(_ historyState: HistoryState) {
        print("==> Apply History [\(historyState)] (REDO - B)")
        
        switch historyState.historyStateType {
            
        case .rotateOrFlipJiggle:
            if let historyStateRotateOrFlipJiggle = historyState as? HistoryStateRotateOrFlipJiggle {
                applyHistoryStateRotateOrFlipJiggleRedo(historyStateRotateOrFlipJiggle)
            }
        case .rotateOrFlipGuide:
            if let historyStateRotateOrFlipGuide = historyState as? HistoryStateRotateOrFlipGuide {
                applyHistoryStateRotateOrFlipGuideRedo(historyStateRotateOrFlipGuide)
            }
            
        case .createJiggle:
            if let historyStateCreateJiggle = historyState as? HistoryStateCreateJiggle {
                applyHistoryStateCreateJiggleRedo(historyStateCreateJiggle)
            }
        case .removeJiggle:
            if let historyStateRemoveJiggle = historyState as? HistoryStateRemoveJiggle {
                applyHistoryStateRemoveJiggleRedo(historyStateRemoveJiggle)
            }
        case .transformJiggle:
            if let historyStateTransformJiggle = historyState as? HistoryStateTransformJiggle {
                applyHistoryStateTransformJiggleRedo(historyStateTransformJiggle)
            }
        case .moveControlPoint:
            if let historyStateMoveControlPoint = historyState as? HistoryStateMoveControlPoint {
                applyHistoryStateMoveControlPointRedo(historyStateMoveControlPoint)
            }
        case .createControlPoint:
            if let historyStateCreateControlPoint = historyState as? HistoryStateCreateControlPoint {
                applyHistoryStateCreateControlPointRedo(historyStateCreateControlPoint)
            }
        case .removeControlPoint:
            if let historyStateRemoveControlPoint = historyState as? HistoryStateRemoveControlPoint {
                applyHistoryStateRemoveControlPointRedo(historyStateRemoveControlPoint)
            }
        case .createGuide:
            if let historyStateCreateGuide = historyState as? HistoryStateCreateGuide {
                applyHistoryStateCreateGuideRedo(historyStateCreateGuide)
            }
        case .removeGuide:
            if let historyStateDeleteGuide = historyState as? HistoryStateDeleteGuide {
                applyHistoryStateDeleteGuideRedo(historyStateDeleteGuide)
            }
        case .transformGuide:
            if let historyStateTransformGuide = historyState as? HistoryStateTransformGuide {
                applyHistoryStateTransformGuideRedo(historyStateTransformGuide)
            }
        case .moveGuideControlPoint:
            if let historyStateMoveGuideControlPoint = historyState as? HistoryStateMoveGuideControlPoint {
                applyHistoryStateMoveGuideControlPointRedo(historyStateMoveGuideControlPoint)
            }
        case .createGuideControlPoint:
            if let historyStateCreateGuideControlPoint = historyState as? HistoryStateCreateGuideControlPoint {
                applyHistoryStateCreateGuideControlPointRedo(historyStateCreateGuideControlPoint)
            }
        case .removeGuideControlPoint:
            if let historyStateDeleteGuideControlPoint = historyState as? HistoryStateDeleteGuideControlPoint {
                applyHistoryStateDeleteGuideControlPointRedo(historyStateDeleteGuideControlPoint)
            }
        case .moveWeightCenter:
            if let historyStateMoveWeightCenter = historyState as? HistoryStateMoveWeightCenter {
                applyHistoryStateMoveWeightCenterRedo(historyStateMoveWeightCenter)
            }
        case .moveJiggleCenter:
            if let historyStateMoveJiggleCenter = historyState as? HistoryStateMoveJiggleCenter {
                applyHistoryStateMoveJiggleCenterRedo(historyStateMoveJiggleCenter)
            }
        case .moveWeightGraphPosition:
            if let historyStateMoveWeightGraphPosition = historyState as? HistoryStateMoveWeightGraphPosition {
                applyHistoryStateMoveWeightGraphPositionRedo(historyStateMoveWeightGraphPosition)
            }
        case .moveWeightGraphTangent:
            if let historyStateMoveWeightGraphTangent = historyState as? HistoryStateMoveWeightGraphTangent {
                applyHistoryStateMoveWeightGraphTangentRedo(historyStateMoveWeightGraphTangent)
            }
        case .resetWeightGraph:
            if let historyStateResetWeightGraph = historyState as? HistoryStateResetWeightGraph {
                applyHistoryStateResetWeightGraphRedo(historyStateResetWeightGraph)
            }
        case .breakWeightGraphNodeManual:
            if let historyStateBreakWeightGraphNodeManual = historyState as? HistoryStateBreakWeightGraphNodeManual {
                applyHistoryStateBreakWeightGraphNodeManualRedo(historyStateBreakWeightGraphNodeManual)
            }
            
        case .jiggleSpeed:
            if let historyStateJiggleSpeed = historyState as? HistoryStateJiggleSpeed {
                applyHistoryStateJiggleSpeedRedo(historyStateJiggleSpeed)
            }
        case .gyroPower:
            if let historyStateGyroPower = historyState as? HistoryStateGyroPower {
                applyHistoryStateGyroPowerRedo(historyStateGyroPower)
            }
        case .timeLineUpdate:
            if let historyStateTimeLineUpdate = historyState as? HistoryStateTimeLineUpdate {
                applyHistoryStateTimeLineUpdateRedo(historyStateTimeLineUpdate)
            }
        case .jiggleDampen:
            if let historyStateJiggleDampen = historyState as? HistoryStateJiggleDampen {
                applyHistoryStateJiggleDampenRedo(historyStateJiggleDampen)
            }
        }
        toolInterfaceViewModel.handleUndoRedoDidChange()
    }
    
    private func applyHistoryStateRotateOrFlipJiggleRedo(_ historyState: HistoryStateRotateOrFlipJiggle) {
        jiggleViewModel.applyHistoryStateRotateOrFlipJiggleRedo(historyState)
    }
    
    private func applyHistoryStateRotateOrFlipGuideRedo(_ historyState: HistoryStateRotateOrFlipGuide) {
        jiggleViewModel.applyHistoryStateRotateOrFlipGuideRedo(historyState)
    }
    
    private func applyHistoryStateCreateJiggleRedo(_ historyState: HistoryStateCreateJiggle) {
        jiggleViewModel.applyHistoryStateCreateJiggleRedo(historyState)
    }
    
    private func applyHistoryStateRemoveJiggleRedo(_ historyState: HistoryStateRemoveJiggle) {
        jiggleViewModel.applyHistoryStateRemoveJiggleRedo(historyState)
    }
    
    private func applyHistoryStateTransformJiggleRedo(_ historyState: HistoryStateTransformJiggle) {
        jiggleViewModel.applyHistoryStateTransformJiggleRedo(historyState)
    }
    
    private func applyHistoryStateMoveControlPointRedo(_ historyState: HistoryStateMoveControlPoint) {
        jiggleViewModel.applyHistoryStateMoveControlPointRedo(historyState)
    }
    
    private func applyHistoryStateCreateControlPointRedo(_ historyState: HistoryStateCreateControlPoint) {
        jiggleViewModel.applyHistoryStateCreateControlPointRedo(historyState)
    }
    
    private func applyHistoryStateRemoveControlPointRedo(_ historyState: HistoryStateRemoveControlPoint) {
        jiggleViewModel.applyHistoryStateRemoveControlPointRedo(historyState)
    }
    
    private func applyHistoryStateCreateGuideRedo(_ historyState: HistoryStateCreateGuide) {
        jiggleViewModel.applyHistoryStateCreateGuideRedo(historyState)
    }
    
    private func applyHistoryStateDeleteGuideRedo(_ historyState: HistoryStateDeleteGuide) {
        jiggleViewModel.applyHistoryStateDeleteGuideRedo(historyState)
    }
    
    private func applyHistoryStateTransformGuideRedo(_ historyState: HistoryStateTransformGuide) {
        jiggleViewModel.applyHistoryStateTransformGuideRedo(historyState)
    }
    
    private func applyHistoryStateMoveGuideControlPointRedo(_ historyState: HistoryStateMoveGuideControlPoint) {
        jiggleViewModel.applyHistoryStateMoveGuideControlPointRedo(historyState)
    }
    
    private func applyHistoryStateCreateGuideControlPointRedo(_ historyState: HistoryStateCreateGuideControlPoint) {
        jiggleViewModel.applyHistoryStateCreateGuideControlPointRedo(historyState)
    }
    
    private func applyHistoryStateDeleteGuideControlPointRedo(_ historyState: HistoryStateDeleteGuideControlPoint) {
        jiggleViewModel.applyHistoryStateDeleteGuideControlPointRedo(historyState)
    }
    
    private func applyHistoryStateMoveWeightCenterRedo(_ historyState: HistoryStateMoveWeightCenter) {
        jiggleViewModel.applyHistoryStateMoveWeightCenterRedo(historyState)
    }
    
    private func applyHistoryStateMoveJiggleCenterRedo(_ historyState: HistoryStateMoveJiggleCenter) {
        jiggleViewModel.applyHistoryStateMoveJiggleCenterRedo(historyState)
    }
    
    func applyHistoryStateMoveWeightGraphPositionRedo(_ historyState: HistoryStateMoveWeightGraphPosition) {
        jiggleViewModel.applyHistoryStateMoveWeightGraphPositionRedo(historyState)
    }
    
    func applyHistoryStateMoveWeightGraphTangentRedo(_ historyState: HistoryStateMoveWeightGraphTangent) {
        jiggleViewModel.applyHistoryStateMoveWeightGraphTangentRedo(historyState)
    }
    
    private func applyHistoryStateResetWeightGraphRedo(_ historyState: HistoryStateResetWeightGraph) {
        jiggleViewModel.applyHistoryStateResetWeightGraphRedo(historyState)
    }
    
    private func applyHistoryStateBreakWeightGraphNodeManualRedo(_ historyState: HistoryStateBreakWeightGraphNodeManual) {
        jiggleViewModel.applyHistoryStateBreakWeightGraphNodeManualRedo(historyState)
    }
    
    private func applyHistoryStateJiggleSpeedRedo(_ historyState: HistoryStateJiggleSpeed) {
        jiggleViewModel.applyHistoryStateJiggleSpeedRedo(historyState)
    }
    
    private func applyHistoryStateGyroPowerRedo(_ historyState: HistoryStateGyroPower) {
        jiggleViewModel.applyHistoryStateGyroPowerRedo(historyState)
    }
    
    private func applyHistoryStateTimeLineUpdateRedo(_ historyState: HistoryStateTimeLineUpdate) {
        jiggleViewModel.applyHistoryStateTimeLineUpdateRedo(historyState)
    }
    
    private func applyHistoryStateJiggleDampenRedo(_ historyState: HistoryStateJiggleDampen) {
        jiggleViewModel.applyHistoryStateJiggleDampenRedo(historyState)
    }
    
}
