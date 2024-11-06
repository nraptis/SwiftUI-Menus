//
//  JiggleViewController+ToolAction.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/25/24.
//

import Foundation

extension JiggleViewController {
    
    func toolActionPerform(_ toolAction: ToolAction) {
        
        guard self.toolAction === nil else {
            fatalError("Cannot Handle 2 Tool Actions At Once...")
        }
        
        //print("Tool Action Enqueud: \(toolAction)")
        
        self.toolAction = toolAction
        
        
    }
    
    func toolActionStep() {
        
        guard let toolAction = toolAction else {
            return
        }
        
        if toolAction.isComplete {
            print("[TA] Tool Action Complete. Oddball case.")
            self.toolAction = nil
        }
        
        guard let phase = toolAction.getPhase() else {
            print("[TA] Tool Action Bugged.")
            self.toolAction = nil
            return
        }
        
        // Did we "apply" this phase?
        // Maybe it takes some time to finish the phase...
        
        if !phase.isConsumed {
            phase.isConsumed = true
            toolActionConsumePhase(phase)
        }
        
        if toolActionIsPhaseExecutionComplete(phase) {
            
            toolAction.advance()
            if toolAction.isComplete {
                print("[TA] Tool Action Complete. Regular case.")
                self.toolAction = nil
            }
        } else {
            
            //
            // Consume the "skip frame" bit...
            //
            
            for slice in phase.slices {
                if (slice.sleepTicks > 0) {
                    print("[TA] SKIPPED FRAME FOR: \(slice)")
                    slice.sleepTicks -= 1
                }
            }
        }
    }
    
    func toolActionConsumePhase(_ phase: ToolActionPhase) {
        for slice in phase.slices {
            toolActionConsumePhaseSlice(slice)
        }
    }
    
    func toolActionIsPhaseExecutionComplete(_ phase: ToolActionPhase) -> Bool {
        
        for slice in phase.slices {
            if (slice.sleepTicks > 0) {
                return false
            }
        }
        
        for blocker in phase.blockers {
            switch blocker {
                
            case .animateMenuConfigurationRows:
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveRegular {
                    return false
                }
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveSwivel {
                    return false
                }
                if toolInterfaceViewModel.isRowAnimationActive {
                    return false
                }
            case .animateMenuExpandOrCollapse:
                if isMenuExpandCollapseAnimating {
                    return false
                }
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveRegular {
                    return false
                }
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveSwivel {
                    return false
                }
                
            case .animateMenuConfigurationVideoOrZoom:
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveRegular {
                    return false
                }
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveSwivel {
                    return false
                }
                if Device.isPad {
                    if padDraggableMenu.isModeAnimating {
                        return false
                    }
                } else {
                    if phoneTopMenu.isModeAnimating {
                        return false
                    }
                }
            case .animateMenuConfigurationGraphOrTimeline:
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveRegular {
                    return false
                }
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveSwivel {
                    return false
                }
                
                if Device.isPad {
                    if padDraggableMenu.standardContainerView.isModeAnimating {
                        return false
                    }
                } else {
                    if phoneTopMenu.standardContainerView.isModeAnimating {
                        return false
                    }
                }
                break
            case .animateDisplayTransition:
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveRegular {
                    return false
                }
                if jiggleViewModel.jiggleScene.isDisplayTransitionActiveSwivel {
                    return false
                }
            }
        }
        
        return true
    }
    
