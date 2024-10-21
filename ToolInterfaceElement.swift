//
//  ToolInterfaceElement.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/19/24.
//

import Foundation

enum ToolInterfaceElementType: UInt16 {
    case stepper
    case enterMode
    case exitMode
    case mainTab
    case button
    case greenButton
    case slider
    case segment
    case spacer
    case dividerTiny
    case dividerHuge
    case dividerSpacerDivider
    case favoringOneLineLabel
    case createSwatch
    case checkBox
    
}

enum ToolInterfaceElement: UInt16 {
    
    case checkBoxDarkMode
    case checkBoxGyroscopeEnabled
    //case checkBoxAutoLoopEnabled
    case checkBoxRecordAudioEnabled
    case checkBoxStereoscopicEnabled
    case checkBoxAnimationGrabApplyToAll
    case checkBoxAnimationLoopApplyToAll
    //case checkBoxAnimationTwistApplyToAll
    case checkBoxPurchasedEnabled
    //case checkBoxAnimationWobbleApplyToAll
    case checkBoxImageImporterRotationEnabled
    case checkBoxImageImporterEdgesEnabled
    
    
    
    case stepperTimelinePointCount
    case stepperGemCount
    case stepperCoinCount
    
    
    case buttonUndo
    case buttonRedo
    
    case buttonMenu
    case buttonRotateJiggleRight
    case buttonRotateJiggleLeft
    case buttonRotateGuideLeft
    case buttonRotateGuideRight
    
    case buttonFlipJiggleH
    case buttonFlipJiggleV
    case buttonFlipGuideH
    case buttonFlipGuideV
    
    case buttonFreezeSelectedJiggle
    case buttonFreezeSelectedGuide
    case buttonUnfreezeAllJiggles
    case buttonUnfreezeAllGuides
    
    case buttonCloneJiggle
    case buttonCloneGuide
    case buttonDeleteJiggle
    case buttonDeleteGuide
    case buttonDeleteJigglePoint
    case buttonDeleteGuidePoint
    
    
    case buttonTimeLineDupeAll
    case buttonTimeLineDupeDuration
    case buttonTimeLineDupeCurrentChannel
    case buttonTimeLineResetFlatCurrentChannel
    case buttonTimeLineResetDefaultCurrentChannel
    case buttonTimeLineBreakPoint
    case buttonTimeLineInvertH
    case buttonTimeLineInvertV
    case buttonTimeLineResetCurve
    case buttonTimeLineAmplify
    case buttonTimeLineDampen
    case buttonTimeLineFlipAll
    case buttonSelectNextJigglePoint
    case buttonSelectPreviousJigglePoint
    case buttonSelectNextGuidePoint
    case buttonSelectPreviousGuidePoint
    case buttonSelectNextJiggle
    case buttonSelectPreviousJiggle
    case buttonSelectNextGuide
    case buttonSelectPreviousGuide
    
    case buttonZoomReset
    case buttonZoomJiggle
    
    case buttonBreakTangentWeightGraph
    case buttonGenerateTopography
    case buttonResetWeightGraphInverse
    case buttonResetWeightGraphInverseDampened
    case buttonResetWeightGraphLinear
    case buttonResetWeightGraphLinearDampened
    case buttonResetWeightGraphStandard
    case buttonResetWeightGraphStandardDampened
    case buttonSwivelPanLeft
    case buttonSwivelPanReset
    case buttonSwivelPanRight
    case buttonSwivelRotateLeft
    case buttonSwivelRotateReset
    case buttonSwivelRotateRight
    case buttonSwivelTiltDown
    case buttonSwivelTiltReset
    case buttonSwivelTiltUp
    case buttonSwivelZoomIn
    case buttonSwivelZoomOut
    case buttonSwivelZoomReset
    case buttonZoomIn
    case buttonZoomOut
    
    
    case buttonImageImporterRotateRight
    case buttonImageImporterRotateLeft
    case buttonImageImporterResetAspectFit
    case buttonImageImporterResetAspectFill
    case buttonImageImporterButtonBack
    
    case buttonLoadScreenButtonBack
    
