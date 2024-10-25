//
//  INR.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/16/24.
//

import Foundation

enum INR_Button: UInt8 {
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
    case timeLineResetDefaultCurrentChannel //
    case timeLineResetCurveCurrentChannel //
    case timeLineResetFlatCurrentChannel //
    case timeLineDupeDuration //
    case timeLineDupeCurrentChannel //
    case timeLineDupeAll //
    case timeLineInvertVertical //
    case timeLineInvertHorizontal //
    case timeLineFlipAll //
    case timeLineDampen //
    case timeLineAmplify //
    case timeLineBreakPoint //
    
    // {Weight Graph}
    case breakTangentWeightGraph
    case resetWeightGraphStandard
    case resetWeightGraphStandardDampened
    case resetWeightGraphLinear
    case resetWeightGraphLinearDampened
    case resetWeightGraphInverse
    case resetWeightGraphInverseDampened
    
    // {Swivel}
    case swivelPanReset
    case swivelPanLeft
    case swivelPanRight
    
    // {Image Importer}
    case imageImporterButtonBack
    case imageImporterRotateRight
    case imageImporterRotateLeft
    case imageImporterResetAspectFit
    case imageImporterResetAspectFill
    
    // {Load Screen}
    case loadScreenBack
    
}

enum INR_CheckBox: UInt8 {
    case darkMode
    case buy
    case stereoscopic
    
    case gyroscopeEnabled
    
    case animationGrabApplyToAll
    case animationLoopApplyToAll
    
    case recordAudioEnabled
    
    case imageImportSnapEdges
    case imageImportSnapRotation
    
    
    
}

enum INR_Segment: UInt8 {
    case editMode
    case weightMode
    case animationMode
    
}

enum INR_CreateSwatch: UInt8 {
    case jiggleAffine
    case jigglePoints
    case guideAffine
    case guidePoints
}

enum INR_EnterMode: UInt8 {
    case guides
    case graph
    case zoom
    case videoRecord
    case videoExport
    case animationLoops
    case animationContinuous
    case timeLine
    case timeLinePage2
    case graphPage2
    case animationContinuousPage2
    
    
    case loopsPage1
    case loopsPage2
    case loopsPage3
}

enum INR_ExitMode: UInt8 {
    case guides
    case graph
    case zoom
    case videoRecord
    case videoExport
    case animationLoops
    case animationContinuous
    case timeLine
    case timeLinePage2
    case graphPage2
    case animationContinuousPage2
    
    case loopsPage1
    case loopsPage2
    case loopsPage3
}

enum INR_MainTab: UInt8 {
    case documentMode
    case skainTabTest
    case jainTabTest
    
}

enum INR_Stepper: UInt8 {
    case timeLinePointCount
    case coinCount
    case gemCount
}

struct INR_Slider_Data {
    let widthCategory: ToolInterfaceElementSliderWidthCategory
    let slider: INR_Slider
}

extension INR_Slider_Data: Equatable {
    
}

enum INR_Slider: UInt8 {
    
    
    case jiggleOpacity
    case jigglePower
    case jiggleSpeed
    case jiggleDampen
    
    case zoomAmount
    
    case timeLineDuration
    case timeLineOffset
}

struct INR_FavoringOneLineLabel_Data {
    let minimumWidth: Int
    let text: String
}

extension INR_FavoringOneLineLabel_Data: Equatable {
    
}

enum INR_GreenButton: UInt8 {
    case createScene
    case done
}

enum INR {
    
    case button_pair(INR_Button, INR_Button)
    case button_triplet(INR_Button, INR_Button, INR_Button)
    
    case button(INR_Button)
    case checkBox(INR_CheckBox)
    case slider(INR_Slider_Data)
    case segment(INR_Segment)
    case enterMode(INR_EnterMode)
    case exitMode(INR_ExitMode)
    
    case createSwatch(INR_CreateSwatch)
    case mainTab(INR_MainTab)
    
