//
//  ToolInterfaceViewModel+ButtonActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/24/24.
//

import Foundation
import UIKit

extension ToolInterfaceViewModel {
    
    @MainActor func toolActionAnimationContinuousPage2Enter() {
                print("[IMB] Action - toolActionAnimationContinuousPage2Enter")
                if isBlocked { return }
                
                if let jiggleViewController = jiggleViewController {
                    jiggleViewController.animationContinuousPage2Enter()
                }
                
            }
            
            @MainActor func toolActionAnimationContinuousPage2Exit() {
                print("[IMB] Action - toolActionAnimationContinuousPage2Exit")
                if isBlocked { return }
                
                if let jiggleViewController = jiggleViewController {
                    jiggleViewController.animationContinuousPage2Exit()
                }
            }
    
    @MainActor func toolActionGraphPage2Enter() {
            print("[IMB] Action - toolActionGraphPage2Enter")
            if isBlocked { return }
            
            if let jiggleViewController = jiggleViewController {
                jiggleViewController.graphPage2Enter()
            }
            
        }
        
        @MainActor func toolActionGraphPage2Exit() {
            print("[IMB] Action - toolActionGraphPage2Exit")
            if isBlocked { return }
            
            if let jiggleViewController = jiggleViewController {
                jiggleViewController.graphPage2Exit()
            }
        }
    
    
    @MainActor func toolActionTimeLinePage2Enter() {
        print("[IMB] Action - toolActionTimeLinePage2Enter")
        if isBlocked { return }
        
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLinePage2Enter()
        }
        
    }
    
    @MainActor func toolActionTimeLinePage2Exit() {
        print("[IMB] Action - toolActionTimeLinePage2Exit")
        if isBlocked { return }
        
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLinePage2Exit()
        }
    }
    
    @MainActor func toolActionSwivelRotateRight() {
        print("[IMB] Action - toolActionSwivelRotateRight")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelTiltDown() {
        print("[IMB] Action - toolActionSwivelTiltDown")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelTiltReset() {
        print("[IMB] Action - toolActionSwivelTiltReset")
        if isBlocked { return }
        
    }
    
    
    
    
    @MainActor func toolActionSwivelTiltUp() {
        print("[IMB] Action - toolActionSwivelTiltUp")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelZoomIn() {
        print("[IMB] Action - toolActionSwivelZoomIn")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelZoomOut() {
        print("[IMB] Action - toolActionSwivelZoomOut")
        if isBlocked { return }
        
    }
    
    
    
    @MainActor func toolActionSwivelZoomReset() {
        print("[IMB] Action - toolActionSwivelZoomReset")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionZoomIn() {
        print("[IMB] Action - toolActionZoomIn")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionZoomOut() {
        print("[IMB] Action - toolActionZoomOut")
        if isBlocked { return }
        
    }

    @MainActor func toolActionResetWeightGraphStandard() {
        print("[IMB] Action - toolActionResetWeightGraphStandard")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionResetWeightGraphStandardDampened() {
        print("[IMB] Action - toolActionResetWeightGraphStandardDampened")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelPanLeft() {
        print("[IMB] Action - toolActionSwivelPanLeft")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelPanReset() {
        print("[IMB] Action - toolActionSwivelPanReset")
        if isBlocked { return }
        
    }
    
    
    
    @MainActor func toolActionSwivelPanRight() {
        print("[IMB] Action - toolActionSwivelPanRight")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelRotateLeft() {
        print("[IMB] Action - toolActionSwivelRotateLeft")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionSwivelRotateReset() {
        print("[IMB] Action - toolActionSwivelRotateReset")
        if isBlocked { return }
        
    }
    
    
    
    
    @MainActor func toolActionResetWeightGraphInverse() {
        print("[IMB] Action - toolActionResetWeightGraphInverse")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionResetWeightGraphInverseDampened() {
        print("[IMB] Action - toolActionResetWeightGraphInverseDampened")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionResetWeightGraphLinear() {
        print("[IMB] Action - toolActionResetWeightGraphLinear")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionResetWeightGraphLinearDampened() {
        print("[IMB] Action - toolActionResetWeightGraphLinearDampened")
        if isBlocked { return }
        
    }
    
    
    
    
    
    @MainActor func toolActionBreakTangentWeightGraph() {
        print("[IMB] Action - toolActionBreakTangentWeightGraph")
        if isBlocked { return }
        
    }
    
    
    @MainActor func toolActionCloneJiggle() {
        print("[IMB] Action - CloneJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptCloneJiggle()
    }
    
    @MainActor func toolActionCloneGuide() {
        print("[IMB] Action - CloneJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptCloneJiggle()
    }
    
    @MainActor func toolActionDeleteJiggle() {
        print("[IMB] Action - RemoveJiggle")
        if isBlocked { return }
        jiggleViewModel.attemptDeleteSelectedJiggle(isHistoryAction: false)
    }
    
    @MainActor func toolActionDeleteJigglePoint() {
        print("[IMB] Action - DeleteJigglePoint")
        if isBlocked { return }
        jiggleViewModel.attemptDeleteSelectedJigglePoint()
    }
    
    @MainActor func toolActionDeleteGuide() {
        print("[IMB] Action - DeleteGuide")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.attemptRemoveSelectedGuide(isHistoryAction: false)
        }
    }
    
    @MainActor func toolActionDeleteGuidePoint() {
        print("[IMB] Action - DeleteGuidePoint")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.attemptDeleteSelectedGuidePoint()
        }
    }
    
    
    
    
    @MainActor func toolActionFreezeSelectedGuide() {
        print("[IMB] Action - toolActionFreezeSelectedGuide")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.freezeSelectedGuide()
        }
    }
    
    @MainActor func toolActionFreezeSelectedJiggle() {
        print("[IMB] Action - toolActionFreezeSelectedJiggle")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.freezeSelectedJiggle()
        }
    }
    
    @MainActor func toolActionUnfreezeAllGuides() {
        print("[IMB] Action - toolActionUnfreezeAllGuides")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.unfreezeAllGuides()
        }
    }
    
    @MainActor func toolActionUnfreezeAllJiggles() {
        print("[IMB] Action - toolActionUnfreezeAllJiggles")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.unfreezeAllJiggles()
        }
    }
    
    @MainActor func toolActionLoopsPage1Enter() {
        print("[IMB] Action - toolActionLoopsPage1Enter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage1Enter()
        }
    }
    
    @MainActor func toolActionLoopsPage2Enter() {
        print("[IMB] Action - toolActionLoopsPage2Enter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage2Enter()
        }
    }
    
    @MainActor func toolActionLoopsPage3Enter() {
        print("[IMB] Action - toolActionTimeLineEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Enter()
        }
    }
    
    @MainActor func toolActionLoopsPage1Exit() {
        print("[IMB] Action - toolActionLoopsPage1Exit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Enter()
        }
    }
    
    @MainActor func toolActionLoopsPage2Exit() {
        print("[IMB] Action - toolActionLoopsPage2Exit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage2Exit()
        }
    }
    
    @MainActor func toolActionLoopsPage3Exit() {
        print("[IMB] Action - toolActionLoopsPage3Exit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Exit()
        }
    }
    
    @MainActor func toolActionAnimationContinuousEnter() {
        print("[IMB] Action - toolActionAnimationContinuousEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousEnter()
        }
    }
    
    @MainActor func toolActionAnimationContinuousExit() {
        print("[IMB] Action - toolActionAnimationContinuousExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousExit()
        }
    }
    
    @MainActor func toolActionFlipJiggleH() {
        print("[IMB] Action - toolActionFlipJiggleH")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipJiggleHorizontal()
        }
    }
    
    @MainActor func toolActionFlipJiggleV() {
        print("[IMB] Action - toolActionFlipJiggleV")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipJiggleVertical()
        }
    }
    
    @MainActor func toolActionFlipGuideH() {
        print("[IMB] Action - toolActionFlipGuideH")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipGuideHorizontal()
        }
    }
    
    @MainActor func toolActionFlipGuideV() {
        print("[IMB] Action - toolActionFlipGuideV")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipGuideVertical()
        }
    }
    
    @MainActor func toolActionZoomReset() {
        if isBlocked { return }
        jiggleViewModel.zoomReset()
    }
    
    @MainActor func toolActionZoomJiggle() {
        if isBlocked { return }
        jiggleViewModel.zoomJiggle()
    }
    
    
    
    @MainActor func toolActionSelectNextJigglePoint() {
        if isBlocked { return }
        jiggleViewModel.selectNextJigglePoint()
    }
    @MainActor func toolActionSelectPreviousJigglePoint() {
        if isBlocked { return }
        jiggleViewModel.selectPreviousJigglePoint()
    }
    
    @MainActor func toolActionSelectNextGuidePoint() {
        if isBlocked { return }
        jiggleViewModel.selectNextGuidePoint()
    }
    
    @MainActor func toolActionSelectPreviousGuidePoint() {
        print("[IMB] Action - toolActionSelectPreviousGuidePoint")
        if isBlocked { return }
        jiggleViewModel.selectPreviousGuidePoint()
    }
    
    @MainActor func toolActionSelectNextJiggle() {
        print("[IMB] Action - SelectNextJiggle")
        if isBlocked { return }
        jiggleViewModel.selectNextJiggle()
    }
    @MainActor func toolActionSelectPreviousJiggle() {
        print("[IMB] Action - SelectPreviousJiggle")
        if isBlocked { return }
        jiggleViewModel.selectPreviousJiggle()
    }
    
    @MainActor func toolActionSelectNextGuide() {
        print("[IMB] Action - toolActionSelectNextGuide")
        if isBlocked { return }
        jiggleViewModel.selectNextGuide()
    }
    
    @MainActor func toolActionSelectPreviousGuide() {
        print("[IMB] Action - toolActionSelectPreviousGuide")
        if isBlocked { return }
        jiggleViewModel.selectPreviousGuide()
    }
    
    
    
    @MainActor func toolActionTimeLineFlipAll() {
        print("[IMB] Action - toolActionTimeLineFlipAll")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineFlipAll(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineAmplify() {
        print("[IMB] Action - toolActionTimeLineAmplify")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineAmplify(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineDampen() {
        print("[IMB] Action - toolActionTimeLineDampen")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDampen(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    
    @MainActor func toolActionTimeLineInvertH() {
        print("[IMB] Action - toolActionTimeLineInvertH")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineInvertH(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineInvertV() {
        print("[IMB] Action - toolActionTimeLineInvertV")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineInvertV(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetCurve() {
        print("[IMB] Action - toolActionTimeLineResetCurve")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetCurve(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineBreakPoint() {
        print("[IMB] Action - toolActionTimeLineBreakPoint")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineBreakPoint(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetGraph() {
        print("[IMB] Action - toolActionTimeLineResetGraph")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetGraph(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineDupeAll() {
        print("[IMB] Action - toolActionTimeLineDupeAll")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeAll(selectedJiggle)
            }
        }
    }
    
    @MainActor func toolActionTimeLineDupeDuration() {
        print("[IMB] Action - toolActionTimeLineDupeDuration")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeDuration(selectedJiggle)
            }
        }
    }
    
    @MainActor func toolActionTimeLineDupeCurrentChannel() {
        print("[IMB] Action - toolActionTimeLineDupeCurrentChannel")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeCurrentChannel(selectedJiggle)
            }
        }
    }
    
    @MainActor func toolActionTimeLineResetFlatCurrentChannel() {
        print("[IMB] Action - toolActionTimeLineResetFlatCurrentChannel")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetFlatCurrentChannel(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetDefaultCurrentChannel() {
        print("[IMB] Action - toolActionTimeLineResetDefaultCurrentChannel")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetDefaultCurrentChannel(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimelinePointCountIncrement() {
        print("[IMB] Action - toolActionTimelinePointCountIncrement")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timelinePointCountIncrement(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimelinePointCountDecrement() {
        print("[IMB] Action - toolActionTimelinePointCountDecrement")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timelinePointCountDecrement(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionRotateGuideRight() {
        print("[IMB] Action - toolActionRotateGuideRight")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateGuideRight()
        }
    }
    
    @MainActor func toolActionRotateGuideLeft() {
        print("[IMB] Action - toolActionRotateGuideLeft")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateGuideLeft()
        }
    }
    
    @MainActor func toolActionRotateJiggleRight() {
        print("[IMB] Action - toolActionRotateGuideRight")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateJiggleRight()
        }
    }
    
    @MainActor func toolActionRotateJiggleLeft() {
        print("[IMB] Action - toolActionRotateGuideLeft")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateJiggleLeft()
        }
    }
    
    
    @MainActor func toolActionAnimationLoopsEnter() {
        print("[IMB] Action - toolActionAnimationLoopsEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsEnter()
        }
    }
    @MainActor func toolActionVideoRecordEnter() {
        print("[IMB] Action - toolActionVideoRecordEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoRecordEnter()
        }
    }
    @MainActor func toolActionVideoExportEnter() {
        print("[IMB] Action - toolActionVideoExportEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoExportEnter()
        }
    }
    
    @MainActor func toolActionTimeLineEnter() {
        print("[IMB] Action - toolActionTimeLineEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineEnter()
        }
    }
    
    @MainActor func toolActionZoomEnter() {
        print("[IMB] Action - toolActionZoomEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.zoomEnter()
        }
    }
    
    @MainActor func toolActionZoomExit() {
        print("[IMB] Action - toolActionZoomExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.zoomExit()
        }
    }
    
    @MainActor func toolActionGraphEnter() {
        print("[IMB] Action - toolActionGraphEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphEnter()
        }
    }
    
    @MainActor func toolActionGraphExit() {
        print("[IMB] Action - toolActionGraphExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphExit()
        }
    }
    
    @MainActor func toolActionGuidesEnter() {
        print("[IMB] Action - toolActionGuidesEnter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.guidesEnter()
        }
    }
    
    @MainActor func toolActionAnimationLoopsExit() {
        print("[IMB] Action - toolActionAnimationLoopsExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsExit()
        }
    }
    
    @MainActor func toolActionVideoRecordExit() {
        print("[IMB] Action - toolActionVideoRecordExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoRecordExit()
        }
    }
    
    @MainActor func toolActionVideoExportExit() {
        print("[IMB] Action - toolActionVideoExportExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoExportExit()
        }
    }
    
    @MainActor func toolActionTimeLineExit() {
        print("[IMB] Action - toolActionTimeLineExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineExit()
        }
    }
    
    @MainActor func toolActionGuidesExit() {
        print("[IMB] Action - toolActionGuidesExit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.guidesExit()
        }
    }
    
    @MainActor func toolActionBreakManualWeightGraph() {
        print("[IMB] Action - BreakManualWeightGraph")
        jiggleViewModel.attemptBreakManualWeightGraph()
    }
    
    @MainActor func toolActionRandomizeWeightGraph() {
        print("[IMB] Action - RandomizeWeightGraph")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionRecordCancel() {
        print("[IMB] Action - RecordCancel")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionRecordMovie() {
        print("[IMB] Action - RecordMovie")
        if isBlocked { return }
        
    }
    
    @MainActor func toolActionResetSwivelCamera() {
        print("[IMB] Action - ResetSwivelCamera")
        if isBlocked { return }
    }
    @MainActor func toolActionResetToDefault() {
        print("[IMB] Action - ResetToDefault")
        if isBlocked { return }
    }
    @MainActor func toolActionResetWeightGraph() {
        print("[IMB] Action - ResetWeightGraph")
        if isBlocked { return }
        jiggleViewModel.attemptResetWeightGraph()
    }
    
    @MainActor func toolActionResetZoom() {
        print("[IMB] Action - ResetZoom")
        if isBlocked { return }
        jiggleViewModel.setResetZoomActive()
    }
   
    @MainActor func toolActionUndo() {
        print("[IMB] Action - Undo")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            
            jiggleViewController.undo()
        }
    }
    
    @MainActor func toolActionRedo() {
        print("[IMB] Action - Redo")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.redo()
        }
    }
    
    @MainActor func toolActionResetCenterGuide() {
        print("[IMB] Action - ResetCenterGuide")
        if isBlocked { return }
    }
    
    @MainActor func toolActionResetCenterJiggle() {
        print("[IMB] Action - ResetCenterJiggle")
        if isBlocked { return }
    }
    
    @MainActor func toolActionPhoneToggleTopMenu() {
        print("[IMB] Action - PhoneToggleTopMenu")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.toolActionPhoneToggleTopMenu()
        }
    }
    
    @MainActor func toolActionPhoneToggleBottomMenu() {
        print("[IMB] Action - PhoneToggleBottomMenu")
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.toolActionPhoneToggleBottomMenu()
        }
    }
    
    @MainActor func toolActionPadCollapseMenu() {
        print("[IMB] Action - PadCollapseMenu")
    }
    
    @MainActor func toolActionPadExpandMenu() {
        print("[IMB] Action - PadExpandMenu")
    }
    
    @MainActor func toolActionTest1() {
        print("[IMB] Action - Test1")
    }
    
    @MainActor func toolActionTest2() {
        print("[IMB] Action - Test2")
    }
    
    @MainActor func toolActionTest3() {
        print("[IMB] Action - Test3")
    }
    
    @MainActor func toolActionExitViewMode() {
        print("[IMB] Action - ExitViewMode")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.set(documentMode: .edit)
        }
    }
    
    @MainActor func toolActionGenerateTopography() {
        print("[IMB] Action - GenerateTopography")
        if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.editRings) { _ in }
            } else {
                ApplicationController.rootViewController.pushDialogBox(DialogBoxModel.noJiggleSelected) { _ in }
            }
        }
    }
    
    @MainActor func toolActionFreezeOnAllUnselectedJiggle() {
        print("[IMB] Action - FreezeOnAllUnselectedJiggle")
        
    }
    
    @MainActor func toolActionFreezeOnAllUnselectedGuide() {
        print("[IMB] Action - FreezeOnAllUnselectedGuide")
        
    }
    
    @MainActor func toolActionSendFrontJiggle() {
        print("[IMB] Action - SendFrontJiggle")
        
    }
    
    @MainActor func toolActionExitRecordMode() {
        print("[IMB] Action - ExitRecordMode")
        
    }
    
    @MainActor func toolActionResetCenterWeightGeometry() {
        print("[IMB] Action - ResetCenterWeightGeometry")
        
    }
    
    @MainActor func toolActionResetSwivelFront() {
        print("[IMB] Action - ResetSwivelFront")
        
    }
    
    @MainActor func toolActionResetSwivelBack() {
        print("[IMB] Action - ResetSwivelBack")
        
    }
    
    @MainActor func toolActionResetSwivelLeft() {
        print("[IMB] Action - ResetSwivelLeft")
        
    }
    
    @MainActor func toolActionResetSwivelRight() {
        print("[IMB] Action - ResetSwivelRight")
        
    }
    
    @MainActor func toolActionResetSwivelTilt() {
        print("[IMB] Action - ResetSwivelTilt")
        
    }
    
    @MainActor func toolActionIncreaseJigglePoints() {
        print("[IMB] Action - IncreaseJigglePoints")
        
    }
    
    @MainActor func toolActionIncreaseGuidePoints() {
        print("[IMB] Action - IncreaseGuidePoints")
        
    }
    
    @MainActor func toolActionSideMenuEnter() {
        print("[IMB] Action - MainMenu Enter")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.sideMenuEnter()
        }
    }
    
    @MainActor func toolActionSideMenuExit() {
        print("[IMB] Action - MainMenu Exit")
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.sideMenuExit()
        }
    }
    
    @MainActor func toolActionMainMenu() {
        print("[IMB] Action - MainMenu Exit")
        ApplicationController.rootViewModel.pushToMainMenu(animated: true, reversed: false)
    }
}
