//
//  ToolInterfaceViewModel+RowsPadBottom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRowBluePrint_Bottom_Primary_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        if configuration.isGraphEnabled { return getRowBluePrint_Bottom_Primary_Graph_Pad() }
        
        if configuration.isView {
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    if configuration.isTimeLinePage2Enabled {
                        return getRowBluePrint_Bottom_Primary_View_TimeLine_Page2_Pad()
                    } else {
                        return getRowBluePrint_Bottom_Primary_View_TimeLine_Page1_Pad()
                    }
                    
                } else {
                    if configuration.animationLoopsPage == 3 {
                        
                    }
                    return getRowBluePrint_Bottom_Primary_View_Loops_Pad()
                }
                
            }
            if configuration.isAnimationContinuousEnabled {
                return getRowBluePrint_Bottom_Primary_View_Continuous_Pad()
            }
            return getRowBluePrint_Bottom_Primary_View_Grab_Pad()
            
        }
        
        
        return getRowBluePrint_Bottom_Primary_Standard_Pad()
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        if configuration.isZoomEnabled { return getRowBluePrint_Top_Secondary1_Empty() }
        
        
        if configuration.isGuides {
            
            if configuration.isGraphEnabled {
                return getRowBluePrint_Bottom_Secondary1_Graph_Pad()
            }
            
            switch configuration.weightMode {
            case .affine:
                return getRowBluePrint_Bottom_Secondary1_Guides_Affine_Pad()
            case .points:
                return getRowBluePrint_Bottom_Secondary1_Guides_Points_Pad()
            }
        }
        
        if configuration.isView {
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    
                    if configuration.isTimeLinePage2Enabled {
                        return getRowBluePrint_Bottom_Secondary1_View_TimeLine_Page2_Pad()
                    } else {
                        return getRowBluePrint_Bottom_Secondary1_View_TimeLine_Page1_Pad()
                    }
                    
                } else {
                    if configuration.animationLoopsPage == 3 {
                        return getRowBluePrint_Bottom_Secondary1_View_LoopsPage3_Pad()
                    } else if configuration.animationLoopsPage == 2 {
                        return getRowBluePrint_Bottom_Secondary1_View_LoopsPage2_Pad()
                    } else {
                        return getRowBluePrint_Bottom_Secondary1_View_LoopsPage1_Pad()
                    }
                    
                }
                
            }
            if configuration.isAnimationContinuousEnabled {
                return getRowBluePrint_Bottom_Secondary1_View_Continuous_Pad()
            }
            return getRowBluePrint_Bottom_Secondary1_View_Grab_Pad()
        }
        
        if configuration.isPoints { return getRowBluePrint_Bottom_Secondary1_Points_Pad() }
        
        return getRowBluePrint_Bottom_Secondary1_Jiggles_Pad()
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        if configuration.isZoomEnabled { return getRowBluePrint_Top_Secondary2_Empty() }
        if configuration.isPoints { return getRowBluePrint_Bottom_Secondary2_Points_Pad() }
        
        if configuration.isGuides {
            
            if configuration.isGraphEnabled {
                return getRowBluePrint_Bottom_Secondary2_Graph_Pad()
            }
            
            switch configuration.weightMode {
            case .affine:
                return getRowBluePrint_Bottom_Secondary2_Guides_Affine_Pad()
            case .points:
                return getRowBluePrint_Bottom_Secondary2_Guides_Points_Pad()
            }
        }
        
        if configuration.isView {
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    print("configuration.isTimeLinePage2Enabled = ", configuration.isTimeLinePage2Enabled)
                    if configuration.isTimeLinePage2Enabled {
                        return getRowBluePrint_Bottom_Secondary2_View_TimeLine_Page2_Pad()
                    } else {
                        return getRowBluePrint_Bottom_Secondary2_View_TimeLine_Page1_Pad()
                    }
                } else {
                    if configuration.animationLoopsPage == 3 {
                        return getRowBluePrint_Bottom_Secondary2_View_LoopsPage3_Pad()
                    } else if configuration.animationLoopsPage == 2 {
                        return getRowBluePrint_Bottom_Secondary2_View_LoopsPage2_Pad()
                    } else {
                        return getRowBluePrint_Bottom_Secondary2_View_LoopsPage1_Pad()
                    }
                }
                
            }
            if configuration.isAnimationContinuousEnabled {
                return getRowBluePrint_Bottom_Secondary2_View_Continuous_Pad()
            }
            return getRowBluePrint_Bottom_Secondary2_View_Grab_Pad()
        }
        
        return getRowBluePrint_Bottom_Secondary2_Jiggles_Pad()
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_Standard_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.zoom),
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Standard, centerPinnedElement: .mainTabDocumentMode)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_Graph_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button_pair(.undo, .redo),
            .mainTab(.documentMode)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Graph, centerPinnedElement: .mainTabDocumentMode)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_Grab_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button_pair(.undo, .redo),
            .spacer,
            .mainTab(.documentMode),
            .spacer,
            .checkBox(.stereoscopic),
            .button(.zoomReset),
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Grab, centerPinnedElement: .mainTabDocumentMode)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_Continuous_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button_pair(.undo, .redo),
            .spacer,
            .mainTab(.documentMode),
            .spacer,
            .checkBox(.stereoscopic),
            .button(.zoomReset),
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Continuous, centerPinnedElement: .mainTabDocumentMode)
        
        /*
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [//getUndoButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     //Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     //getRedoButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     //Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     centerPinnedNode,
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getStereoscopicEnabledCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Continuous)
        */
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_Loops_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button_pair(.undo, .redo),
            .spacer,
            .mainTab(.documentMode),
            .spacer,
            .checkBox(.stereoscopic),
            .button(.zoomReset),
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Loops, centerPinnedElement: .mainTabDocumentMode)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_TimeLine_Page1_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.undo, .redo),
            .spacer,
            .mainTab(.documentMode),
            .spacer,
            .checkBox(.stereoscopic),
            .button(.zoomReset),
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_TimeLine_Page1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_TimeLine_Page2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .enterMode(.videoRecord),
            .spacer,
            .mainTab(.documentMode),
            .spacer,
            .button_pair(.undo, .redo),
            .checkBox(.stereoscopic),
            .button(.zoomReset)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_TimeLine_Page2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Jiggles_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .segment(.editMode),
            .spacer,
            
            .button_pair(.cloneJiggle, .deleteJiggle),
            
            .dividerSpacerDivider,
            
            .button_pair(.zoomJiggle, .zoomReset)
            
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Jiggles)
        
        /*
         let nodes = [getEditModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         
         getCloneJiggleButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         
         getDeleteJiggleButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         
         Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
         
         getZoomJiggleButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         getZoomResetButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
         ]
         return RowBluePrint(nodes: nodes, configuration: .)
         */
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Jiggles_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .createSwatch(.jiggleAffine),
            .spacer,
            .enterMode(.guides)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Points_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .segment(.editMode),
            .spacer,
            .button_pair(.zoomJiggle, .zoomReset)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_Grab_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .checkBox(.stereoscopic),
            .spacer,
            .checkBox(.animationGrabApplyToAll),
            .spacer,
            .button(.zoomReset),
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_Continuous_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .checkBox(.stereoscopic),
            .spacer,
            .checkBox(.animationGrabApplyToAll),
            .spacer,
            .button(.zoomReset),
            .enterMode(.videoRecord)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_LoopsPage1_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .exitMode(.animationLoops),
            .enterMode(.timeLine),
            .spacer,
            .checkBox(.animationGrabApplyToAll)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.animationLoops),
            .enterMode(.timeLine),
            .spacer,
            .checkBox(.animationGrabApplyToAll)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_LoopsPage3_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .exitMode(.animationLoops),
            .enterMode(.timeLine),
            .spacer,
            .enterMode(.animationLoops),
            .enterMode(.animationContinuous)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_LoopsPage3)
    }
    
    
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Points_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .createSwatch(.jigglePoints),
            .spacer,
            .button(.deleteJigglePoint),
            .spacer,
            .enterMode(.guides)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Guides_Affine_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .segment(.weightMode),
            .spacer,
            .button_pair(.cloneGuide, .deleteGuide),
            .dividerSpacerDivider,
            .button_pair(.zoomJiggle, .zoomReset),
            .spacer,
            .button_pair(.undo, .redo),
            .checkBox(.stereoscopic),
            .button(.zoomReset)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Guides_Points_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .segment(.weightMode),
            .spacer,
            .button_pair(.zoomJiggle, .zoomReset)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Guides_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Graph_Pad() -> RowBluePrint {
        let nodes = [
            //getGuidesExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            //Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
            getBreakTangentWeightGraphButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getResetWeightGraphLinearButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getResetWeightGraphLinearDampenedButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Graph)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Guides_Affine_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .exitMode(.guides),
            .createSwatch(.guideAffine),
            .spacer,
            .button(.deleteGuide),
            .spacer,
            .enterMode(.graph),
            
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Guides_Points_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .exitMode(.guides),
            .spacer,
            .button(.deleteGuidePoint),
            .spacer,
            .enterMode(.graph),
            .createSwatch(.jigglePoints)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Guides_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Graph_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.graph),
            .spacer,
            .button_pair(.zoomJiggle, .zoomReset)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Graph)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_Grab_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .enterMode(.animationLoops),
            .slider(.init(widthCategory: .stretch, slider: .jiggleOpacity)),
            .enterMode(.animationContinuous)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_Continuous_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.animationContinuous),
            .spacer,
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "View Continuous Pad")),
            .spacer,
            .checkBox(.animationGrabApplyToAll),
            .spacer,
            .button(.zoomReset),
            .enterMode(.animationLoops)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.animationLoops),
            .spacer,
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "View Loops Pad Page 1")),
            .spacer,
            .checkBox(.animationLoopApplyToAll),
            .spacer,
            .button(.zoomReset),
            .enterMode(.timeLine)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.animationLoops),
            .spacer,
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "View Loops Pad Page 2")),
            .spacer,
            .checkBox(.animationLoopApplyToAll),
            .spacer,
            .button(.zoomReset),
            .enterMode(.timeLine)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.animationLoops),
            .spacer,
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "View Loops Pad Page 3")),
            .spacer,
            .checkBox(.animationLoopApplyToAll),
            .spacer,
            .button(.zoomReset),
            .enterMode(.timeLine)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_TimeLine_Page1_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .slider(.init(widthCategory: .halfWidthLeft, slider: .timeLineDuration)),
            .spacer,
            .button_pair(.timeLineDupeAll, .timeLineFlipAll),
            .spacer,
            .enterMode(.timeLinePage2)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_TimeLine_Page1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_TimeLine_Page2_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .exitMode(.timeLinePage2),
            .stepper(.timeLinePointCount),
            .spacer,
            .button_pair(.timeLineResetDefaultCurrentChannel, .timeLineResetDefaultCurrentChannel),
            .spacer
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_TimeLine_Page2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_TimeLine_Page1_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.timeLine),
            .button_pair(.timeLineAmplify, .timeLineDampen),
            .dividerSpacerDivider,
            .button_pair(.timeLineInvertHorizontal, .timeLineInvertVertical),
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_TimeLine_Page1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_TimeLine_Page2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.timeLine),
            .button_pair(.timeLineAmplify, .timeLineDampen),
            .dividerSpacerDivider,
            .button_pair(.timeLineInvertHorizontal, .timeLineInvertVertical)
        ])
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_TimeLine_Page2)
    }
    
}
