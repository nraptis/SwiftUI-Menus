//
//  ToolInterfaceElement.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

enum ToolInterfaceElementType: UInt16 {
    case sexyStepper
    case enterMode
    case exitMode
    case mainTab
    case textIconButton
    case sexyButton
    case iconButton
    case greenButton
    case slider
    case segment
    case spacer
    case dividerTiny
    case dividerHuge
    case dividerSpacerDivider
    case checkBox
    case favoringOneLineLabel
    case createSwatch
    case sexyCheckBox
    
}

enum ToolInterfaceElement: UInt16 {
    
    case sexyCheckBoxGuideCenters
    case sexyCheckBoxJiggleCenters
    case sexyCheckBoxDarkMode
    
    
    case sexyStepperTimelinePointCount
    
    case sexyButtonUndo
    case sexyButtonRedo
    
    case sexyButtonMenu
    case sexyButtonRotateJiggleRight
    case sexyButtonRotateJiggleLeft
    case sexyButtonRotateGuideLeft
    case sexyButtonRotateGuideRight

    case sexyButtonFlipJiggleH
    case sexyButtonFlipJiggleV
    case sexyButtonFlipGuideH
    case sexyButtonFlipGuideV
    
    case sexyButtonFreezeSelectedJiggle
    case sexyButtonFreezeSelectedGuide
    case sexyButtonUnfreezeAllJiggles
    case sexyButtonUnfreezeAllGuides
    
    case sexyButtonCloneJiggle
    case sexyButtonCloneGuide
    case sexyButtonDeleteJiggle
    case sexyButtonDeleteGuide
    case sexyButtonDeleteJigglePoint
    case sexyButtonDeleteGuidePoint
    
    
    case sexyButtonTimeLineDupeAll
    case sexyButtonTimeLineDupeDuration
    case sexyButtonTimeLineDupeCurrentChannel
    case sexyButtonTimeLineFlattenCurrentChannel
    case sexyButtonTimeLineResetDefaultCurrentChannel
    //case sexyButtonTimeLineBreakTangents
    //case sexyButtonTimeLineBreakX
    //case sexyButtonTimeLineBreakY
    case sexyButtonTimeLineResetGraph
    
    case sexyButtonTimeLineBreakPoint
    
    case sexyButtonTimeLineInvertH
    case sexyButtonTimeLineInvertV
    case sexyButtonTimeLineResetCurve
    
    
    case sexyButtonTimeLineAmplify
    case sexyButtonTimeLineDampen
    case sexyButtonTimeLineFlipAll
    
    
    case sexyButtonSelectNextJigglePoint
    case sexyButtonSelectPreviousJigglePoint
    case sexyButtonSelectNextGuidePoint
    case sexyButtonSelectPreviousGuidePoint
    
    
    case sexyButtonSelectNextJiggle
    case sexyButtonSelectPreviousJiggle
    case sexyButtonSelectNextGuide
    case sexyButtonSelectPreviousGuide
    
    case sexyButtonZoomReset
    case sexyButtonZoomJiggle
    
    case createSwatchMakeAndDrawJiggle
    case createSwatchMakeAndDrawGuide
    case createSwatchAddAndRemoveJigglePoints
    case createSwatchAddAndRemoveGuidePoints
    
    case enterModeZoomEnter
    case enterModeGuidesEnter
    case enterModeGraphEnter
    case enterModeAnimationLoopsEnter
    case enterModeVideoRecordEnter
    case enterModeVideoExportEnter
    case enterModeTimeLineEnter
    
    case enterModeLoopsPage1
    case enterModeLoopsPage2
    case enterModeLoopsPage3
    case enterModeAnimationContinuous
    
    
    case exitModeZoomExit
    case exitModeGuidesExit
    case exitModeGraphExit
    case exitModeAnimationLoopsExit
    case exitModeVideoRecordExit
    case exitModeVideoExportExit
    case exitModeTimeLineExit
    case exitModeAnimationContinuous
    
    case greenButtonCreateScene
    case greenButtonDone
    
    
    case mainTabDocumentMode
    case mainTabJainTest
    case mainTabSkainTest
    
    
    case sliderBouncePower
    case sliderBounceSpeed
    case sliderCircleFactor
    case sliderInflateAmount
    case sliderInflateAmountEnd
    case sliderInflateAmountStart
    case sliderJigglePower
    case sliderJiggleSpeed
    case sliderLoopSpeed
    case sliderMovementHorizontal
    case sliderMovementVertical
    case sliderSwivelCameraPan
    case sliderSwivelCameraTilt
    case sliderSwivelCameraTwist
    case sliderSwivelCameraZoom
    case sliderSwivelLightAmbient
    case sliderSwivelLightDiffuse
    case sliderSwivelLightSpecular
    case sliderTwistPower
    case sliderTwistSpeed
    case sliderZoomAmount
    case sliderJiggleOpacity
    case sliderJiggleDampen
    case sliderTimeLineDuration
    case sliderTimeLineOffset
    
