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

struct ToolInterfaceElementTable {
    
    static var lookUpTable = [ToolInterfaceElement: ToolInterfaceElementType]()
    static func build() {
        
        lookUpTable[.checkBoxDarkMode] = .checkBox
        lookUpTable[.checkBoxGyroscopeEnabled] = .checkBox
        lookUpTable[.checkBoxRecordAudioEnabled] = .checkBox
        lookUpTable[.checkBoxStereoscopicEnabled] = .checkBox
        lookUpTable[.checkBoxAnimationGrabApplyToAll] = .checkBox
        lookUpTable[.checkBoxAnimationLoopApplyToAll] = .checkBox
        lookUpTable[.checkBoxAnimationContinuousApplyToAll] = .checkBox
        lookUpTable[.checkBoxPurchasedEnabled] = .checkBox
        lookUpTable[.checkBoxContinuousDisableGrab] = .checkBox
        lookUpTable[.checkBoxImageImporterRotationEnabled] = .checkBox
        lookUpTable[.checkBoxImageImporterEdgesEnabled] = .checkBox
        
        lookUpTable[.stepperTimelinePointCount] = .stepper
        lookUpTable[.stepperGemCount] = .stepper
        lookUpTable[.stepperCoinCount] = .stepper
        
        lookUpTable[.buttonUndo] = .button
        lookUpTable[.buttonRedo] = .button
        lookUpTable[.buttonMenu] = .button
        lookUpTable[.buttonRotateJiggleRight] = .button
        lookUpTable[.buttonRotateJiggleLeft] = .button
        lookUpTable[.buttonRotateGuideLeft] = .button
        lookUpTable[.buttonRotateGuideRight] = .button
        lookUpTable[.buttonFlipJiggleH] = .button
        lookUpTable[.buttonFlipJiggleV] = .button
        lookUpTable[.buttonFlipGuideH] = .button
        lookUpTable[.buttonFlipGuideV] = .button
        lookUpTable[.buttonFreezeSelectedJiggle] = .button
        lookUpTable[.buttonFreezeSelectedGuide] = .button
        lookUpTable[.buttonUnfreezeAllJiggles] = .button
        lookUpTable[.buttonUnfreezeAllGuides] = .button
        lookUpTable[.buttonCloneJiggle] = .button
        lookUpTable[.buttonCloneGuide] = .button
        lookUpTable[.buttonDeleteJiggle] = .button
        lookUpTable[.buttonDeleteGuide] = .button
        lookUpTable[.buttonDeleteJigglePoint] = .button
        lookUpTable[.buttonDeleteGuidePoint] = .button
        
        lookUpTable[.buttonTimeLineDupeAll] = .button
        lookUpTable[.buttonTimeLineDupeCurrentChannel] = .button
        
        lookUpTable[.buttonTimeLineResetCurve] = .button
        lookUpTable[.buttonTimeLineResetCurveSmall] = .button
        lookUpTable[.buttonTimeLineResetDivot] = .button
        lookUpTable[.buttonTimeLineResetDivotSmall] = .button
        lookUpTable[.buttonTimeLineResetFlat] = .button
        lookUpTable[.buttonTimeLineResetSwan] = .button
        lookUpTable[.buttonTimeLineShiftDown] = .button
        lookUpTable[.buttonTimeLineResetCurve] = .button
        lookUpTable[.buttonTimeLineShiftUp] = .button
        
        lookUpTable[.buttonTimeLineInvertH] = .button
        lookUpTable[.buttonTimeLineInvertV] = .button
        lookUpTable[.buttonTimeLineResetCurve] = .button
        lookUpTable[.buttonTimeLineAmplify] = .button
        lookUpTable[.buttonTimeLineDampen] = .button
        lookUpTable[.buttonTimeLineFlipAll] = .button
        lookUpTable[.buttonTimeLineSyncFrames] = .button
        
        lookUpTable[.buttonSelectNextJigglePoint] = .button
        lookUpTable[.buttonSelectPreviousJigglePoint] = .button
        lookUpTable[.buttonSelectNextGuidePoint] = .button
        lookUpTable[.buttonSelectPreviousGuidePoint] = .button
        lookUpTable[.buttonSelectNextJiggle] = .button
        lookUpTable[.buttonSelectPreviousJiggle] = .button
        lookUpTable[.buttonSelectNextGuide] = .button
        lookUpTable[.buttonSelectPreviousGuide] = .button
        lookUpTable[.buttonZoomReset] = .button
        lookUpTable[.buttonZoomJiggle] = .button
        lookUpTable[.buttonGenerateTopography] = .button
        lookUpTable[.buttonResetWeightGraphInverse] = .button
        lookUpTable[.buttonResetWeightGraphInverseDampened] = .button
        lookUpTable[.buttonResetWeightGraphLinear] = .button
        lookUpTable[.buttonResetWeightGraphLinearDampened] = .button
        lookUpTable[.buttonResetWeightGraphStandard] = .button
        lookUpTable[.buttonResetWeightGraphStandardDampened] = .button
        lookUpTable[.buttonSwivelPanLeft] = .button
        lookUpTable[.buttonSwivelPanReset] = .button
        lookUpTable[.buttonSwivelPanRight] = .button
        lookUpTable[.buttonZoomIn] = .button
        lookUpTable[.buttonZoomOut] = .button
        
        
        lookUpTable[.buttonContinuousSyncFrames] = .button
        lookUpTable[.buttonContinuousResetDuration] = .button
        lookUpTable[.buttonContinuousResetFrameOffset] = .button
        lookUpTable[.buttonContinuousResetSwoop] = .button

        
        lookUpTable[.buttonContinuousResetAngleVertical] = .button
        lookUpTable[.buttonContinuousResetAngleHorizontal] = .button

        lookUpTable[.buttonContinuousResetAngleDiag1] = .button
        lookUpTable[.buttonContinuousResetAngleDiag2] = .button

        
        lookUpTable[.buttonContinuousResetStartScale] = .button
        lookUpTable[.buttonContinuousResetEndScale] = .button
        
        lookUpTable[.buttonContinuousResetStartRotation] = .button
        lookUpTable[.buttonContinuousResetEndRotation] = .button
        
        
        lookUpTable[.buttonImageImporterRotateRight] = .button
        lookUpTable[.buttonImageImporterRotateLeft] = .button
        lookUpTable[.buttonImageImporterResetAspectFit] = .button
        lookUpTable[.buttonImageImporterResetAspectFill] = .button
        lookUpTable[.buttonImageImporterButtonBack] = .button
        lookUpTable[.buttonLoadScreenButtonBack] = .button
        
        lookUpTable[.createSwatchMakeAndDrawJiggle] = .createSwatch
        lookUpTable[.createSwatchMakeAndDrawGuide] = .createSwatch
        lookUpTable[.createSwatchAddAndRemoveJigglePoints] = .createSwatch
        lookUpTable[.createSwatchAddAndRemoveGuidePoints] = .createSwatch
        
        lookUpTable[.enterModeZoom] = .enterMode
        lookUpTable[.enterModeGuides] = .enterMode
        lookUpTable[.enterModeGraph] = .enterMode
        lookUpTable[.enterModeAnimationLoops] = .enterMode
        lookUpTable[.enterModeVideoRecord] = .enterMode
        lookUpTable[.enterModeVideoExport] = .enterMode
        lookUpTable[.enterModeTimeLine] = .enterMode
        lookUpTable[.enterModeGraphPage2] = .enterMode
        lookUpTable[.enterModeLoopsPage1] = .enterMode
        lookUpTable[.enterModeLoopsPage2] = .enterMode
        lookUpTable[.enterModeLoopsPage3] = .enterMode
        lookUpTable[.enterModeTimeLinePage1] = .enterMode
                lookUpTable[.enterModeTimeLinePage2] = .enterMode
                lookUpTable[.enterModeTimeLinePage3] = .enterMode
        lookUpTable[.enterModeContinuousPage1] = .enterMode
                lookUpTable[.enterModeContinuousPage2] = .enterMode
                lookUpTable[.enterModeContinuousPage3] = .enterMode
        lookUpTable[.enterModeAnimationContinuous] = .enterMode
        
        
        lookUpTable[.exitModeZoom] = .exitMode
        lookUpTable[.exitModeGuides] = .exitMode
        lookUpTable[.exitModeGraph] = .exitMode
        lookUpTable[.exitModeAnimationLoops] = .exitMode
        lookUpTable[.exitModeVideoRecord] = .exitMode
        lookUpTable[.exitModeVideoExport] = .exitMode
        lookUpTable[.exitModeTimeLine] = .exitMode
        lookUpTable[.exitModeAnimationContinuous] = .exitMode
        lookUpTable[.exitModeGraphPage2] = .exitMode
        
        
        lookUpTable[.exitModeLoopsPage1] = .exitMode
        lookUpTable[.exitModeLoopsPage2] = .exitMode
        lookUpTable[.exitModeLoopsPage3] = .exitMode
        lookUpTable[.exitModeTimeLinePage1] = .exitMode
        lookUpTable[.exitModeTimeLinePage2] = .exitMode
        lookUpTable[.exitModeTimeLinePage3] = .exitMode
        
        lookUpTable[.exitModeContinuousPage1] = .exitMode
                lookUpTable[.exitModeContinuousPage2] = .exitMode
                lookUpTable[.exitModeContinuousPage3] = .exitMode
        
        lookUpTable[.greenButtonCreateScene] = .greenButton
        lookUpTable[.greenButtonDone] = .greenButton
        
        lookUpTable[.mainTabDocumentMode] = .mainTab
        lookUpTable[.mainTabJainTest] = .mainTab
        lookUpTable[.mainTabSkainTest] = .mainTab
        
        lookUpTable[.sliderJigglePower] = .slider
        lookUpTable[.sliderJiggleSpeed] = .slider
        lookUpTable[.sliderZoomAmount] = .slider
        lookUpTable[.sliderJiggleOpacity] = .slider
        lookUpTable[.sliderJiggleDampen] = .slider
        lookUpTable[.sliderTimeLineDuration] = .slider
        lookUpTable[.sliderTimeLineFrameOffset] = .slider
        
        lookUpTable[.sliderContinuousAngle] = .slider
        lookUpTable[.sliderContinuousDuration] = .slider
        lookUpTable[.sliderContinuousPower] = .slider
        lookUpTable[.sliderContinuousSwoop] = .slider
        lookUpTable[.sliderContinuousFrameOffset] = .slider
        
        lookUpTable[.sliderContinuousStartScale] = .slider
        lookUpTable[.sliderContinuousEndScale] = .slider
        lookUpTable[.sliderContinuousStartRotation] = .slider
        lookUpTable[.sliderContinuousEndRotation] = .slider
        
        
        
        
        lookUpTable[.segmentEditMode] = .segment
        lookUpTable[.segmentWeightMode] = .segment
        lookUpTable[.segmentAnimationMode] = .segment
        
        lookUpTable[.favoringOneLineLabel] = .favoringOneLineLabel
        lookUpTable[.dividerTiny] = .dividerTiny
        lookUpTable[.dividerHuge] = .dividerHuge
        lookUpTable[.dividerSpacerDivider] = .dividerSpacerDivider
        lookUpTable[.spacer] = .spacer
    }
    
}