    case createSwatchMakeAndDrawJiggle
    case createSwatchMakeAndDrawGuide
    case createSwatchAddAndRemoveJigglePoints
    case createSwatchAddAndRemoveGuidePoints
    
    case enterModeZoom
    case enterModeGuides
    case enterModeGraph
    case enterModeAnimationLoops
    case enterModeVideoRecord
    case enterModeVideoExport
    case enterModeTimeLine
    case enterModeTimeLinePage2
    
    
    case enterModeLoopsPage1
    case enterModeLoopsPage2
    case enterModeLoopsPage3
    case enterModeAnimationContinuous
    
    
    case exitModeZoom
    case exitModeGuides
    case exitModeGraph
    case exitModeAnimationLoops
    case exitModeVideoRecord
    case exitModeVideoExport
    case exitModeTimeLine
    case exitModeAnimationContinuous
    case exitModeTimeLinePage2
    case exitModeLoopsPage2
    case exitModeLoopsPage3
    
    case greenButtonCreateScene
    case greenButtonDone
    
    
    case mainTabDocumentMode
    case mainTabJainTest
    case mainTabSkainTest
    
    
    case sliderBouncePower
    case sliderBounceSpeed
    case sliderJigglePower
    case sliderJiggleSpeed
    case sliderLoopSpeed
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
            
        case .checkBoxDarkMode:
            return .checkBox
            
        case .checkBoxGyroscopeEnabled:
            return .checkBox
            
        case .checkBoxRecordAudioEnabled:
            return .checkBox
        case .checkBoxStereoscopicEnabled:
            return .checkBox
        case .checkBoxAnimationGrabApplyToAll:
            return .checkBox
        case .checkBoxAnimationLoopApplyToAll:
            return .checkBox
            
            
        case .checkBoxImageImporterRotationEnabled:
            return .checkBox
        case .checkBoxImageImporterEdgesEnabled:
            return .checkBox
        case .checkBoxPurchasedEnabled:
            return .checkBox
            
        case .stepperTimelinePointCount:
            return .stepper
        case .stepperGemCount:
            return .stepper
        case .stepperCoinCount:
            return .stepper
            
            
        case .buttonUndo:
            return .button
        case .buttonRedo:
            return .button
            
        case .buttonMenu:
            return .button
        case .buttonRotateJiggleRight:
            return .button
        case .buttonRotateJiggleLeft:
            return .button
            
        case .buttonRotateGuideLeft:
            return .button
        case .buttonRotateGuideRight:
            return .button
        case .buttonFlipJiggleH:
            return .button
        case .buttonFlipJiggleV:
            return .button
        case .buttonFlipGuideH:
            return .button
        case .buttonFlipGuideV:
            return .button
            
            
        case .buttonFreezeSelectedJiggle:
            return .button
        case .buttonFreezeSelectedGuide:
            return .button
        case .buttonUnfreezeAllJiggles:
            return .button
        case .buttonUnfreezeAllGuides:
            return .button
            
            
            
            
        case .buttonCloneJiggle:
            return .button
        case .buttonCloneGuide:
            return .button
        case .buttonDeleteJiggle:
            return .button
        case .buttonDeleteGuide:
            return .button
        case .buttonDeleteJigglePoint:
            return .button
        case .buttonDeleteGuidePoint:
            return .button
            
            
        case .buttonTimeLineDupeAll:
            return .button
        case .buttonTimeLineDupeDuration:
            return .button
        case .buttonTimeLineDupeCurrentChannel:
            return .button
        case .buttonTimeLineResetFlatCurrentChannel:
            return .button
        case .buttonTimeLineResetDefaultCurrentChannel:
            return .button
            
        case .buttonTimeLineBreakPoint:
            return .button
            
        case .buttonTimeLineInvertH:
            return .button
        case .buttonTimeLineInvertV:
            return .button
        case .buttonTimeLineResetCurve:
            return .button
            
        case .buttonTimeLineAmplify:
            return .button
        case .buttonTimeLineDampen:
            return .button
            
        case .buttonTimeLineFlipAll:
            return .button
            
            
            
