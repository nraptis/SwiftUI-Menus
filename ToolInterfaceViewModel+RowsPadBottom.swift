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
                    return getRowBluePrint_Bottom_Primary_View_TimeLine_Pad()
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
                    return getRowBluePrint_Bottom_Secondary1_View_TimeLine_Pad()
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
                    return getRowBluePrint_Bottom_Secondary2_View_TimeLine_Pad()
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
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     centerPinnedNode,
                     
                     //get
                     
                     getEnterZoomEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Standard, centerPinnedNode: centerPinnedNode)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_Graph_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     centerPinnedNode,
        ]
        
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Graph, centerPinnedNode: centerPinnedNode)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_Grab_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     centerPinnedNode,
                     getStereoscopicEnabledSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_Continuous_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     centerPinnedNode,
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getStereoscopicEnabledSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_Loops_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     centerPinnedNode,
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getStereoscopicEnabledSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_Loops)
    }
    
    
    @MainActor func getRowBluePrint_Bottom_Primary_View_TimeLine_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     centerPinnedNode,
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getStereoscopicEnabledSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_View_TimeLine)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getEditModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleCentersSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getGuideCentersSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     // TODO: Remo
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     // TODO: Remo
                     getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getGuideCentersSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getCloneJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     
                     getDeleteJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getEnterGuidesEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Points_Pad() -> RowBluePrint {
        let nodes = [getEditModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleCentersSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_Grab_Pad() -> RowBluePrint {
        let nodes = [getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     
                     getEnterAnimationLoopsEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_Continuous_Pad() -> RowBluePrint {
        let nodes = [getEnterVideoRecordEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     
                     getEnterAnimationLoopsEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterTimeLineEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                    getEnterTimeLineEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),

        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterTimeLineEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     
                     getEnterAnimationLoopsEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),

        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_View_TimeLine_Pad() -> RowBluePrint {
        let nodes = [getTimeLineInvertHSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineInvertVSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineResetCurveSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     
                     getTimeLineBreakPointSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getTimeLineResetGraphSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getTimeLineDurationSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getAnimationBounceApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View_TimeLine)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = [getAddAndRemoveJigglePointsCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getDeleteJigglePointSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getEnterGuidesEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [
            getWeightModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getGuideCentersSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            
            getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Guides_Points_Pad() -> RowBluePrint {
        let nodes = [
            getWeightModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getGuideCentersSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            
            
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Guides_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary1_Graph_Pad() -> RowBluePrint {
        let nodes = [getExitGuidesExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getBreakTangentWeightGraphSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getResetWeightGraphLinearSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getResetWeightGraphLinearDampenedSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Graph)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [getExitGuidesExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getMakeAndDrawGuideCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getCloneGuideSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getDeleteGuideSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getEnterGraphEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Guides_Points_Pad() -> RowBluePrint {
        let nodes = [Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     getDeleteGuidePointSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterGraphEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAddAndRemoveGuidePointsCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Guides_Points)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_Graph_Pad() -> RowBluePrint {
        let nodes = [getExitGraphExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     getZoomJiggleSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getZoomResetSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Graph)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_Grab_Pad() -> RowBluePrint {
        let nodes = [Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     
                     getEnterAnimationLoopsEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_Continuous_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationLoopsEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterTimeLineEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterTimeLineEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = [getExitAnimationLoopsExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterTimeLineEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Bottom_Secondary2_View_TimeLine_Pad() -> RowBluePrint {
        
        let centerPinnedNode = getTimelinePointCountSexyStepperToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        
        let nodes = [getTimeLineFlipAllSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineDampenSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineAmplifySexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getExitTimeLineExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getTimeLineDupeAllSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineDupeDurationSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineDupeCurrentChannelSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineFlattenCurrentChannelSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getTimeLineResetDefaultCurrentChannelSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     centerPinnedNode,
                     
                     getTimeLineOffsetSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View_TimeLine, centerPinnedNode: centerPinnedNode)
    }
    
}
