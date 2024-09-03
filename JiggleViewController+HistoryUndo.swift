//
//  JiggleViewController+HistoryUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/8/24.
//

import Foundation

extension JiggleViewController {
    
    func undo() {
        if toolInterfaceViewModel.isBlocked { return }
        if historyController.canUndo() { historyController.undo() }
    }
    
    func enterHistoryUndo(_ historyState: HistoryState) {
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
    func executeHistoryStateUndo(_ historyState: HistoryState) {
        
        print("==> executeHistoryStateUndo [\(historyState)] (UNDO - B)")
        
        switch historyState.historyStateType {
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
        case .createWeightRing:
            if let historyStateCreateWeightRing = historyState as? HistoryStateCreateWeightRing {
                applyHistoryStateCreateWeightRingUndo(historyStateCreateWeightRing)
            }
        case .removeWeightRing:
            if let historyStateRemoveWeightRing = historyState as? HistoryStateRemoveWeightRing {
                applyHistoryStateRemoveWeightRingUndo(historyStateRemoveWeightRing)
            }
        case .transformWeightRing:
            if let historyStateTransformWeightRing = historyState as? HistoryStateTransformWeightRing {
                applyHistoryStateTransformWeightRingUndo(historyStateTransformWeightRing)
            }
        case .moveWeightRingControlPoint:
            if let historyStateMoveWeightRingControlPoint = historyState as? HistoryStateMoveWeightRingControlPoint {
                applyHistoryStateMoveWeightRingControlPointUndo(historyStateMoveWeightRingControlPoint)
            }
        case .createWeightRingControlPoint:
            if let historyStateCreateWeightRingControlPoint = historyState as? HistoryStateCreateWeightRingControlPoint {
                applyHistoryStateCreateWeightRingControlPointUndo(historyStateCreateWeightRingControlPoint)
            }
        case .removeWeightRingControlPoint:
            if let historyStateRemoveWeightRingControlPoint = historyState as? HistoryStateRemoveWeightRingControlPoint {
                applyHistoryStateRemoveWeightRingControlPointUndo(historyStateRemoveWeightRingControlPoint)
            }
        case .moveWeightCenter:
            if let historyStateMoveWeightCenter = historyState as? HistoryStateMoveWeightCenter {
                applyHistoryStateMoveWeightCenterUndo(historyStateMoveWeightCenter)
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
        case .breakWeightGraphNodeManual:
            if let historyStateBreakWeightGraphNodeManual = historyState as? HistoryStateBreakWeightGraphNodeManual {
                applyHistoryStateBreakWeightGraphNodeManualUndo(historyStateBreakWeightGraphNodeManual)
            }
        }
        toolInterfaceViewModel.handleUndoRedoDidChange()
    }
    
    private func applyHistoryStateCreateJiggleUndo(_ historyState: HistoryStateCreateJiggle) {
        jiggleViewModel.applyHistoryStateCreateJiggleUndo(historyState)
    }
    
    private func applyHistoryStateRemoveJiggleUndo(_ historyState: HistoryStateRemoveJiggle) {
        jiggleViewModel.applyHistoryStateRemoveJiggleUndo(historyState)
    }
    
    private func applyHistoryStateTransformJiggleUndo(_ historyState: HistoryStateTransformJiggle) {
        jiggleViewModel.applyHistoryStateTransformJiggleUndo(historyState)
    }
    
    private func applyHistoryStateMoveControlPointUndo(_ historyState: HistoryStateMoveControlPoint) {
        jiggleViewModel.applyHistoryStateMoveControlPointUndo(historyState)
    }
    
    private func applyHistoryStateCreateControlPointUndo(_ historyState: HistoryStateCreateControlPoint) {
        jiggleViewModel.applyHistoryStateCreateControlPointUndo(historyState)
    }
    
    private func applyHistoryStateRemoveControlPointUndo(_ historyState: HistoryStateRemoveControlPoint) {
        jiggleViewModel.applyHistoryStateRemoveControlPointUndo(historyState)
    }
    
    private func applyHistoryStateCreateWeightRingUndo(_ historyState: HistoryStateCreateWeightRing) {
        jiggleViewModel.applyHistoryStateCreateWeightRingUndo(historyState)
    }
    
    private func applyHistoryStateRemoveWeightRingUndo(_ historyState: HistoryStateRemoveWeightRing) {
        jiggleViewModel.applyHistoryStateRemoveWeightRingUndo(historyState)
    }
    
    private func applyHistoryStateTransformWeightRingUndo(_ historyState: HistoryStateTransformWeightRing) {
        jiggleViewModel.applyHistoryStateTransformWeightRingUndo(historyState)
    }
    
    private func applyHistoryStateMoveWeightRingControlPointUndo(_ historyState: HistoryStateMoveWeightRingControlPoint) {
        jiggleViewModel.applyHistoryStateMoveWeightRingControlPointUndo(historyState)
    }
    
    private func applyHistoryStateCreateWeightRingControlPointUndo(_ historyState: HistoryStateCreateWeightRingControlPoint) {
        jiggleViewModel.applyHistoryStateCreateWeightRingControlPointUndo(historyState)
    }
    
    private func applyHistoryStateRemoveWeightRingControlPointUndo(_ historyState: HistoryStateRemoveWeightRingControlPoint) {
        jiggleViewModel.applyHistoryStateRemoveWeightRingControlPointUndo(historyState)
    }
    
    private func applyHistoryStateMoveWeightCenterUndo(_ historyState: HistoryStateMoveWeightCenter) {
        jiggleViewModel.applyHistoryStateMoveWeightCenterUndo(historyState)
    }
    
    private func applyHistoryStateMoveWeightGraphPositionUndo(_ historyState: HistoryStateMoveWeightGraphPosition) {
        jiggleViewModel.applyHistoryStateMoveWeightGraphPositionUndo(historyState)
    }
    
    private func applyHistoryStateMoveWeightGraphTangentUndo(_ historyState: HistoryStateMoveWeightGraphTangent) {
        jiggleViewModel.applyHistoryStateMoveWeightGraphTangentUndo(historyState)
    }
    
    private func applyHistoryStateResetWeightGraphUndo(_ historyState: HistoryStateResetWeightGraph) {
        jiggleViewModel.applyHistoryStateResetWeightGraphUndo(historyState)
    }
    
    private func applyHistoryStateBreakWeightGraphNodeManualUndo(_ historyState: HistoryStateBreakWeightGraphNodeManual) {
        jiggleViewModel.applyHistoryStateBreakWeightGraphNodeManualUndo(historyState)
    }
    
}