enum ToolInterfaceElement: UInt16 {
    
    case checkBoxDarkMode
    case checkBoxGyroscopeEnabled
    case checkBoxRecordAudioEnabled
    case checkBoxStereoscopicEnabled
    case checkBoxAnimationGrabApplyToAll
    case checkBoxAnimationLoopApplyToAll
    case checkBoxAnimationContinuousApplyToAll
    case checkBoxPurchasedEnabled
    case checkBoxContinuousDisableGrab
    
    
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
    
    case buttonZoomIn
    case buttonZoomOut
    
    case buttonTimeLineSyncFrames
    case buttonTimeLineDupeAll
    case buttonTimeLineDupeCurrentChannel
    case buttonTimeLineResetCurve
    case buttonTimeLineResetCurveSmall
    case buttonTimeLineResetDivot
    case buttonTimeLineResetDivotSmall
    case buttonTimeLineResetFlat
    case buttonTimeLineResetSwan
    case buttonTimeLineShiftDown
    case buttonTimeLineShiftUp
    case buttonTimeLineInvertH
    case buttonTimeLineInvertV
    case buttonTimeLineAmplify
    case buttonTimeLineDampen
    case buttonTimeLineFlipAll
    
    case buttonContinuousSyncFrames
    case buttonContinuousResetDuration
    case buttonContinuousResetFrameOffset
    case buttonContinuousResetAngleVertical
    case buttonContinuousResetAngleHorizontal
    case buttonContinuousResetAngleDiag1
    case buttonContinuousResetAngleDiag2
    case buttonContinuousResetSwoop
    case buttonContinuousResetStartScale
    case buttonContinuousResetEndScale
    case buttonContinuousResetStartRotation
    case buttonContinuousResetEndRotation
    
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
    case enterModeGraphPage2
    
