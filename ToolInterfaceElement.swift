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
        lookUpTable[.checkBoxPurchasedEnabled] = .checkBox
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
        lookUpTable[.buttonTimeLineDupeDuration] = .button
        lookUpTable[.buttonTimeLineDupeCurrentChannel] = .button
        lookUpTable[.buttonTimeLineResetFlatCurrentChannel] = .button
        lookUpTable[.buttonTimeLineResetDefaultCurrentChannel] = .button
        lookUpTable[.buttonTimeLineBreakPoint] = .button
        lookUpTable[.buttonTimeLineInvertH] = .button
        lookUpTable[.buttonTimeLineInvertV] = .button
        lookUpTable[.buttonTimeLineResetCurve] = .button
        lookUpTable[.buttonTimeLineAmplify] = .button
        lookUpTable[.buttonTimeLineDampen] = .button
        lookUpTable[.buttonTimeLineFlipAll] = .button
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
        lookUpTable[.buttonBreakTangentWeightGraph] = .button
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
        lookUpTable[.enterModeTimeLinePage2] = .enterMode
        lookUpTable[.enterModeGraphPage2] = .enterMode
        lookUpTable[.enterModeLoopsPage1] = .enterMode
        lookUpTable[.enterModeLoopsPage2] = .enterMode
        lookUpTable[.enterModeLoopsPage3] = .enterMode
        lookUpTable[.enterModeAnimationContinuous] = .enterMode
        lookUpTable[.enterModeAnimationContinuousPage2] = .enterMode
        
        lookUpTable[.exitModeZoom] = .exitMode
        lookUpTable[.exitModeGuides] = .exitMode
        lookUpTable[.exitModeGraph] = .exitMode
        lookUpTable[.exitModeAnimationLoops] = .exitMode
        lookUpTable[.exitModeVideoRecord] = .exitMode
        lookUpTable[.exitModeVideoExport] = .exitMode
        lookUpTable[.exitModeTimeLine] = .exitMode
        lookUpTable[.exitModeAnimationContinuous] = .exitMode
        lookUpTable[.exitModeTimeLinePage2] = .exitMode
        lookUpTable[.exitModeGraphPage2] = .exitMode
        
        
        lookUpTable[.exitModeLoopsPage1] = .exitMode
        lookUpTable[.exitModeLoopsPage2] = .exitMode
        lookUpTable[.exitModeLoopsPage3] = .exitMode
        lookUpTable[.exitModeAnimationContinuousPage2] = .exitMode
        
        
        lookUpTable[.greenButtonCreateScene] = .greenButton
        lookUpTable[.greenButtonDone] = .greenButton
        
        lookUpTable[.mainTabDocumentMode] = .mainTab
        lookUpTable[.mainTabJainTest] = .mainTab
        lookUpTable[.mainTabSkainTest] = .mainTab
        
        lookUpTable[.sliderBouncePower] = .slider
        lookUpTable[.sliderBounceSpeed] = .slider
        lookUpTable[.sliderJigglePower] = .slider
        lookUpTable[.sliderJiggleSpeed] = .slider
        lookUpTable[.sliderLoopSpeed] = .slider
        lookUpTable[.sliderZoomAmount] = .slider
        lookUpTable[.sliderJiggleOpacity] = .slider
        lookUpTable[.sliderJiggleDampen] = .slider
        lookUpTable[.sliderTimeLineDuration] = .slider
        lookUpTable[.sliderTimeLineOffset] = .slider
        
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
    case checkBoxPurchasedEnabled
    
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
    case enterModeGraphPage2
    case enterModeLoopsPage1
    case enterModeLoopsPage2
    case enterModeLoopsPage3
    case enterModeAnimationContinuous
    case enterModeAnimationContinuousPage2
    
    case exitModeZoom
    case exitModeGuides
    case exitModeGraph
    case exitModeAnimationLoops
    case exitModeVideoRecord
    case exitModeVideoExport
    case exitModeTimeLine
    case exitModeAnimationContinuous
    case exitModeTimeLinePage2
    case exitModeGraphPage2
    case exitModeAnimationContinuousPage2
    
    case exitModeLoopsPage1
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
        guard let result = ToolInterfaceElementTable.lookUpTable[self] else {
            fatalError("Expected a type lookup for \(self)")
        }
        return result
    }
}
