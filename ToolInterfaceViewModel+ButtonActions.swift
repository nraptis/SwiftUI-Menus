//
//  ToolInterfaceViewModel+ButtonActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/24/24.
//

import Foundation
import UIKit

extension ToolInterfaceViewModel {
    
    
    func toolActionRotateGuideRight() {
        print("[IMB] Action - toolActionRotateGuideRight")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateGuideRight()
        }
    }

    func toolActionRotateGuideLeft() {
        print("[IMB] Action - toolActionRotateGuideLeft")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateGuideLeft()
        }
    }
    
    func toolActionRotateJiggleRight() {
        print("[IMB] Action - toolActionRotateGuideRight")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateJiggleRight()
        }
    }

    func toolActionRotateJiggleLeft() {
        print("[IMB] Action - toolActionRotateGuideLeft")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateJiggleLeft()
        }
    }
    
    
    func toolActionZoomEnter() {
        print("[IMB] Action - toolActionZoomEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.zoomEnter()
        }
    }
    
    func toolActionZoomExit() {
        print("[IMB] Action - toolActionZoomExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.zoomExit()
        }
    }
    
    func toolActionGraphEnter() {
        print("[IMB] Action - toolActionGraphEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphEnter()
        }
    }
    
    func toolActionGraphExit() {
        print("[IMB] Action - toolActionGraphExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphExit()
        }
    }
    
    func toolActionGuidesEnter() {
        print("[IMB] Action - toolActionGuidesEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.guidesEnter()
        }
    }
    
    func toolActionGuidesExit() {
        print("[IMB] Action - toolActionGuidesExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.guidesExit()
        }
    }
    
    func toolActionBreakManualWeightGraph() {
        print("[IMB] Action - BreakManualWeightGraph")
        jiggleViewModel.attemptBreakManualWeightGraph()
    }
    
    func toolActionCloneJiggle() {
        print("[IMB] Action - CloneJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptCloneJiggle()
    }
    
    func toolActionCloneWeightRing() {
        print("[IMB] Action - CloneWeightRing")
        if isBlocked { return }
        
    }
    func toolActionCloseWeightGraph() {
        print("[IMB] Action - CloseWeightGraph")
        if isBlocked { return }
        
        
        /*
         
         if let jiggleViewController = jiggleViewController {
         let time = JiggleViewController.getGraphAnimationTime(orientation: orientation)
         var previousDisplayMode = jiggleViewModel.displayMode
         var currentDisplayMode = jiggleViewModel.displayMode
         if jiggleViewModel.jiggleDocument.documentMode != .weights {
         previousDisplayMode = .regular
         currentDisplayMode = .regular
         }
         jiggleViewController.exitGraphModeSafe(time: time,
         previousDisplayMode: previousDisplayMode,
         currentDisplayMode: currentDisplayMode)
         }
         
         */
        
    }
    func toolActionCreateJiggle() {
        print("[IMB] Action - CreateJiggle")
        if isBlocked { return }
        
        jiggleViewModel.createJiggleStandardEnable()
    }
    func toolActionCreatePoint() {
        print("[IMB] Action - CreatePoint")
        // not used
    }
    func toolActionCreateWeightRing() {
        print("[IMB] Action - CreateWeightRing")
        // not used
        
    }
    
    func toolActionCreateWeightRingPoint() {
        print("[IMB] Action - CreateWeightRingPoint")
        // not used
        
    }
    
    func toolActionDrawJiggles() {
        print("[IMB] Action - DrawJiggles")
        // not used
    }
    
    func toolActionDrawWeightRing() {
        print("[IMB] Action - DrawWeightRing")
        // not used
    }
    
    func toolActionFlipHorizontalJiggle() {
        print("[IMB] Action - FlipHorizontalJiggle")
        if isBlocked { return }
    }
    
    func toolActionFlipHorizontalWeightRing() {
        print("[IMB] Action - FlipHorizontalWeightRing")
        if isBlocked { return }
    }
    
    func toolActionFlipVerticalJiggle() {
        print("[IMB] Action - FlipVerticalJiggle")
        if isBlocked { return }
    }
    
    func toolActionFlipVerticalWeightRing() {
        print("[IMB] Action - FlipVerticalWeightRing")
        if isBlocked { return }
    }
    
    func toolActionFreezeOffAllJiggle() {
        print("[IMB] Action - FreezeOffAllJiggle")
        if isBlocked { return }
        
        jiggleViewModel.unfreezeAllJiggles()
    }
    
    func toolActionFreezeOffAllWeightRing() {
        print("[IMB] Action - FreezeOffAllWeightRing")
        if isBlocked { return }
    }
    
    func toolActionFreezeOnAllJiggle() {
        print("[IMB] Action - FreezeOnAllJiggle")
        if isBlocked { return }
        
    }
    
    func toolActionFreezeOnAllWeightRing() {
        print("[IMB] Action - FreezeOnAllWeightRing")
        if isBlocked { return }
        
    }
    
    func toolActionFreezeOnSelectedJiggle() {
        print("[IMB] Action - FreezeOnSelectedJiggle")
        if isBlocked { return }
        jiggleViewModel.freezeSelectedJiggle()
    }
    
    func toolActionFreezeOnSelectedWeightRing() {
        print("[IMB] Action - FreezeOnSelectedWeightRing")
        if isBlocked { return }
        
    }
    
    func toolActionRandomizeWeightGraph() {
        print("[IMB] Action - RandomizeWeightGraph")
        if isBlocked { return }
        
    }
    
    func toolActionRecordCancel() {
        print("[IMB] Action - RecordCancel")
        if isBlocked { return }
        
    }
    
    func toolActionRecordMovie() {
        print("[IMB] Action - RecordMovie")
        if isBlocked { return }
        
    }
    func toolActionRemoveJiggle() {
        print("[IMB] Action - RemoveJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptRemoveSelectedJiggle(isHistoryAction: false)
    }
    func toolActionRemovePoint() {
        print("[IMB] Action - RemovePoint")
        if isBlocked { return }
        jiggleViewModel.attemptRemoveSelectedControlPoint()
    }
    func toolActionRemoveWeightRing() {
        print("[IMB] Action - RemoveWeightRing")
        if isBlocked { return }
        jiggleViewModel.attemptRemoveSelectedWeightRing(isHistoryAction: false)
    }
    func toolActionRemoveWeightRingPoint() {
        print("[IMB] Action - RemoveWeightRingPoint")
        if isBlocked { return }
        jiggleViewModel.attemptRemoveSelectedWeightControlPoint()
    }
    func toolActionResetSwivelCamera() {
        print("[IMB] Action - ResetSwivelCamera")
        if isBlocked { return }
    }
    func toolActionResetToDefault() {
        print("[IMB] Action - ResetToDefault")
        if isBlocked { return }
    }
    func toolActionResetWeightGraph() {
        print("[IMB] Action - ResetWeightGraph")
        if isBlocked { return }
        jiggleViewModel.attemptResetWeightGraph()
    }
    func toolActionResetZoom() {
        print("[IMB] Action - ResetZoom")
        if isBlocked { return }
        jiggleViewModel.setResetZoomActive()
    }
    func toolActionResetZoomSelectedJiggle() {
        print("[IMB] Action - ResetZoomSelectedJiggle")
        if isBlocked { return }
    }
    func toolActionSelectNextJiggle() {
        print("[IMB] Action - SelectNextJiggle")
        if isBlocked { return }
        jiggleViewModel.selectNextJiggle()
    }
    func toolActionSelectNextPoint() {
        print("[IMB] Action - SelectNextPoint")
        if isBlocked { return }
    }
    func toolActionSelectNextWeightRing() {
        print("[IMB] Action - SelectNextWeightRing")
        if isBlocked { return }
    }
    func toolActionSelectNextWeightRingPoint() {
        print("[IMB] Action - SelectNextWeightRingPoint")
        if isBlocked { return }
    }
    func toolActionSelectPreviousJiggle() {
        print("[IMB] Action - SelectPreviousJiggle")
        if isBlocked { return }
        jiggleViewModel.selectPreviousJiggle()
    }
    func toolActionSelectPreviousPoint() {
        print("[IMB] Action - SelectPreviousPoint")
        if isBlocked { return }
        
    }
    func toolActionSelectPreviousWeightRing() {
        print("[IMB] Action - SelectPreviousWeightRing")
        if isBlocked { return }
    }
    func toolActionSelectPreviousWeightRingPoint() {
        print("[IMB] Action - SelectPreviousWeightRingPoint")
        if isBlocked { return }
    }
    func toolActionSendBackJiggle() {
        print("[IMB] Action - SendBackJiggle")
        if isBlocked { return }
    }
    func toolActionSendBackWeightRing() {
        print("[IMB] Action - SendBackWeightRing")
        if isBlocked { return }
    }
    func toolActionSendBackwardJiggle() {
        print("[IMB] Action - SendBackwardJiggle")
        if isBlocked { return }
    }
    func toolActionSendBackwardWeightRing() {
        print("[IMB] Action - SendBackwardWeightRing")
        if isBlocked { return }
    }
    func toolActionSendForwardJiggle() {
        print("[IMB] Action - SendForwardJiggle")
        if isBlocked { return }
    }
    func toolActionSendForwardWeightRing() {
        print("[IMB] Action - SendForwardWeightRing")
        if isBlocked { return }
    }
    func toolActionSendFrontWeightRing() {
        print("[IMB] Action - SendFrontWeightRing")
        if isBlocked { return }
    }
    func toolActionUndo() {
        print("[IMB] Action - Undo")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            
            jiggleViewController.undo()
        }
    }
    func toolActionRedo() {
        print("[IMB] Action - Redo")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.redo()
        }
    }
    
    func toolActionResetCenterWeightRing() {
        print("[IMB] Action - ResetCenterWeightRing")
        if isBlocked { return }
    }
    
    func toolActionResetCenterJiggle() {
        print("[IMB] Action - ResetCenterJiggle")
        if isBlocked { return }
    }
    
    func toolActionPhoneToggleTopMenu() {
        print("[IMB] Action - PhoneToggleTopMenu")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.toolActionPhoneToggleTopMenu()
        }
    }
    
    func toolActionPhoneToggleBottomMenu() {
        print("[IMB] Action - PhoneToggleBottomMenu")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.toolActionPhoneToggleBottomMenu()
        }
    }
    
    func toolActionPadCollapseMenu() {
        print("[IMB] Action - PadCollapseMenu")
    }
    
    func toolActionPadExpandMenu() {
        print("[IMB] Action - PadExpandMenu")
    }
    
    func toolActionTest1() {
        print("[IMB] Action - Test1")
    }
    
    func toolActionTest2() {
        print("[IMB] Action - Test2")
    }
    
    func toolActionTest3() {
        print("[IMB] Action - Test3")
    }
    
    func toolActionExitViewMode() {
        print("[IMB] Action - ExitViewMode")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.set(documentMode: .__EDIT)
        }
    }
    
    func toolActionGenerateTopography() {
        print("[IMB] Action - GenerateTopography")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.editRings) { _ in }
            } else {
                ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.noJiggleSelected) { _ in }
            }
        }
    }
    
    func toolActionFreezeOnAllUnselectedJiggle() {
        print("[IMB] Action - FreezeOnAllUnselectedJiggle")
        
    }
    
    func toolActionFreezeOnAllUnselectedWeightRing() {
        print("[IMB] Action - FreezeOnAllUnselectedWeightRing")
        
    }
    
    func toolActionSendFrontJiggle() {
        print("[IMB] Action - SendFrontJiggle")
        
    }
    
    func toolActionExitRecordMode() {
        print("[IMB] Action - ExitRecordMode")
        
    }
    
    func toolActionResetCenterWeightGeometry() {
        print("[IMB] Action - ResetCenterWeightGeometry")
        
    }
    
    func toolActionResetSwivelFront() {
        print("[IMB] Action - ResetSwivelFront")
        
    }
    
    func toolActionResetSwivelBack() {
        print("[IMB] Action - ResetSwivelBack")
        
    }
    
    func toolActionResetSwivelLeft() {
        print("[IMB] Action - ResetSwivelLeft")
        
    }
    
    func toolActionResetSwivelRight() {
        print("[IMB] Action - ResetSwivelRight")
        
    }
    
    func toolActionResetSwivelTilt() {
        print("[IMB] Action - ResetSwivelTilt")
        
    }
    
    func toolActionIncreaseJigglePoints() {
        print("[IMB] Action - IncreaseJigglePoints")
        
    }
    
    func toolActionIncreaseWeightRingPoints() {
        print("[IMB] Action - IncreaseWeightRingPoints")
        
    }
    
    func toolActionSideMenuEnter() {
        print("[IMB] Action - MainMenu Enter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.sideMenuEnter()
        }
    }
    
    func toolActionSideMenuExit() {
        print("[IMB] Action - MainMenu Exit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.sideMenuExit()
        }
    }
    
    func toolActionMainMenu() {
        print("[IMB] Action - MainMenu Exit")
        Task { @MainActor in
            ApplicationController.rootViewModel.pushToMainMenu(animated: true, reversed: false)
        }
    }
}
