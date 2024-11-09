//
//  ToolInterfaceViewModel+ButtonActions.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/24/24.
//

import Foundation
import UIKit

extension ToolInterfaceViewModel {
    
    @MainActor func toolActionContinuousResetAngleDiag1() {
        print("[IMB] Action - ContinuousResetAngleDiag1")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetAngleDiag1()
        }
    }
    
    @MainActor func toolActionContinuousResetAngleDiag2() {
        print("[IMB] Action - ContinuousResetAngleDiag2")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetAngleDiag2()
        }
    }
    
    @MainActor func toolActionContinuousResetAngleHorizontal() {
        print("[IMB] Action - ContinuousResetAngleHorizontal")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetAngleHorizontal()
        }
    }
    
    @MainActor func toolActionContinuousResetAngleVertical() {
        print("[IMB] Action - ContinuousResetAngleVertical")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetAngleVertical()
        }
    }
    
    @MainActor func toolActionContinuousResetEndRotation() {
        print("[IMB] Action - ContinuousResetEndRotation")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetEndRotation()
        }
    }
    
    @MainActor func toolActionContinuousResetEndScale() {
        print("[IMB] Action - ContinuousResetEndScale")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetEndScale()
        }
    }

    @MainActor func toolActionContinuousResetStartRotation() {
        print("[IMB] Action - ContinuousResetStartRotation")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetStartRotation()
        }
    }
    
    @MainActor func toolActionContinuousResetStartScale() {
        print("[IMB] Action - ContinuousResetStartScale")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetStartScale()
        }
    }
    
    @MainActor func toolActionContinuousResetSwoop() {
        print("[IMB] Action - ContinuousResetSwoop")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetSwoop()
        }
    }
    
    @MainActor func toolActionContinuousSyncFrames() {
        print("[IMB] Action - ContinuousSyncFrames")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousSyncFrames()
        }
    }
    
    @MainActor func toolActionContinuousInvertAngles() {
        print("[IMB] Action - ContinuousInvertAngles")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousInvertAngles()
        }
    }
    
    @MainActor func toolActionContinuousInvertRotation() {
        print("[IMB] Action - ContinuousInvertRotation")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousInvertRotation()
        }
    }
    
    @MainActor func toolActionContinuousInvertSwoop() {
        print("[IMB] Action - ContinuousInvertSwoop")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousInvertSwoop()
        }
    }
    
    @MainActor func toolActionContinuousResetFrameOffset() {
        print("[IMB] Action - ContinuousResetFrameOffset")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousResetFrameOffset()
        }
    }
    
    @MainActor func toolActionContinuousShuffleGroup1() {
        print("[IMB] Action - ContinuousShuffleGroup1")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousShuffleGroup1()
        }
    }
    
    @MainActor func toolActionContinuousShuffleGroup2() {
        print("[IMB] Action - ContinuousShuffleGroup2")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousShuffleGroup2()
        }
    }
    
    @MainActor func toolActionContinuousShuffleGroup3() {
        print("[IMB] Action - ContinuousShuffleGroup3")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousShuffleGroup3()
        }
    }
    
    @MainActor func toolActionContinuousResetGroup1() {
            print("[IMB] Action - ContinuousResetGroup1")
            if isBlocked { return }
            if let jiggleViewModel = jiggleViewModel {
                jiggleViewModel.continuousResetGroup1()
            }
        }
        
        @MainActor func toolActionContinuousResetGroup2() {
            print("[IMB] Action - ContinuousResetGroup2")
            if isBlocked { return }
            if let jiggleViewModel = jiggleViewModel {
                jiggleViewModel.continuousResetGroup2()
            }
        }
        
        @MainActor func toolActionContinuousResetGroup3() {
            print("[IMB] Action - ContinuousResetGroup3")
            if isBlocked { return }
            if let jiggleViewModel = jiggleViewModel {
                jiggleViewModel.continuousResetGroup3()
            }
        }
    
    @MainActor func toolActionContinuousSwapRotation() {
        print("[IMB] Action - ContinuousSwapRotation")
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.continuousSwapRotation()
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

    @MainActor func toolActionCloneJiggle() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.attemptCloneJiggle()
        }
    }
    
    @MainActor func toolActionCloneGuide() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.attemptCloneGuide()
        }
    }
    
    @MainActor func toolActionDeleteJiggle() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.attemptDeleteSelectedJiggle(isHistoryAction: false)
        }
    }
    
    @MainActor func toolActionDeleteJigglePoint() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.attemptDeleteSelectedJigglePoint()
        }
    }
    
    @MainActor func toolActionDeleteGuide() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.attemptRemoveSelectedGuide(isHistoryAction: false)
        }
    }
    
    @MainActor func toolActionDeleteGuidePoint() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.attemptDeleteSelectedGuidePoint()
        }
    }
    
    @MainActor func toolActionFreezeSelectedGuide() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.freezeSelectedGuide()
        }
    }
    
    @MainActor func toolActionFreezeSelectedJiggle() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.freezeSelectedJiggle()
        }
    }
    
    @MainActor func toolActionUnfreezeAllGuides() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.unfreezeAllGuides()
        }
    }
    
    @MainActor func toolActionUnfreezeAllJiggles() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.unfreezeAllJiggles()
        }
    }
    
    @MainActor func toolActionContinuousPage1Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousPage1Enter()
        }
    }

    @MainActor func toolActionContinuousPage1Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousPage3Enter()
        }
    }

    @MainActor func toolActionContinuousPage2Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousPage2Enter()
        }
    }

    @MainActor func toolActionContinuousPage2Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousPage2Exit()
        }
    }

    @MainActor func toolActionContinuousPage3Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousPage3Enter()
        }
    }

    @MainActor func toolActionContinuousPage3Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousPage3Exit()
        }
    }
    
    @MainActor func toolActionTimeLinePage1Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationTimeLinePage1Enter()
        }
    }

    @MainActor func toolActionTimeLinePage1Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationTimeLinePage3Enter()
        }
    }

    @MainActor func toolActionTimeLinePage2Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationTimeLinePage2Enter()
        }
    }

    @MainActor func toolActionTimeLinePage2Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationTimeLinePage2Exit()
        }
    }

    @MainActor func toolActionTimeLinePage3Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationTimeLinePage3Enter()
        }
    }

    @MainActor func toolActionTimeLinePage3Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationTimeLinePage3Exit()
        }
    }
    
    @MainActor func toolActionGraphPage1Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphPage1Enter()
        }
    }

    @MainActor func toolActionGraphPage1Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphPage3Enter()
        }
    }

    @MainActor func toolActionGraphPage2Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphPage2Enter()
        }
    }

    @MainActor func toolActionGraphPage2Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphPage2Exit()
        }
    }

    @MainActor func toolActionGraphPage3Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphPage3Enter()
        }
    }

    @MainActor func toolActionGraphPage3Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphPage3Exit()
        }
    }
    
    @MainActor func toolActionLoopsPage1Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage1Enter()
        }
    }

    @MainActor func toolActionLoopsPage1Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Enter()
        }
    }

    @MainActor func toolActionLoopsPage2Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage2Enter()
        }
    }

    @MainActor func toolActionLoopsPage2Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage2Exit()
        }
    }

    @MainActor func toolActionLoopsPage3Enter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Enter()
        }
    }

    @MainActor func toolActionLoopsPage3Exit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsPage3Exit()
        }
    }
    
    @MainActor func toolActionAnimationContinuousEnter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousEnter()
        }
    }
    
    @MainActor func toolActionAnimationContinuousExit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationContinuousExit()
        }
    }
    
    @MainActor func toolActionFlipJiggleH() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipJiggleHorizontal()
        }
    }
    
    @MainActor func toolActionFlipJiggleV() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipJiggleVertical()
        }
    }
    
    @MainActor func toolActionFlipGuideH() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipGuideHorizontal()
        }
    }
    
    @MainActor func toolActionFlipGuideV() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.flipGuideVertical()
        }
    }
    
    @MainActor func toolActionZoomReset() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.zoomReset()
        }
    }
    
    @MainActor func toolActionZoomJiggle() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.zoomJiggle()
        }
    }
    
    @MainActor func toolActionSelectNextJigglePoint() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectNextJigglePoint()
        }
    }
    @MainActor func toolActionSelectPreviousJigglePoint() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectPreviousJigglePoint()
        }
    }
    
    @MainActor func toolActionSelectNextGuidePoint() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectNextGuidePoint()
        }
    }
    
    @MainActor func toolActionSelectPreviousGuidePoint() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectPreviousGuidePoint()
        }
    }
    
    @MainActor func toolActionSelectNextJiggle() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectNextJiggle()
        }
    }
    @MainActor func toolActionSelectPreviousJiggle() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectPreviousJiggle()
        }
    }
    
    @MainActor func toolActionSelectNextGuide() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectNextGuide()
        }
    }
    
    @MainActor func toolActionSelectPreviousGuide() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.selectPreviousGuide()
        }
    }
    
    @MainActor func toolActionTimeLineSyncFrames() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.timeLineSyncFrames()
        }
    }
    
    @MainActor func toolActionTimeLineFlipAll() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineFlipAll(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineFlipCurrentChannelHorizontal() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineFlipCurrentChannelHorizontal(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineFlipCurrentChannelVertical() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineFlipCurrentChannelVertical(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineAmplify() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineAmplify(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineDampen() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDampen(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineInvertH() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineInvertH(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineInvertV() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineInvertV(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetCurve() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetCurve(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetCurveSmall() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetCurveSmall(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetDivot() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetDivot(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetDivotSmall() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetDivotSmall(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetFlat() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetFlat(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineResetSwan() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineResetSwan(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineShiftDown() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineShiftDown(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineShiftUp() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineShiftUp(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimeLineDupeAll() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeAll(selectedJiggle)
            }
        }
    }
    
    @MainActor func toolActionTimeLineDupeCurrentChannel() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timeLineDupeCurrentChannel(selectedJiggle)
            }
        }
    }
    
    @MainActor func toolActionTimelinePointCountIncrement() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timelinePointCountIncrement(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionTimelinePointCountDecrement() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            if let selectedJiggle = jiggleViewModel.getSelectedJiggle() {
                jiggleViewModel.timelinePointCountDecrement(selectedJiggle)
            }
        }
        handleTimeLineUpdate()
    }
    
    @MainActor func toolActionRotateGuideRight() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateGuideRight()
        }
    }
    
    @MainActor func toolActionRotateGuideLeft() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateGuideLeft()
        }
    }
    
    @MainActor func toolActionRotateJiggleRight() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateJiggleRight()
        }
    }
    
    @MainActor func toolActionRotateJiggleLeft() {
        if isBlocked { return }
        if let jiggleViewModel = jiggleViewModel {
            jiggleViewModel.rotateJiggleLeft()
        }
    }
    
    @MainActor func toolActionAnimationLoopsEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsEnter()
        }
    }
    @MainActor func toolActionVideoRecordEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoRecordEnter()
        }
    }
    @MainActor func toolActionVideoExportEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoExportEnter()
        }
    }
    
    @MainActor func toolActionTimeLineEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineEnter()
        }
    }
    
    @MainActor func toolActionZoomEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.zoomEnter()
        }
    }
    
    @MainActor func toolActionZoomExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.zoomExit()
        }
    }
    
    @MainActor func toolActionGraphEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphEnter()
        }
    }
    
    @MainActor func toolActionGraphExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.graphExit()
        }
    }
    
    @MainActor func toolActionGuidesEnter() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.guidesEnter()
        }
    }
    
    @MainActor func toolActionAnimationLoopsExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.animationLoopsExit()
        }
    }
    
    @MainActor func toolActionVideoRecordExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoRecordExit()
        }
    }
    
    @MainActor func toolActionVideoExportExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.videoExportExit()
        }
    }
    
    @MainActor func toolActionTimeLineExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.timeLineExit()
        }
    }
    
    @MainActor func toolActionGuidesExit() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.guidesExit()
        }
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
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.attemptResetWeightGraph()
        }
    }
    
    @MainActor func toolActionResetZoom() {
        if isBlocked { return }
        if let jiggleViewModel {
            jiggleViewModel.setResetZoomActive()
        }
    }
    
    @MainActor func toolActionUndo() {
        
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.undo()
        }
    }
    
    @MainActor func toolActionRedo() {
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
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.toolActionPhoneToggleTopMenu()
        }
    }
    
    @MainActor func toolActionPhoneToggleBottomMenu() {
        if isBlocked { return }
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.toolActionPhoneToggleBottomMenu()
        }
    }
    
    @MainActor func toolActionGenerateTopography() {
        print("[IMB] Action - GenerateTopography")
        if let rootViewController = ApplicationController.rootViewController {
            if let jiggleViewModel = ApplicationController.shared.jiggleViewModel {
                if jiggleViewModel.getSelectedJiggle() !== nil {
                    rootViewController.pushDialogBox(DialogBoxModel.editRings) { _ in }
                } else {
                    rootViewController.pushDialogBox(DialogBoxModel.noJiggleSelected) { _ in }
                }
            }
        }
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
    
    @MainActor func toolActionSideMenuEnter() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.sideMenuEnter()
        }
    }
    
    @MainActor func toolActionSideMenuExit() {
        if let jiggleViewController = jiggleViewController {
            jiggleViewController.sideMenuExit()
        }
    }
    
    @MainActor func toolActionMainMenu() {
        if let rootViewController = ApplicationController.rootViewController {
            if rootViewController.isPushing == false {
                if let rootViewModel = ApplicationController.rootViewModel {
                    rootViewModel.pushToMainMenu(animated: true, reversed: false)
                }
            }
        }
    }
}
