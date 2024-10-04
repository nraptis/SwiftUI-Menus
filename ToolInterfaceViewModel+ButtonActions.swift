//
//  ToolInterfaceViewModel+ButtonActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/24/24.
//

import Foundation
import UIKit

extension ToolInterfaceViewModel {
    
    func toolActionCloneJiggle() {
        print("[IMB] Action - CloneJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptCloneJiggle()
    }
    
    func toolActionCloneGuide() {
        print("[IMB] Action - CloneJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptCloneJiggle()
    }
    
    func toolActionDeleteJiggle() {
        print("[IMB] Action - RemoveJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptDeleteSelectedJiggle(isHistoryAction: false)
    }
    
    func toolActionDeleteJigglePoint() {
        print("[IMB] Action - DeleteJigglePoint")
        if isBlocked { return }
        jiggleViewModel.attemptDeleteSelectedJigglePoint()
    }
    
    func toolActionDeleteGuide() {
        print("[IMB] Action - DeleteGuide")
        if isBlocked { return }
        jiggleViewModel.attemptRemoveSelectedGuide(isHistoryAction: false)
    }
    func toolActionDeleteGuidePoint() {
        print("[IMB] Action - DeleteGuidePoint")
        if isBlocked { return }
        jiggleViewModel.attemptDeleteSelectedGuidePoint()
    }
    
    
    
    
    func toolActionFreezeSelectedGuide() {
        print("[IMB] Action - toolActionFreezeSelectedGuide")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.freezeSelectedGuide()
        }
    }
    
    func toolActionFreezeSelectedJiggle() {
        print("[IMB] Action - toolActionFreezeSelectedJiggle")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.freezeSelectedJiggle()
        }
    }
    
    func toolActionUnfreezeAllGuides() {
        print("[IMB] Action - toolActionUnfreezeAllGuides")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.unfreezeAllGuides()
        }
    }
    