    //case buttonPhoneCollapseTop
    //case buttonPhoneCollapseBottom
    
    //case textIconButtonGenerateGuides
    //case textIconButtonBreakTangentGuidePoint
    case textIconButtonBreakManualWeightGraph
    //case textIconButtonCloneJiggle
    //case textIconButtonCloneGuide
    //case textIconButtonCloseWeightGraph
    //case textIconButtonCreateJiggle
    //case textIconButtonCreatePoint
    //case textIconButtonCreateGuide
    //case textIconButtonCreateGuidePoint
    //case textIconButtonDrawJiggles
    //case textIconButtonRotateJiggleRight
    //case textIconButtonRotateGuideRight
    //case textIconButtonRotateJiggleLeft
    //case textIconButtonRotateGuideLeft
    //case textIconButtonDrawGuide
    //case textIconButtonFlipHorizontalJiggle
    //case textIconButtonFlipHorizontalGuide
    //case textIconButtonFlipVerticalJiggle
    //case textIconButtonFlipVerticalGuide
    //case textIconButtonFreezeOffAllJiggle
    //case textIconButtonFreezeOffAllGuide
    //case textIconButtonFreezeOnAllJiggle
    //case textIconButtonFreezeOnAllGuide
    //case textIconButtonFreezeOnSelectedJiggle
    //case textIconButtonFreezeOnSelectedGuide
    //case textIconButtonMainMenu
    case textIconButtonRandomizeWeightGraph
    case textIconButtonRecordCancel
    //case textIconButtonRecordMovie
    //case textIconButtonRedo
    //case textIconButtonRemoveJiggle
    //case textIconButtonRemovePoint
    //case textIconButtonDeleteGuide
    //case textIconButtonDeleteGuidePoint
    case textIconButtonResetSwivelCamera
    case textIconButtonResetToDefault
    case textIconButtonResetWeightGraph
    //case textIconButtonResetZoom
    //case textIconButtonResetZoomSelectedJiggle
    //case textIconButtonSelectNextJiggle
    //case textIconButtonSelectNextPoint
    //case textIconButtonSelectNextGuide
    //case textIconButtonSelectNextGuidePoint
    //case textIconButtonSelectPreviousJiggle
    //case textIconButtonSelectPreviousPoint
    //case textIconButtonSelectPreviousGuide
    //case textIconButtonSelectPreviousGuidePoint
    //case textIconButtonSendBackJiggle
    //case textIconButtonSendBackGuide
    //case textIconButtonSendBackwardJiggle
    //case textIconButtonSendBackwardGuide
    //case textIconButtonSendForwardJiggle
    //case textIconButtonSendForwardGuide
    //case textIconButtonSendFrontGuide
    //case textIconButtonUndo
    
    //case textIconButtonResetCenterJiggle
    //case textIconButtonResetCenterGuide
    
    //case textIconButtonPhoneExpandTopMenu
    //case textIconButtonPhoneExpandBottomMenu
    //case textIconButtonPhoneCollapseTopMenu
    //case textIconButtonPhoneCollapseBottomMenu
    //case textIconButtonPadCollapseMenu
    //case textIconButtonPadExpandMenu
    
    //case textIconButtonFreezeOnAllUnselectedJiggle
    //case textIconButtonFreezeOnAllUnselectedGuide
    
    //case textIconButtonSendFrontJiggle
    
    //case textIconButtonExitZoomMode
    
    //case textIconButtonExitViewMode
    //case textIconButtonExitWeightMode
    
    case textIconButtonGenerateTopography
    
    //case textIconButtonExitRecordMode
    //case textIconButtonResetCenterWeightGeometry
    case textIconButtonResetSwivelFront
    case textIconButtonResetSwivelBack
    case textIconButtonResetSwivelLeft
    case textIconButtonResetSwivelRight
    case textIconButtonResetSwivelTilt
    case textIconButtonIncreaseJigglePoints
    case textIconButtonIncreaseGuidePoints
    
    case textIconButtonRotateRight
    case textIconButtonRotateLeft
    case textIconButtonResetAspectFit
    case textIconButtonResetAspectFill
    case textIconButtonBack
    
