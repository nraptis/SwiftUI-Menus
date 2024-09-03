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
            
        case .createWeightRing:
            if let historyStateCreateWeightRing = historyState as? HistoryStateCreateWeightRing {
                applyHistoryStateCreateWeightRingRedo(historyStateCreateWeightRing)
            }
        case .removeWeightRing:
            if let historyStateRemoveWeightRing = historyState as? HistoryStateRemoveWeightRing {
                applyHistoryStateRemoveWeightRingRedo(historyStateRemoveWeightRing)
            }
        case .transformWeightRing:
            if let historyStateTransformWeightRing = historyState as? HistoryStateTransformWeightRing {
                applyHistoryStateTransformWeightRingRedo(historyStateTransformWeightRing)
            }
        case .moveWeightRingControlPoint:
            if let historyStateMoveWeightRingControlPoint = historyState as? HistoryStateMoveWeightRingControlPoint {
                applyHistoryStateMoveWeightRingControlPointRedo(historyStateMoveWeightRingControlPoint)
            }
        case .createWeightRingControlPoint:
            if let historyStateCreateWeightRingControlPoint = historyState as? HistoryStateCreateWeightRingControlPoint {
                applyHistoryStateCreateWeightRingControlPointRedo(historyStateCreateWeightRingControlPoint)
            }
        case .removeWeightRingControlPoint:
            if let historyStateRemoveWeightRingControlPoint = historyState as? HistoryStateRemoveWeightRingControlPoint {
                applyHistoryStateRemoveWeightRingControlPointRedo(historyStateRemoveWeightRingControlPoint)
            }
        case .moveWeightCenter:
            if let historyStateMoveWeightCenter = historyState as? HistoryStateMoveWeightCenter {
                applyHistoryStateMoveWeightCenterRedo(historyStateMoveWeightCenter)
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
        }
        
        toolInterfaceViewModel.handleUndoRedoDidChange()
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
    
    private func applyHistoryStateCreateWeightRingRedo(_ historyState: HistoryStateCreateWeightRing) {
        jiggleViewModel.applyHistoryStateCreateWeightRingRedo(historyState)
    }
    
    private func applyHistoryStateRemoveWeightRingRedo(_ historyState: HistoryStateRemoveWeightRing) {
        jiggleViewModel.applyHistoryStateRemoveWeightRingRedo(historyState)
    }
    
    private func applyHistoryStateTransformWeightRingRedo(_ historyState: HistoryStateTransformWeightRing) {
        jiggleViewModel.applyHistoryStateTransformWeightRingRedo(historyState)
    }
    
    private func applyHistoryStateMoveWeightRingControlPointRedo(_ historyState: HistoryStateMoveWeightRingControlPoint) {
        jiggleViewModel.applyHistoryStateMoveWeightRingControlPointRedo(historyState)
    }
    
    private func applyHistoryStateCreateWeightRingControlPointRedo(_ historyState: HistoryStateCreateWeightRingControlPoint) {
        jiggleViewModel.applyHistoryStateCreateWeightRingControlPointRedo(historyState)
    }
    
    private func applyHistoryStateRemoveWeightRingControlPointRedo(_ historyState: HistoryStateRemoveWeightRingControlPoint) {
        jiggleViewModel.applyHistoryStateRemoveWeightRingControlPointRedo(historyState)
    }
    
    private func applyHistoryStateMoveWeightCenterRedo(_ historyState: HistoryStateMoveWeightCenter) {
        jiggleViewModel.applyHistoryStateMoveWeightCenterRedo(historyState)
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
    
}