        case .buttonSelectNextJigglePoint:
            return .button
        case .buttonSelectPreviousJigglePoint:
            return .button
        case .buttonSelectNextGuidePoint:
            return .button
        case .buttonSelectPreviousGuidePoint:
            return .button
            
        case .buttonSelectNextJiggle:
            return .button
        case .buttonSelectPreviousJiggle:
            return .button
        case .buttonSelectNextGuide:
            return .button
        case .buttonSelectPreviousGuide:
            return .button
        case .buttonZoomReset:
            return .button
        case .buttonZoomJiggle:
            return .button
            
        case .buttonBreakTangentWeightGraph:
            return .button
            
        case .buttonGenerateTopography:
            return .button
            
        case .buttonResetWeightGraphInverse:
            return .button
            
        case .buttonResetWeightGraphInverseDampened:
            return .button
            
        case .buttonResetWeightGraphLinear:
            return .button
            
        case .buttonResetWeightGraphLinearDampened:
            return .button
            
        case .buttonResetWeightGraphStandard:
            return .button
            
        case .buttonResetWeightGraphStandardDampened:
            return .button
            
        case .buttonSwivelPanLeft:
            return .button
            
        case .buttonSwivelPanReset:
            return .button
            
        case .buttonSwivelPanRight:
            return .button
            
        case .buttonSwivelRotateLeft:
            return .button
            
        case .buttonSwivelRotateReset:
            return .button
            
        case .buttonSwivelRotateRight:
            return .button
            
        case .buttonSwivelTiltDown:
            return .button
            
        case .buttonSwivelTiltReset:
            return .button
            
        case .buttonSwivelTiltUp:
            return .button
            
        case .buttonSwivelZoomIn:
            return .button
            
        case .buttonSwivelZoomOut:
            return .button
            
        case .buttonSwivelZoomReset:
            return .button
            
        case .buttonZoomIn:
            return .button
            
        case .buttonZoomOut:
            return .button
            
            
        case .buttonImageImporterRotateRight:
            return .button
        case .buttonImageImporterRotateLeft:
            return .button
        case .buttonImageImporterResetAspectFit:
            return .button
        case .buttonImageImporterResetAspectFill:
            return .button
        case .buttonImageImporterButtonBack:
            return .button
        case .buttonLoadScreenButtonBack:
            return .button
            
            

            
        case .createSwatchMakeAndDrawJiggle:
            return .createSwatch
        case .createSwatchMakeAndDrawGuide:
            return .createSwatch
        case .createSwatchAddAndRemoveJigglePoints:
            return .createSwatch
        case .createSwatchAddAndRemoveGuidePoints:
            return .createSwatch
            
            
        case .enterModeZoom:
            return .enterMode
        case .enterModeGuides:
            return .enterMode
        case .enterModeGraph:
            return .enterMode
        case .enterModeAnimationLoops:
            return .enterMode
        case .enterModeVideoRecord:
            return .enterMode
        case .enterModeVideoExport:
            return .enterMode
        case .enterModeTimeLine:
            return .enterMode
        case .enterModeLoopsPage1:
            return .enterMode
        case .enterModeLoopsPage2:
            return .enterMode
        case .enterModeLoopsPage3:
            return .enterMode
        case .enterModeAnimationContinuous:
            return .enterMode
        case .enterModeTimeLinePage2:
            return .enterMode
            
            
        case .exitModeZoom:
            return .exitMode
        case .exitModeGuides:
            return .exitMode
        case .exitModeGraph:
            return .exitMode
        case .exitModeAnimationLoops:
            return .exitMode
        case .exitModeVideoRecord:
            return .exitMode
        case .exitModeVideoExport:
            return .exitMode
        case .exitModeTimeLine:
            return .exitMode
        case .exitModeAnimationContinuous:
            return .exitMode
        case .exitModeTimeLinePage2:
            return .exitMode
            
        case .exitModeLoopsPage2:
            return .exitMode
        case .exitModeLoopsPage3:
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
        case .sliderJigglePower:
            return .slider
        case .sliderJiggleSpeed:
            return .slider
        case .sliderLoopSpeed:
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
