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
    case sexyButton
    case greenButton
    case slider
    case segment
    case spacer
    case dividerTiny
    case dividerHuge
    case dividerSpacerDivider
    case favoringOneLineLabel
    case createSwatch
    case sexyCheckBox
    
}

enum ToolInterfaceElement: UInt16 {
    
    case sexyCheckBoxGuideCenters
    case sexyCheckBoxJiggleCenters
    case sexyCheckBoxDarkMode
    case sexyCheckBoxGyroscopeEnabled
    case sexyCheckBoxAutoLoopEnabled
    case sexyCheckBoxRecordAudioEnabled
    case sexyCheckBoxStereoscopicEnabled
    case sexyCheckBoxAnimationJiggleApplyToAll
    case sexyCheckBoxAnimationBounceApplyToAll
    case sexyCheckBoxAnimationTwistApplyToAll
    
    
    case sexyCheckBoxAnimationWobbleApplyToAll
    case sexyCheckBoxImageImporterRotationEnabled
    case sexyCheckBoxImageImporterEdgesEnabled
    
    
    
    case sexyStepperTimelinePointCount
    case sexyStepperGemCount
    case sexyStepperCoinCount
    
    
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
    
    case sexyButtonBreakTangentWeightGraph
    case sexyButtonGenerateTopography
    case sexyButtonResetWeightGraphInverse
    case sexyButtonResetWeightGraphInverseDampened
    case sexyButtonResetWeightGraphLinear
    case sexyButtonResetWeightGraphLinearDampened
    case sexyButtonResetWeightGraphStandard
    case sexyButtonResetWeightGraphStandardDampened
    case sexyButtonSwivelPanLeft
    case sexyButtonSwivelPanReset
    case sexyButtonSwivelPanRight
    case sexyButtonSwivelRotateLeft
    case sexyButtonSwivelRotateReset
    case sexyButtonSwivelRotateRight
    case sexyButtonSwivelTiltDown
    case sexyButtonSwivelTiltReset
    case sexyButtonSwivelTiltUp
    case sexyButtonSwivelZoomIn
    case sexyButtonSwivelZoomOut
    case sexyButtonSwivelZoomReset
    case sexyButtonZoomIn
    case sexyButtonZoomOut
    
    
    case sexyButtonImageImporterRotateRight
    case sexyButtonImageImporterRotateLeft
    case sexyButtonImageImporterResetAspectFit
    case sexyButtonImageImporterResetAspectFill
    case sexyButtonImageImporterButtonBack
    
    case sexyButtonLoadScreenButtonBack
    
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
    

    
    

    
    
    case segmentEditMode
    case segmentWeightMode
    case segmentAnimationMode
    
    case spacer
    
    case dividerTiny
    case dividerHuge
    case dividerSpacerDivider
    
    case favoringOneLineLabel
    
    
    var type: ToolInterfaceElementType {
        switch self {
            
        case .sexyCheckBoxGuideCenters:
            return .sexyCheckBox
        case .sexyCheckBoxJiggleCenters:
            return .sexyCheckBox
        case .sexyCheckBoxDarkMode:
            return .sexyCheckBox
            
            
        case .sexyCheckBoxGyroscopeEnabled:
            return .sexyCheckBox
        case .sexyCheckBoxAutoLoopEnabled:
            return .sexyCheckBox
        case .sexyCheckBoxRecordAudioEnabled:
            return .sexyCheckBox
        case .sexyCheckBoxStereoscopicEnabled:
            return .sexyCheckBox
        case .sexyCheckBoxAnimationJiggleApplyToAll:
            return .sexyCheckBox
        case .sexyCheckBoxAnimationBounceApplyToAll:
            return .sexyCheckBox
            
        case .sexyCheckBoxAnimationTwistApplyToAll:
            return .sexyCheckBox
        case .sexyCheckBoxAnimationWobbleApplyToAll:
            return .sexyCheckBox
            
            
        case .sexyCheckBoxImageImporterRotationEnabled:
            return .sexyCheckBox
        case .sexyCheckBoxImageImporterEdgesEnabled:
            return .sexyCheckBox
            
            
        case .sexyStepperTimelinePointCount:
            return .sexyStepper
        case .sexyStepperGemCount:
            return .sexyStepper
        case .sexyStepperCoinCount:
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
            
        case .sexyButtonBreakTangentWeightGraph:
            return .sexyButton
            
        case .sexyButtonGenerateTopography:
            return .sexyButton
            
        case .sexyButtonResetWeightGraphInverse:
            return .sexyButton
            
        case .sexyButtonResetWeightGraphInverseDampened:
            return .sexyButton
            
        case .sexyButtonResetWeightGraphLinear:
            return .sexyButton
            
        case .sexyButtonResetWeightGraphLinearDampened:
            return .sexyButton
            
        case .sexyButtonResetWeightGraphStandard:
            return .sexyButton
            
        case .sexyButtonResetWeightGraphStandardDampened:
            return .sexyButton
            
        case .sexyButtonSwivelPanLeft:
            return .sexyButton
            
        case .sexyButtonSwivelPanReset:
            return .sexyButton
            
        case .sexyButtonSwivelPanRight:
            return .sexyButton
            
        case .sexyButtonSwivelRotateLeft:
            return .sexyButton
            
        case .sexyButtonSwivelRotateReset:
            return .sexyButton
            
        case .sexyButtonSwivelRotateRight:
            return .sexyButton
            
        case .sexyButtonSwivelTiltDown:
            return .sexyButton
            
        case .sexyButtonSwivelTiltReset:
            return .sexyButton
            
        case .sexyButtonSwivelTiltUp:
            return .sexyButton
            
        case .sexyButtonSwivelZoomIn:
            return .sexyButton
            
        case .sexyButtonSwivelZoomOut:
            return .sexyButton
            
        case .sexyButtonSwivelZoomReset:
            return .sexyButton
            
        case .sexyButtonZoomIn:
            return .sexyButton
            
        case .sexyButtonZoomOut:
            return .sexyButton
            
            
        case .sexyButtonImageImporterRotateRight:
            return .sexyButton
        case .sexyButtonImageImporterRotateLeft:
            return .sexyButton
        case .sexyButtonImageImporterResetAspectFit:
            return .sexyButton
        case .sexyButtonImageImporterResetAspectFill:
            return .sexyButton
        case .sexyButtonImageImporterButtonBack:
            return .sexyButton
            
            
        case .sexyButtonLoadScreenButtonBack:
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

            
        case .spacer:
            return .spacer
            
        case .dividerTiny:
            return .dividerTiny
        case .dividerHuge:
            return .dividerHuge
        case .dividerSpacerDivider:
            return .dividerSpacerDivider

            
        }
    }
}