    func toolActionConsumePhaseSlice(_ slice: ToolActionPhaseSlice) {
        switch slice.toolActionPhaseSliceType {
        case .wait:
            break
        case .applyHistoryUndo:
            if let slice = slice as? ToolActionPhaseSliceApplyHistoryUndo {
                toolActionConsumePhaseSliceHistoryUndo(slice)
            }
        case .applyHistoryRedo:
            if let slice = slice as? ToolActionPhaseSliceApplyHistoryRedo {
                toolActionConsumePhaseSliceHistoryRedo(slice)
            }
        case .updateInterfaceConfigurationPad:
            if let slice = slice as? ToolActionPhaseSliceUpdateInterfaceConfigurationPad {
                toolActionConsumePhaseSliceUpdateInterfaceConfigurationPad(slice)
            }
        case .updateInterfaceConfigurationPhone:
            if let slice = slice as? ToolActionPhaseSliceUpdateInterfaceConfigurationPhone {
                toolActionConsumePhaseSliceUpdateInterfaceConfigurationPhone(slice)
            }
        case .prepareInterfaceConfigurationPad:
            if let slice = slice as? ToolActionPhaseSlicePrepareInterfaceConfigurationPad {
                toolActionConsumePhaseSlicePrepareInterfaceConfigurationPad(slice)
            }
        case .prepareInterfaceConfigurationPhone:
            if let slice = slice as? ToolActionPhaseSlicePrepareInterfaceConfigurationPhone {
                toolActionConsumePhaseSlicePrepareInterfaceConfigurationPhone(slice)
            }
        case .setGraphMode:
            if let slice = slice as? ToolActionPhaseSliceSetGraphMode {
                toolActionConsumePhaseSliceSetGraphMode(slice)
            }
        case .setGuidesMode:
            if let slice = slice as? ToolActionPhaseSliceSetGuidesMode {
                toolActionConsumePhaseSliceSetGuidesMode(slice)
            }
        case .setZoomMode:
            if let slice = slice as? ToolActionPhaseSliceSetZoomMode {
                toolActionConsumePhaseSliceSetZoomMode(slice)
            }
        case .setAnimationLoopsMode:
            if let slice = slice as? ToolActionPhaseSliceSetAnimationLoopsMode {
                toolActionConsumePhaseSliceSetAnimationLoopsMode(slice)
            }
        case .setAnimationContinuousMode:
            if let slice = slice as? ToolActionPhaseSliceSetAnimationContinuousMode {
                toolActionConsumePhaseSliceSetAnimationContinuousMode(slice)
            }
            
        case .setLoopsPage:
            if let slice = slice as? ToolActionPhaseSliceSetLoopsPage {
                toolActionConsumePhaseSliceSetLoopsPage(slice)
            }
        case .setTimeLinePage:
                    if let slice = slice as? ToolActionPhaseSliceSetTimeLinePage {
                        toolActionConsumePhaseSliceSetTimeLinePage(slice)
                    }
        case .setContinuousPage:
                    if let slice = slice as? ToolActionPhaseSliceSetContinuousPage {
                        toolActionConsumePhaseSliceSetContinuousPage(slice)
                    }
            
        case .setStereoscopicMode:
            if let slice = slice as? ToolActionPhaseSliceSetStereoscopicMode {
                toolActionConsumePhaseSliceSetStereoscopicMode(slice)
            }
        case .setVideoExportMode:
            if let slice = slice as? ToolActionPhaseSliceSetVideoExportMode {
                toolActionConsumePhaseSliceSetVideoExportMode(slice)
            }
        case .setVideoRecordMode:
            if let slice = slice as? ToolActionPhaseSliceSetVideoRecordMode {
                toolActionConsumePhaseSliceSetVideoRecordMode(slice)
            }
        case .setCreatorMode:
            if let slice = slice as? ToolActionPhaseSliceSetCreatorMode {
                toolActionConsumePhaseSliceSetCreatorMode(slice)
            }
        case .setGraphPage2Mode:
            if let slice = slice as? ToolActionPhaseSliceSetGraphPage2Mode {
                toolActionConsumePhaseSliceSetGraphPage2Mode(slice)
            }
        case .setExpandedDraggable:
            if let slice = slice as? ToolActionPhaseSliceSetExpandedDraggable {
                toolActionConsumePhaseSliceSetExpandedDraggable(slice)
            }
        case .setExpandedPhoneTop:
            if let slice = slice as? ToolActionPhaseSliceSetExpandedPhoneTop {
                toolActionConsumePhaseSliceSetExpandedPhoneTop(slice)
            }
        case .setExpandedPhoneBottom:
            if let slice = slice as? ToolActionPhaseSliceSetExpandedPhoneBottom {
                toolActionConsumePhaseSliceSetExpandedPhoneBottom(slice)
            }
        case .setDocumentMode:
            if let slice = slice as? ToolActionPhaseSliceSetDocumentMode {
                toolActionConsumePhaseSliceSetDocumentMode(slice)
            }
        case .setEditMode:
            if let slice = slice as? ToolActionPhaseSliceSetEditMode {
                toolActionConsumePhaseSliceSetEditMode(slice)
            }
        case .setWeightMode:
            if let slice = slice as? ToolActionPhaseSliceSetWeightMode {
                toolActionConsumePhaseSliceSetWeightMode(slice)
            }
            /*
        case .setAnimationMode:
            if let slice = slice as? ToolActionPhaseSliceSetAnimationMode {
                toolActionConsumePhaseSliceSetAnimationMode(slice)
            }
            */
        case .setTimeLineMode:
            if let slice = slice as? ToolActionPhaseSliceSetTimeLineMode {
                toolActionConsumePhaseSliceSetTimeLineMode(slice)
            }
        case .setDarkModeEnabled:
            if let slice = slice as? ToolActionPhaseSliceSetDarkModeEnabled {
                toolActionConsumePhaseSliceSetDarkModeEnabled(slice)
            }
        case .setPurchasedEnabled:
            if let slice = slice as? ToolActionPhaseSliceSetPurchasedEnabled {
                toolActionConsumePhaseSliceSetPurchasedEnabled(slice)
            }
        case .setRenderingMode:
            if let slice = slice as? ToolActionPhaseSliceSetRenderingMode {
                toolActionConsumePhaseSliceSetRenderingMode(slice)
            }
        case .jiggleMeshCommandOneJiggles:
            if let slice = slice as? ToolActionPhaseSliceJiggleMeshCommandOneJiggle {
                toolActionConsumePhaseSliceJiggleMeshCommandOneJiggle(slice)
            }
        case .jiggleMeshCommandAllJiggles:
            if let slice = slice as? ToolActionPhaseSliceJiggleMeshCommandAllJiggles {
                toolActionConsumePhaseSliceJiggleMeshCommandAllJiggles(slice)
            }
        case .lockShowingState:
            if let slice = slice as? ToolActionPhaseSliceLockState {
                toolActionConsumePhaseSliceLockState(slice)
            }
        case .unlockShowingState:
            if let slice = slice as? ToolActionPhaseSliceUnlockState {
                toolActionConsumePhaseSliceUnlockState(slice)
            }
        case .disableAllCreateModes:
            if let slice = slice as? ToolActionPhaseSliceDisableAllCreateModes {
                toolActionConsumePhaseSliceDisableAllCreateModes(slice)
            }
        case .anyClosure:
            if let slice = slice as? ToolActionPhaseSliceAnyClosure {
                toolActionConsumePhaseSliceAnyClosure(slice)
            }
        }
    }
    
    
}