    case favoringOneLineLabel(INR_FavoringOneLineLabel_Data)
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

extension INR: Equatable {
    static func == (lhs: INR, rhs: INR) -> Bool {
        switch lhs {
        case .spacer:
            switch rhs {
            case .spacer:
                return true
            default:
                return false
            }
        case .dividerHuge:
            switch rhs {
            case .dividerHuge:
                return true
            default:
                return false
            }
        case .dividerTiny:
            switch rhs {
            case .dividerTiny:
                return true
            default:
                return false
            }
        case .dividerSpacerDivider:
            switch rhs {
            case .dividerSpacerDivider:
                return true
            default:
                return false
            }
        case .button_pair(let iNR_ButtonA1, let iNR_ButtonA2):
            switch rhs {
            case .button_pair(let iNR_ButtonB1, let iNR_ButtonB2):
                return iNR_ButtonA1 == iNR_ButtonB1 && iNR_ButtonA2 == iNR_ButtonB2
            default:
                return false
            }
        case .button_triplet(let iNR_ButtonA1, let iNR_ButtonA2, let iNR_ButtonA3):
            switch rhs {
            case .button_triplet(let iNR_ButtonB1, let iNR_ButtonB2, let iNR_ButtonB3):
                return iNR_ButtonA1 == iNR_ButtonB1 && iNR_ButtonA2 == iNR_ButtonB2 && iNR_ButtonA3 == iNR_ButtonB3
            default:
                return false
            }
        case .button(let iNR_ButtonA):
            switch rhs {
            case .button(let iNR_ButtonB):
                return iNR_ButtonA == iNR_ButtonB
            default:
                return false
            }
        case .checkBox(let iNR_CheckBoxA):
            switch rhs {
            case .checkBox(let iNR_CheckBoxB):
                return iNR_CheckBoxA == iNR_CheckBoxB
            default:
                return false
            }
        case .slider(let iNR_SliderA):
            switch rhs {
            case .slider(let iNR_SliderB):
                return iNR_SliderA == iNR_SliderB
            default:
                return false
            }
        case .segment(let iNR_SegmentA):
            switch rhs {
            case .segment(let iNR_SegmentB):
                return iNR_SegmentA == iNR_SegmentB
            default:
                return false
            }
        case .enterMode(let iNR_EnterModeA):
            switch rhs {
            case .enterMode(let iNR_EnterModeB):
                return iNR_EnterModeA == iNR_EnterModeB
            default:
                return false
            }
        case .exitMode(let iNR_ExitModeA):
            switch rhs {
            case .exitMode(let iNR_ExitModeB):
                return iNR_ExitModeA == iNR_ExitModeB
            default:
                return false
            }
        case .createSwatch(let iNR_CreateSwatchA):
            switch rhs {
            case .createSwatch(let iNR_CreateSwatchB):
                return iNR_CreateSwatchA == iNR_CreateSwatchB
            default:
                return false
            }
        case .mainTab(let iNR_MainTabA):
            switch rhs {
            case .mainTab(let iNR_MainTabB):
                return iNR_MainTabA == iNR_MainTabB
            default:
                return false
            }
        case .favoringOneLineLabel(let favoringOneLineLabel_DataA):
            switch rhs {
            case .favoringOneLineLabel(let favoringOneLineLabel_DataB):
                return favoringOneLineLabel_DataA == favoringOneLineLabel_DataB
            default:
                return false
            }
        case .greenButton(let iNR_GreenButtonA):
            switch rhs {
            case .greenButton(let iNR_GreenButtonB):
                return iNR_GreenButtonA == iNR_GreenButtonB
            default:
                return false
            }
        case .stepper(let iNR_StepperA):
            switch rhs {
            case .stepper(let iNR_StepperB):
                return iNR_StepperA == iNR_StepperB
            default:
                return false
            }
            
        }
        
    }
}

