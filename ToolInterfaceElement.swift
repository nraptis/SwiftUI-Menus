//
//  ToolInterfaceElement.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

enum ToolInterfaceElementType: UInt16 {
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
    
}

enum ToolInterfaceElement: UInt16 {
    
    case sexyButtonUndo
    case sexyButtonRedo
    
    
    case createSwatchMakeAndDrawJiggle
    
    case enterModeZoomEnter
    case enterModeGuidesEnter
    case enterModeGraphEnter
    
    case exitModeZoomExit
    case exitModeGuidesExit
    case exitModeGraphExit
    
    case greenButtonCreateScene
    
    case mainTabDocumentMode
    
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
    
    case buttonPhoneCollapseTop
    case buttonPhoneCollapseBottom
    
    //case textIconButtonGenerateWeightRings
    //case textIconButtonBreakTangentWeightRingPoint
    case textIconButtonBreakManualWeightGraph
    case textIconButtonCloneJiggle
    case textIconButtonCloneWeightRing
    //case textIconButtonCloseWeightGraph
    //case textIconButtonCreateJiggle
    //case textIconButtonCreatePoint
    //case textIconButtonCreateWeightRing
    //case textIconButtonCreateWeightRingPoint
    //case textIconButtonDrawJiggles
    case textIconButtonRotateJiggleRight
    case textIconButtonRotateGuideRight
    case textIconButtonRotateJiggleLeft
    case textIconButtonRotateGuideLeft
    //case textIconButtonDrawWeightRing
    case textIconButtonFlipHorizontalJiggle
    case textIconButtonFlipHorizontalWeightRing
    case textIconButtonFlipVerticalJiggle
    case textIconButtonFlipVerticalWeightRing
    case textIconButtonFreezeOffAllJiggle
    case textIconButtonFreezeOffAllWeightRing
    //case textIconButtonFreezeOnAllJiggle
    //case textIconButtonFreezeOnAllWeightRing
    case textIconButtonFreezeOnSelectedJiggle
    case textIconButtonFreezeOnSelectedWeightRing
    case textIconButtonMainMenu
    case textIconButtonRandomizeWeightGraph
    case textIconButtonRecordCancel
    case textIconButtonRecordMovie
    case textIconButtonRedo
    case textIconButtonRemoveJiggle
    case textIconButtonRemovePoint
    case textIconButtonRemoveWeightRing
    case textIconButtonRemoveWeightRingPoint
    case textIconButtonResetSwivelCamera
    case textIconButtonResetToDefault
    case textIconButtonResetWeightGraph
    case textIconButtonResetZoom
    case textIconButtonResetZoomSelectedJiggle
    case textIconButtonSelectNextJiggle
    case textIconButtonSelectNextPoint
    case textIconButtonSelectNextWeightRing
    case textIconButtonSelectNextWeightRingPoint
    case textIconButtonSelectPreviousJiggle
    case textIconButtonSelectPreviousPoint
    case textIconButtonSelectPreviousWeightRing
    case textIconButtonSelectPreviousWeightRingPoint
    case textIconButtonSendBackJiggle
    case textIconButtonSendBackWeightRing
    case textIconButtonSendBackwardJiggle
    case textIconButtonSendBackwardWeightRing
    case textIconButtonSendForwardJiggle
    case textIconButtonSendForwardWeightRing
    case textIconButtonSendFrontWeightRing
    case textIconButtonUndo
    
    //case textIconButtonResetCenterJiggle
    //case textIconButtonResetCenterWeightRing
    
    case textIconButtonPhoneExpandTopMenu
    case textIconButtonPhoneExpandBottomMenu
    case textIconButtonPhoneCollapseTopMenu
    case textIconButtonPhoneCollapseBottomMenu
    //case textIconButtonPadCollapseMenu
    //case textIconButtonPadExpandMenu
    
    case textIconButtonFreezeOnAllUnselectedJiggle
    case textIconButtonFreezeOnAllUnselectedWeightRing
    case textIconButtonSendFrontJiggle
    case textIconButtonExitZoomMode
    
    case textIconButtonExitViewMode
    case textIconButtonExitWeightMode
    case textIconButtonGenerateTopography
    
    case textIconButtonExitRecordMode
    //case textIconButtonResetCenterWeightGeometry
    case textIconButtonResetSwivelFront
    case textIconButtonResetSwivelBack
    case textIconButtonResetSwivelLeft
    case textIconButtonResetSwivelRight
    case textIconButtonResetSwivelTilt
    case textIconButtonIncreaseJigglePoints
    case textIconButtonIncreaseWeightRingPoints
    
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
    case segmentPointMode
    case segmentPointCreateMode
    case segmentWeightMode
    case segmentWeightPointMode
    case segmentWeightPointCreateMode
    case segmentAnimationMode
    case segmentViewMode
    
    case checkBoxAlternateMotionEnabled
    case checkBoxAutoLoopEnabled
    case checkBoxBulgeEnabled
    case checkBoxCreateJigglesDrawing
    case checkBoxCreateJigglesStandard
    case checkBoxCreatePoints
    case checkBoxCreateWeightRingPoints
    case checkBoxCreateWeightRingsDrawing
    case checkBoxCreateWeightRingsStandard
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
    case checkBoxRemovePoints
    case checkBoxRemoveWeightRingPoints
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
            
        case .sexyButtonUndo:
            return .sexyButton
        case .sexyButtonRedo:
            return .sexyButton
            
        case .createSwatchMakeAndDrawJiggle:
            return .createSwatch
            
        case .enterModeZoomEnter:
            return .enterMode
        case .enterModeGuidesEnter:
            return .enterMode
        case .enterModeGraphEnter:
            return .enterMode
            
            
        case .exitModeZoomExit:
            return .exitMode
        case .exitModeGuidesExit:
            return .exitMode
        case .exitModeGraphExit:
            return .exitMode
            