    case enterModeLoopsPage1
    case enterModeLoopsPage2
    case enterModeLoopsPage3
    case enterModeTimeLinePage1
    case enterModeTimeLinePage2
    case enterModeTimeLinePage3
    case enterModeContinuousPage1
    case enterModeContinuousPage2
    case enterModeContinuousPage3
    
    case enterModeAnimationContinuous
    
    case exitModeZoom
    case exitModeGuides
    case exitModeGraph
    case exitModeAnimationLoops
    case exitModeVideoRecord
    case exitModeVideoExport
    case exitModeTimeLine
    case exitModeAnimationContinuous
    case exitModeGraphPage2
    case exitModeLoopsPage1
    case exitModeLoopsPage2
    case exitModeLoopsPage3
    case exitModeTimeLinePage1
    case exitModeTimeLinePage2
    case exitModeTimeLinePage3
    case exitModeContinuousPage1
    case exitModeContinuousPage2
    case exitModeContinuousPage3
    
    case greenButtonCreateScene
    case greenButtonDone
    
    case mainTabDocumentMode
    case mainTabJainTest
    case mainTabSkainTest
    
    
    case sliderJigglePower
    case sliderJiggleSpeed
    case sliderZoomAmount
    case sliderJiggleOpacity
    case sliderJiggleDampen
    
    case sliderTimeLineDuration
    case sliderTimeLineFrameOffset
    
    case sliderContinuousAngle
    case sliderContinuousDuration
    case sliderContinuousPower
    case sliderContinuousSwoop
    case sliderContinuousFrameOffset
    case sliderContinuousStartScale
    case sliderContinuousEndScale
    case sliderContinuousStartRotation
    case sliderContinuousEndRotation
    
    case segmentEditMode
    case segmentWeightMode
    case segmentAnimationMode
    
    case spacer
    
    case dividerTiny
    case dividerHuge
    case dividerSpacerDivider
    
    case favoringOneLineLabel
    
    var type: ToolInterfaceElementType {
        guard let result = ToolInterfaceElementTable.lookUpTable[self] else {
            fatalError("Expected a type lookup for \(self)")
        }
        return result
    }
}
