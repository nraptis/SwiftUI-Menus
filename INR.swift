//
//  INR.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/16/24.
//

import Foundation

enum INR_Button {
    case menu
    
    case undo
    case redo
    
    case zoomReset
    case zoomJiggle
    case zoomIn
    case zoomOut
    
    case generateTopography
    
    // {Jiggle}
    case flipJiggleHorizontal
    case flipJiggleVertical
    case rotateJiggleLeft
    case rotateJiggleRight
    case selectPreviousJiggle
    case selectPreviousJigglePoint
    case selectNextJiggle
    case selectNextJigglePoint
    case unfreezeJiggles
    case freezeJiggle
    case cloneJiggle
    case deleteJiggle
    case deleteJigglePoint

    // {Guide}
    case flipGuideHorizontal
    case flipGuideVertical
    case rotateGuideLeft
    case rotateGuideRight
    case selectPreviousGuide
    case selectPreviousGuidePoint
    case selectNextGuide
    case selectNextGuidePoint
    case unfreezeGuides
    case freezeGuide
    case cloneGuide
    case deleteGuide
    case deleteGuidePoint
    
    // {TimeLine}
    case timeLineResetDefaultCurrentChannel
    case timeLineResetCurveCurrentChannel
    case timeLineResetFlatCurrentChannel
    case timeLineDupeDuration
    case timeLineDupeCurrentChannel
    case timeLineDupeAll
    case timeLineInvertVertical
    case timeLineInvertHorizontal
    case timeLineFlipAll
    case timeLineDampen
    case timeLineAmplify
    case timeLineBreakPoint
    
}

enum INR_CheckBox {
    case darkMode
    case buy
    case stereoscopic
    
    case animationGrabApplyToAll
    case animationLoopApplyToAll
}

enum INR_Segment {
    case editMode
    case weightMode
    case animationMode
    
}

enum INR_CreateSwatch {
    case jiggleAffine
    case jigglePoints
    case guideAffine
    case guidePoints
}

enum INR_EnterMode {
    case guides
    case graph
    case zoom
    case videoRecord
    case videoExport
    case animationLoops
    case animationContinuous
    case timeLine
    case timeLinePage2
    
    case loopsPage1
    case loopsPage2
    case loopsPage3
}

enum INR_ExitMode {
    case guides
    case graph
    case zoom
    case videoRecord
    case videoExport
    case animationLoops
    case animationContinuous
    case timeLine
    case timeLinePage2
    case loopsPage2
    case loopsPage3
}

enum INR_MainTab {
    case documentMode
    case skainTabTest
    case jainTabTest
    
}

enum INR_Stepper {
    case timeLinePointCount
    case coinCount
    case gemCount
}

enum INR_Slider {
    struct Slider_Data {
        let widthCategory: ToolInterfaceElementSliderWidthCategory
        let slider: INR_Slider
    }
    
    case jiggleOpacity
    case jigglePower
    case jiggleSpeed
    case jiggleDampen
    
    case zoomAmount
    
    case timeLineDuration
    case timeLineOffset
}

enum INR_FavoringOneLineLabel {
    struct FavoringOneLineLabel_Data {
        let minimumWidth: Int
        let text: String
    }
}

enum INR_GreenButton {
    case createScene
    case done
}

enum INR {
    
    case button_pair(INR_Button, INR_Button)
    case button_triplet(INR_Button, INR_Button, INR_Button)
    
    case button(INR_Button)
    case checkBox(INR_CheckBox)
    case slider(INR_Slider.Slider_Data)
    case segment(INR_Segment)
    case enterMode(INR_EnterMode)
    case exitMode(INR_ExitMode)
    
    case createSwatch(INR_CreateSwatch)
    case mainTab(INR_MainTab)
    
    case favoringOneLineLabel(INR_FavoringOneLineLabel.FavoringOneLineLabel_Data)
    case greenButton(INR_GreenButton)
    
    case stepper(INR_Stepper)
    
    case spacer
    case dividerHuge
    case dividerTiny
    case dividerSpacerDivider
    
    func getType() -> ToolInterfaceElementType {
        switch self {
        case .button: return .button
        case .button_pair: return .button
        case .button_triplet: return .button
        case .checkBox: return .checkBox
        case .slider: return .slider
        case .segment: return .segment
        case .enterMode: return .enterMode
        case .exitMode: return .exitMode
        case .createSwatch: return .createSwatch
        case .mainTab: return .mainTab
        case .favoringOneLineLabel: return .favoringOneLineLabel
        case .greenButton: return .greenButton
        case .stepper: return .stepper
        case .spacer: return .spacer
        case .dividerHuge: return .dividerHuge
        case .dividerTiny: return .dividerTiny
        case .dividerSpacerDivider: return .dividerSpacerDivider
        }
    }
}