        case .mainTabDocumentMode:
            return .mainTab
        case .favoringOneLineLabel:
            return .favoringOneLineLabel
        case .greenButtonCreateScene:
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
            
            
        case .buttonPhoneCollapseTop:
            return .iconButton
        case .buttonPhoneCollapseBottom:
            return .iconButton
            
        case .segmentEditMode:
            return .segment
        case .segmentPointMode:
            return .segment
        case .segmentPointCreateMode:
            return .segment
        case .segmentWeightMode:
            return .segment
        case .segmentWeightPointMode:
            return .segment
        case .segmentWeightPointCreateMode:
            return .segment
        case .segmentAnimationMode:
            return .segment
        case .segmentViewMode:
            return .segment
            
        case .checkBoxAlternateMotionEnabled:
            return .checkBox
        case .checkBoxAutoLoopEnabled:
            return .checkBox
        case .checkBoxBulgeEnabled:
            return .checkBox
        case .checkBoxCreateJigglesDrawing:
            return .checkBox
        case .checkBoxCreateJigglesStandard:
            return .checkBox
        case .checkBoxCreatePoints:
            return .checkBox
        case .checkBoxCreateWeightRingPoints:
            return .checkBox
        case .checkBoxCreateWeightRingsDrawing:
            return .checkBox
        case .checkBoxCreateWeightRingsStandard:
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
        case .checkBoxRemovePoints:
            return .checkBox
        case .checkBoxRemoveWeightRingPoints:
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
        case .textIconButtonCloneJiggle:
            return .textIconButton
        case .textIconButtonCloneWeightRing:
            return .textIconButton
        case .textIconButtonFlipHorizontalJiggle:
            return .textIconButton
        case .textIconButtonFlipHorizontalWeightRing:
            return .textIconButton
        case .textIconButtonFlipVerticalJiggle:
            return .textIconButton
        case .textIconButtonFlipVerticalWeightRing:
            return .textIconButton
            
        case .textIconButtonRotateJiggleRight:
            return .textIconButton
        case .textIconButtonRotateGuideRight:
            return .textIconButton
        case .textIconButtonRotateJiggleLeft:
            return .textIconButton
        case .textIconButtonRotateGuideLeft:
            return .textIconButton
            
        case .textIconButtonFreezeOffAllJiggle:
            return .textIconButton
        case .textIconButtonFreezeOffAllWeightRing:
            return .textIconButton
        case .textIconButtonFreezeOnSelectedJiggle:
            return .textIconButton
        case .textIconButtonFreezeOnSelectedWeightRing:
            return .textIconButton
        case .textIconButtonMainMenu:
            return .textIconButton
        case .textIconButtonRandomizeWeightGraph:
            return .textIconButton
        case .textIconButtonRecordCancel:
            return .textIconButton
        case .textIconButtonRecordMovie:
            return .textIconButton
        case .textIconButtonRedo:
            return .textIconButton
        case .textIconButtonRemoveJiggle:
            return .textIconButton
        case .textIconButtonRemovePoint:
            return .textIconButton
        case .textIconButtonRemoveWeightRing:
            return .textIconButton
        case .textIconButtonRemoveWeightRingPoint:
            return .textIconButton
        case .textIconButtonResetSwivelCamera:
            return .textIconButton
        case .textIconButtonResetToDefault:
            return .textIconButton
        case .textIconButtonResetWeightGraph:
            return .textIconButton
        case .textIconButtonResetZoom:
            return .textIconButton
        case .textIconButtonResetZoomSelectedJiggle:
            return .textIconButton
        case .textIconButtonSelectNextJiggle:
            return .textIconButton
        case .textIconButtonSelectNextPoint:
            return .textIconButton
        case .textIconButtonSelectNextWeightRing:
            return .textIconButton
        case .textIconButtonSelectNextWeightRingPoint:
            return .textIconButton
        case .textIconButtonSelectPreviousJiggle:
            return .textIconButton
        case .textIconButtonSelectPreviousPoint:
            return .textIconButton
        case .textIconButtonSelectPreviousWeightRing:
            return .textIconButton
        case .textIconButtonSelectPreviousWeightRingPoint:
            return .textIconButton
        case .textIconButtonSendBackJiggle:
            return .textIconButton
        case .textIconButtonSendBackWeightRing:
            return .textIconButton
        case .textIconButtonSendBackwardJiggle:
            return .textIconButton
        case .textIconButtonSendBackwardWeightRing:
            return .textIconButton
        case .textIconButtonSendForwardJiggle:
            return .textIconButton
        case .textIconButtonSendForwardWeightRing:
            return .textIconButton
        case .textIconButtonSendFrontWeightRing:
            return .textIconButton
        case .textIconButtonUndo:
            return .textIconButton
        case .textIconButtonPhoneExpandTopMenu:
            return .textIconButton
        case .textIconButtonPhoneExpandBottomMenu:
            return .textIconButton
        case .textIconButtonPhoneCollapseTopMenu:
            return .textIconButton
        case .textIconButtonPhoneCollapseBottomMenu:
            return .textIconButton
        case .textIconButtonFreezeOnAllUnselectedJiggle:
            return .textIconButton
        case .textIconButtonFreezeOnAllUnselectedWeightRing:
            return .textIconButton
        case .textIconButtonSendFrontJiggle:
            return .textIconButton
        case .textIconButtonExitZoomMode:
            return .textIconButton
        case .textIconButtonExitRecordMode:
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
        case .textIconButtonIncreaseWeightRingPoints:
            return .textIconButton
        case .textIconButtonExitViewMode:
            return .textIconButton
        case .textIconButtonExitWeightMode:
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