    case textIconButtonTest1
    case textIconButtonTest2
    case textIconButtonTest3
    
    //case segmentDisplayMode
    //case segmentDocumentMode
    
    case segmentEditMode
    case segmentWeightMode
    case segmentAnimationMode
    
    
    case checkBoxAlternateMotionEnabled
    case checkBoxAutoLoopEnabled
    case checkBoxBulgeEnabled
    
    case checkBoxGyroscopeEnabled
    case checkBoxHorizontalEnabled
    case checkBoxInvertHorizontalEnabled
    case checkBoxInvertMotionEnabled
    case checkBoxInvertMotionEvenEnabled
    case checkBoxInvertMotionOddEnabled
    case checkBoxInvertVerticalEnabled
    case checkBoxOvershootEnabled
    case checkBoxRecordAudioEnabled
    case checkBoxRelaxEnabled
    
    case checkBoxReverseMotionEnabled
    case checkBoxReverseMotionEvenEnabled
    case checkBoxReverseMotionOddEnabled
    case checkBoxSineEnabled
    case checkBoxStaggerEnabled
    case checkBoxStereoscopicEnabled
    case checkBoxTwistEnabled
    case checkBoxUndershootEnabled
    case checkBoxVerticalEnabled
    case checkBoxWeightCurveGraphEnabled
    case checkBoxZoomEnabled
    case checkBoxDarkModeEnabled
    case checkBoxSwivelOrbitEnabled
    
    case checkBoxAnimationJiggleApplyToAll
    case checkBoxAnimationBounceApplyToAll
    case checkBoxAnimationTwistApplyToAll
    case checkBoxAnimationWobbleApplyToAll
    
    case checkBoxJiggleCentersEnabled
    case checkBoxGuideCentersEnabled
    
    
    case checkBoxSnapRotationEnabled
    case checkBoxSnapEdgesEnabled
    
    case spacer
    
    case dividerTiny
    case dividerHuge
    case dividerSpacerDivider
    
    case favoringOneLineLabel
    
    case buttonTest1
    case buttonTest2
    case buttonTest3
    