    func toolActionUnfreezeAllJiggles() {
        print("[IMB] Action - toolActionUnfreezeAllJiggles")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.unfreezeAllJiggles()
        }
    }
    
    func toolActionLoopsPage1Enter() {
        print("[IMB] Action - toolActionLoopsPage1Enter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage1Enter()
        }
    }
    
    func toolActionLoopsPage2Enter() {
        print("[IMB] Action - toolActionLoopsPage2Enter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage2Enter()
        }
    }
    
    func toolActionLoopsPage3Enter() {
        print("[IMB] Action - toolActionTimeLineEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Enter()
        }
    }
    
    func toolActionAnimationContinuousEnter() {
        print("[IMB] Action - toolActionAnimationContinuousEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousEnter()
        }
    }
    
    func toolActionAnimationContinuousExit() {
        print("[IMB] Action - toolActionAnimationContinuousExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousExit()
        }
    }
    
    func toolActionFlipJiggleH() {
        print("[IMB] Action - toolActionFlipJiggleH")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipJiggleHorizontal()
        }
    }
    
    func toolActionFlipJiggleV() {
        print("[IMB] Action - toolActionFlipJiggleV")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipJiggleVertical()
        }
    }
    
    func toolActionFlipGuideH() {
        print("[IMB] Action - toolActionFlipGuideH")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipGuideHorizontal()
        }
    }
    
    func toolActionFlipGuideV() {
        print("[IMB] Action - toolActionFlipGuideV")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipGuideVertical()
        }
    }
    
    func toolActionZoomReset() {
        if isBlocked { return }
        jiggleViewModel.zoomReset()
    }
    
    func toolActionZoomJiggle() {
        if isBlocked { return }
        jiggleViewModel.zoomJiggle()
    }
    
    
    
    func toolActionSelectNextJigglePoint() {
        if isBlocked { return }
        jiggleViewModel.selectNextJigglePoint()
    }
    func toolActionSelectPreviousJigglePoint() {
        if isBlocked { return }
        jiggleViewModel.selectPreviousJigglePoint()
    }
    
    func toolActionSelectNextGuidePoint() {
        if isBlocked { return }
        jiggleViewModel.selectNextGuidePoint()
    }
    
    func toolActionSelectPreviousGuidePoint() {
        print("[IMB] Action - toolActionSelectPreviousGuidePoint")
        if isBlocked { return }
        jiggleViewModel.selectPreviousGuidePoint()
    }
    
    func toolActionSelectNextJiggle() {
        print("[IMB] Action - SelectNextJiggle")
        if isBlocked { return }
        jiggleViewModel.selectNextJiggle()
    }
    func toolActionSelectPreviousJiggle() {
        print("[IMB] Action - SelectPreviousJiggle")
        if isBlocked { return }
        jiggleViewModel.selectPreviousJiggle()
    }
    
    func toolActionSelectNextGuide() {
        print("[IMB] Action - toolActionSelectNextGuide")
        if isBlocked { return }
        jiggleViewModel.selectNextGuide()
    }
    
    func toolActionSelectPreviousGuide() {
        print("[IMB] Action - toolActionSelectPreviousGuide")
        if isBlocked { return }
        jiggleViewModel.selectPreviousGuide()
    }
    
    
    
    func toolActionTimeLineFlipAll() {
        print("[IMB] Action - toolActionTimeLineFlipAll")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineFlipAll(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineAmplify() {
        print("[IMB] Action - toolActionTimeLineAmplify")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineAmplify(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineDampen() {
        print("[IMB] Action - toolActionTimeLineDampen")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDampen(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    
    func toolActionTimeLineInvertH() {
        print("[IMB] Action - toolActionTimeLineInvertH")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineInvertH(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineInvertV() {
        print("[IMB] Action - toolActionTimeLineInvertV")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineInvertV(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineResetCurve() {
        print("[IMB] Action - toolActionTimeLineResetCurve")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetCurve(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineBreakPoint() {
        print("[IMB] Action - toolActionTimeLineBreakPoint")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineBreakPoint(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineResetGraph() {
        print("[IMB] Action - toolActionTimeLineResetGraph")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetGraph(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineDupeAll() {
        print("[IMB] Action - toolActionTimeLineDupeAll")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeAll(selectedJiggle)
            }
        }
    }
    
    func toolActionTimeLineDupeDuration() {
        print("[IMB] Action - toolActionTimeLineDupeDuration")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeDuration(selectedJiggle)
            }
        }
    }
    
    func toolActionTimeLineDupeCurrentChannel() {
        print("[IMB] Action - toolActionTimeLineDupeCurrentChannel")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeCurrentChannel(selectedJiggle)
            }
        }
    }
    
    func toolActionTimeLineFlattenCurrentChannel() {
        print("[IMB] Action - toolActionTimeLineFlattenCurrentChannel")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineFlattenCurrentChannel(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimeLineResetDefaultCurrentChannel() {
        print("[IMB] Action - toolActionTimeLineResetDefaultCurrentChannel")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetDefaultCurrentChannel(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimelinePointCountIncrement() {
        print("[IMB] Action - toolActionTimelinePointCountIncrement")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timelinePointCountIncrement(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    func toolActionTimelinePointCountDecrement() {
        print("[IMB] Action - toolActionTimelinePointCountDecrement")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timelinePointCountDecrement(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
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
    
    
    func toolActionAnimationLoopsEnter() {
        print("[IMB] Action - toolActionAnimationLoopsEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsEnter()
        }
    }
    func toolActionVideoRecordEnter() {
        print("[IMB] Action - toolActionVideoRecordEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoRecordEnter()
        }
    }
    func toolActionVideoExportEnter() {
        print("[IMB] Action - toolActionVideoExportEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoExportEnter()
        }
    }
    
    func toolActionTimeLineEnter() {
        print("[IMB] Action - toolActionTimeLineEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineEnter()
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
    
    func toolActionAnimationLoopsExit() {
        print("[IMB] Action - toolActionAnimationLoopsExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsExit()
        }
    }
    
    func toolActionVideoRecordExit() {
        print("[IMB] Action - toolActionVideoRecordExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoRecordExit()
        }
    }
    
    func toolActionVideoExportExit() {
        print("[IMB] Action - toolActionVideoExportExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoExportExit()
        }
    }
    
    func toolActionTimeLineExit() {
        print("[IMB] Action - toolActionTimeLineExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineExit()
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
    
    
    
    func toolActionSendBackJiggle() {
        print("[IMB] Action - SendBackJiggle")
        if isBlocked { return }
    }
    func toolActionSendBackGuide() {
        print("[IMB] Action - SendBackGuide")
        if isBlocked { return }
    }
    func toolActionSendBackwardJiggle() {
        print("[IMB] Action - SendBackwardJiggle")
        if isBlocked { return }
    }
    func toolActionSendBackwardGuide() {
        print("[IMB] Action - SendBackwardGuide")
        if isBlocked { return }
    }
    func toolActionSendForwardJiggle() {
        print("[IMB] Action - SendForwardJiggle")
        if isBlocked { return }
    }
    func toolActionSendForwardGuide() {
        print("[IMB] Action - SendForwardGuide")
        if isBlocked { return }
    }
    func toolActionSendFrontGuide() {
        print("[IMB] Action - SendFrontGuide")
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
    
    func toolActionResetCenterGuide() {
        print("[IMB] Action - ResetCenterGuide")
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
    
    func toolActionFreezeOnAllUnselectedGuide() {
        print("[IMB] Action - FreezeOnAllUnselectedGuide")
        
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
    
    func toolActionIncreaseGuidePoints() {
        print("[IMB] Action - IncreaseGuidePoints")
        
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
