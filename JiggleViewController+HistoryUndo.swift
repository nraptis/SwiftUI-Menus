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
        case .breakWeightGraphNodeManual:
            if let historyStateBreakWeightGraphNodeManual = historyState as? HistoryStateBreakWeightGraphNodeManual {
                applyHistoryStateBreakWeightGraphNodeManualUndo(historyStateBreakWeightGraphNodeManual)
            }
        }
        toolInterfaceViewModel.handleUndoRedoDidChange()
    }
    
    private func applyHistoryStateRotateOrFlipJiggleUndo(_ historyState: HistoryStateRotateOrFlipJiggle) {
        jiggleViewModel.applyHistoryStateRotateOrFlipJiggleUndo(historyState)
    }
    
    private func applyHistoryStateRotateOrFlipGuideUndo(_ historyState: HistoryStateRotateOrFlipGuide) {
        jiggleViewModel.applyHistoryStateRotateOrFlipGuideUndo(historyState)
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
    
    private func applyHistoryStateCreateGuideUndo(_ historyState: HistoryStateCreateGuide) {
        jiggleViewModel.applyHistoryStateCreateGuideUndo(historyState)
    }
    
    private func applyHistoryStateDeleteGuideUndo(_ historyState: HistoryStateDeleteGuide) {
        jiggleViewModel.applyHistoryStateDeleteGuideUndo(historyState)
    }
    
    private func applyHistoryStateTransformGuideUndo(_ historyState: HistoryStateTransformGuide) {
        jiggleViewModel.applyHistoryStateTransformGuideUndo(historyState)
    }
    
    private func applyHistoryStateMoveGuideControlPointUndo(_ historyState: HistoryStateMoveGuideControlPoint) {
        jiggleViewModel.applyHistoryStateMoveGuideControlPointUndo(historyState)
    }
    
    private func applyHistoryStateCreateGuideControlPointUndo(_ historyState: HistoryStateCreateGuideControlPoint) {
        jiggleViewModel.applyHistoryStateCreateGuideControlPointUndo(historyState)
    }
    
    private func applyHistoryStateDeleteGuideControlPointUndo(_ historyState: HistoryStateDeleteGuideControlPoint) {
        jiggleViewModel.applyHistoryStateDeleteGuideControlPointUndo(historyState)
    }
    
    private func applyHistoryStateMoveWeightCenterUndo(_ historyState: HistoryStateMoveWeightCenter) {
        jiggleViewModel.applyHistoryStateMoveWeightCenterUndo(historyState)
    }
    
    private func applyHistoryStateMoveJiggleCenterUndo(_ historyState: HistoryStateMoveJiggleCenter) {
        jiggleViewModel.applyHistoryStateMoveJiggleCenterUndo(historyState)
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