    var type: ToolInterfaceElementType {
        switch self {
            
        case .sexyCheckBoxGuideCenters:
            return .sexyCheckBox
        case .sexyCheckBoxJiggleCenters:
            return .sexyCheckBox
        case .sexyCheckBoxDarkMode:
            return .sexyCheckBox
            
            
            
        case .sexyStepperTimelinePointCount:
            return .sexyStepper
            
        case .sexyButtonUndo:
            return .sexyButton
        case .sexyButtonRedo:
            return .sexyButton
            
        case .sexyButtonMenu:
            return .sexyButton
        case .sexyButtonRotateJiggleRight:
            return .sexyButton
        case .sexyButtonRotateJiggleLeft:
            return .sexyButton
            
        case .sexyButtonRotateGuideLeft:
            return .sexyButton
        case .sexyButtonRotateGuideRight:
            return .sexyButton
        case .sexyButtonFlipJiggleH:
            return .sexyButton
        case .sexyButtonFlipJiggleV:
            return .sexyButton
        case .sexyButtonFlipGuideH:
            return .sexyButton
        case .sexyButtonFlipGuideV:
            return .sexyButton
            
            
        case .sexyButtonFreezeSelectedJiggle:
            return .sexyButton
        case .sexyButtonFreezeSelectedGuide:
            return .sexyButton
        case .sexyButtonUnfreezeAllJiggles:
            return .sexyButton
        case .sexyButtonUnfreezeAllGuides:
            return .sexyButton
            
            
            
            
        case .sexyButtonCloneJiggle:
            return .sexyButton
        case .sexyButtonCloneGuide:
            return .sexyButton
        case .sexyButtonDeleteJiggle:
            return .sexyButton
        case .sexyButtonDeleteGuide:
            return .sexyButton
        case .sexyButtonDeleteJigglePoint:
            return .sexyButton
        case .sexyButtonDeleteGuidePoint:
            return .sexyButton
            
            
        case .sexyButtonTimeLineDupeAll:
            return .sexyButton
        case .sexyButtonTimeLineDupeDuration:
            return .sexyButton
        case .sexyButtonTimeLineDupeCurrentChannel:
            return .sexyButton
        case .sexyButtonTimeLineFlattenCurrentChannel:
            return .sexyButton
        case .sexyButtonTimeLineResetDefaultCurrentChannel:
            return .sexyButton
            
        case .sexyButtonTimeLineResetGraph:
            return .sexyButton
        case .sexyButtonTimeLineBreakPoint:
            return .sexyButton
            
        case .sexyButtonTimeLineInvertH:
            return .sexyButton
        case .sexyButtonTimeLineInvertV:
            return .sexyButton
        case .sexyButtonTimeLineResetCurve:
            return .sexyButton
            
        case .sexyButtonTimeLineAmplify:
            return .sexyButton
        case .sexyButtonTimeLineDampen:
            return .sexyButton
            
        case .sexyButtonTimeLineFlipAll:
            return .sexyButton
            
            
            
        case .sexyButtonSelectNextJigglePoint:
            return .sexyButton
        case .sexyButtonSelectPreviousJigglePoint:
            return .sexyButton
        case .sexyButtonSelectNextGuidePoint:
            return .sexyButton
        case .sexyButtonSelectPreviousGuidePoint:
            return .sexyButton
            
        case .sexyButtonSelectNextJiggle:
            return .sexyButton
        case .sexyButtonSelectPreviousJiggle:
            return .sexyButton
        case .sexyButtonSelectNextGuide:
            return .sexyButton
        case .sexyButtonSelectPreviousGuide:
            return .sexyButton
        case .sexyButtonZoomReset:
            return .sexyButton
        case .sexyButtonZoomJiggle:
            return .sexyButton
            
            
            
            
        case .createSwatchMakeAndDrawJiggle:
            return .createSwatch
        case .createSwatchMakeAndDrawGuide:
            return .createSwatch
        case .createSwatchAddAndRemoveJigglePoints:
            return .createSwatch
        case .createSwatchAddAndRemoveGuidePoints:
            return .createSwatch
        
        case .enterModeZoomEnter:
            return .enterMode
        case .enterModeGuidesEnter:
            return .enterMode
        case .enterModeGraphEnter:
            return .enterMode
        case .enterModeAnimationLoopsEnter:
            return .enterMode
        case .enterModeVideoRecordEnter:
            return .enterMode
        case .enterModeVideoExportEnter:
            return .enterMode
        case .enterModeTimeLineEnter:
            return .enterMode
            
            
        case .enterModeLoopsPage1:
            return .enterMode
        case .enterModeLoopsPage2:
            return .enterMode
        case .enterModeLoopsPage3:
            return .enterMode
        case .enterModeAnimationContinuous:
            return .enterMode
            
            
        case .exitModeZoomExit:
            return .exitMode
        case .exitModeGuidesExit:
            return .exitMode
        case .exitModeGraphExit:
            return .exitMode
        case .exitModeAnimationLoopsExit:
            return .exitMode
        case .exitModeVideoRecordExit:
            return .exitMode
        case .exitModeVideoExportExit:
            return .exitMode
        case .exitModeTimeLineExit:
            return .exitMode
        case .exitModeAnimationContinuous:
            return .exitMode
            
        case .mainTabDocumentMode:
            return .mainTab
        case .mainTabJainTest:
            return .mainTab
        case .mainTabSkainTest:
            return .mainTab
            
            
        case .favoringOneLineLabel:
            return .favoringOneLineLabel
        case .greenButtonCreateScene:
            return .greenButton
        case .greenButtonDone:
            return .greenButton
        case .sliderBouncePower:
            return .slider
        case .sliderBounceSpeed:
            return .slider
        case .sliderCircleFactor:
            return .slider
        case .sliderInflateAmount:
            return .slider
        case .sliderInflateAmountEnd:
            return .slider
        case .sliderInflateAmountStart:
            return .slider
        case .sliderJigglePower:
            return .slider
        case .sliderJiggleSpeed:
            return .slider
        case .sliderLoopSpeed:
            return .slider
        case .sliderMovementHorizontal:
            return .slider
        case .sliderMovementVertical:
            return .slider
        case .sliderSwivelCameraPan:
            return .slider
        case .sliderSwivelCameraTilt:
            return .slider
        case .sliderSwivelCameraTwist:
            return .slider
        case .sliderSwivelCameraZoom:
            return .slider
        case .sliderSwivelLightAmbient:
            return .slider
        case .sliderSwivelLightDiffuse:
            return .slider
        case .sliderSwivelLightSpecular:
            return .slider
        case .sliderTwistPower:
            return .slider
        case .sliderTwistSpeed:
            return .slider
        case .sliderZoomAmount:
            return .slider
        case .sliderJiggleOpacity:
            return .slider
        case .sliderJiggleDampen:
            return .slider
        case .sliderTimeLineDuration:
            return .slider
        case .sliderTimeLineOffset:
            return .slider
            
            
        case .segmentEditMode:
            return .segment
        case .segmentWeightMode:
            return .segment
        case .segmentAnimationMode:
            return .segment

        case .checkBoxAlternateMotionEnabled:
            return .checkBox
        case .checkBoxAutoLoopEnabled:
            return .checkBox
        case .checkBoxBulgeEnabled:
            return .checkBox
            
        case .checkBoxGyroscopeEnabled:
            return .checkBox
        case .checkBoxHorizontalEnabled:
            return .checkBox
        case .checkBoxInvertHorizontalEnabled:
            return .checkBox
        case .checkBoxInvertMotionEnabled:
            return .checkBox
        case .checkBoxInvertMotionEvenEnabled:
            return .checkBox
        case .checkBoxInvertMotionOddEnabled:
            return .checkBox
        case .checkBoxInvertVerticalEnabled:
            return .checkBox
        case .checkBoxOvershootEnabled:
            return .checkBox
        case .checkBoxRecordAudioEnabled:
            return .checkBox
        case .checkBoxRelaxEnabled:
            return .checkBox
            
        case .checkBoxReverseMotionEnabled:
            return .checkBox
        case .checkBoxReverseMotionEvenEnabled:
            return .checkBox
        case .checkBoxReverseMotionOddEnabled:
            return .checkBox
        case .checkBoxSineEnabled:
            return .checkBox
        case .checkBoxStaggerEnabled:
            return .checkBox
        case .checkBoxStereoscopicEnabled:
            return .checkBox
        case .checkBoxTwistEnabled:
            return .checkBox
        case .checkBoxUndershootEnabled:
            return .checkBox
        case .checkBoxVerticalEnabled:
            return .checkBox
        case .checkBoxWeightCurveGraphEnabled:
            return .checkBox
        case .checkBoxZoomEnabled:
            return .checkBox
        case .checkBoxDarkModeEnabled:
            return .checkBox
        case .checkBoxSwivelOrbitEnabled:
            return .checkBox
            
        case .checkBoxAnimationJiggleApplyToAll:
            return .checkBox
        case .checkBoxAnimationBounceApplyToAll:
            return .checkBox
        case .checkBoxAnimationTwistApplyToAll:
            return .checkBox
        case .checkBoxAnimationWobbleApplyToAll:
            return .checkBox
        case .checkBoxJiggleCentersEnabled:
            return .checkBox
        case .checkBoxGuideCentersEnabled:
            return .checkBox
            
        case .checkBoxSnapRotationEnabled:
            return .checkBox
        case .checkBoxSnapEdgesEnabled:
            return .checkBox
            
        case .spacer:
            return .spacer
        
        case .dividerTiny:
            return .dividerTiny
        case .dividerHuge:
            return .dividerHuge
        case .dividerSpacerDivider:
            return .dividerSpacerDivider
            
        case .buttonTest1:
            return .textIconButton
        case .buttonTest2:
            return .textIconButton
        case .buttonTest3:
            return .textIconButton
            
        case .textIconButtonBreakManualWeightGraph:
            return .textIconButton

            
        case .textIconButtonRandomizeWeightGraph:
            return .textIconButton
        case .textIconButtonRecordCancel:
            return .textIconButton
            
        case .textIconButtonResetSwivelCamera:
            return .textIconButton
        case .textIconButtonResetToDefault:
            return .textIconButton
        case .textIconButtonResetWeightGraph:
            return .textIconButton
            
        case .textIconButtonResetSwivelFront:
            return .textIconButton
        case .textIconButtonResetSwivelBack:
            return .textIconButton
        case .textIconButtonResetSwivelLeft:
            return .textIconButton
        case .textIconButtonResetSwivelRight:
            return .textIconButton
        case .textIconButtonResetSwivelTilt:
            return .textIconButton
        case .textIconButtonIncreaseJigglePoints:
            return .textIconButton
        case .textIconButtonIncreaseGuidePoints:
            return .textIconButton

            
        case .textIconButtonGenerateTopography:
            return .textIconButton
        case .textIconButtonRotateRight:
            return .textIconButton
        case .textIconButtonRotateLeft:
            return .textIconButton
        case .textIconButtonResetAspectFit:
            return .textIconButton
        case .textIconButtonResetAspectFill:
            return .textIconButton
        case .textIconButtonBack:
            return .textIconButton
        case .textIconButtonTest1:
            return .textIconButton
        case .textIconButtonTest2:
            return .textIconButton
        case .textIconButtonTest3:
            return .textIconButton
            
        }
    }
}
