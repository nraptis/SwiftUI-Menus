//
//  ToolInterfaceViewModel+RowsPadBottom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRowBluePrint_Bottom_Primary_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        if configuration.isGraphEnabled { return getRowBluePrint_Bottom_Primary_Graph_Pad() }
        return getRowBluePrint_Bottom_Primary_Standard_Pad()
    }
    
    func getRowBluePrint_Bottom_Secondary1_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
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
        
        if configuration.isView { return getRowBluePrint_Bottom_Secondary1_View_Pad() }
        
        if configuration.isPoints { return getRowBluePrint_Bottom_Secondary1_Points_Pad() }
        
        return getRowBluePrint_Bottom_Secondary1_Jiggles_Pad()
    }
    
    func getRowBluePrint_Bottom_Secondary2_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
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
        
        if configuration.isView { return getRowBluePrint_Bottom_Secondary2_View_Pad() }
        
        return getRowBluePrint_Bottom_Secondary2_Jiggles_Pad()
    }
    
    func getRowBluePrint_Bottom_Primary_Standard_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     centerPinnedNode,
                     getEnterZoomEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Standard, centerPinnedNode: centerPinnedNode)
    }
    
    func getRowBluePrint_Bottom_Primary_Graph_Pad() -> RowBluePrint {
        let centerPinnedNode = getDocumentModeMainTabToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        let nodes = [getUndoTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     centerPinnedNode,
        ]
        
        return RowBluePrint(nodes: nodes, configuration: .bottom_Primary_Graph, centerPinnedNode: centerPinnedNode)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Jiggles_Pad() -> RowBluePrint {
        let nodes = [
            
            getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getAnimationModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            //getExitGraphExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            //getExitGuidesExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEditModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleCentersEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Jiggles)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [
            
            getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
            getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getCreateJigglesStandardCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getCreateJigglesDrawingCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getCloneJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRemoveJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getViewModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getEnterGuidesEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Jiggles)
    }
    
    
    
    func getRowBluePrint_Bottom_Secondary1_Points_Pad() -> RowBluePrint {
        let nodes = [getCreatePointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: .checkBox),
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEditModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleCentersEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary1_View_Pad() -> RowBluePrint {
        let nodes = [getAnimationModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: .spacer),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: .textIconButton),
                     getAnimationJiggleApplyToAllCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: .checkBox),
                     getAnimationBounceApplyToAllCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: .checkBox),
                     getAnimationWobbleApplyToAllCheckBoxNode(neighborTypeLeft: .checkBox, neighborTypeRight: .checkBox),
                     getAnimationTwistApplyToAllCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     
                     getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .spacer, neighborTypeRight: .textIconButton),
                     getResetZoomTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_View)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = [getRemovePointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRemovePointTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getEnterGuidesEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [
            getExitGuidesExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getWeightModeSegmentToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getGuideCentersEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getResetZoomTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Guides_Affine)
    }
    
    func getRowBluePrint_Bottom_Secondary1_Guides_Points_Pad() -> RowBluePrint {
        return getRowBluePrint_Bottom_Secondary1_Guides_Affine_Pad()
    }
    
    
    func getRowBluePrint_Bottom_Secondary1_Graph_Pad() -> RowBluePrint {
        let nodes = [
            getExitGuidesExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
            getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getResetZoomTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary1_Graph)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [getCreateWeightRingsStandardCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getCreateWeightRingsDrawingCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getCloneWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRemoveWeightRingTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getEnterGraphEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Guides_Affine)
    }
    
    
    
    func getRowBluePrint_Bottom_Secondary2_Guides_Points_Pad() -> RowBluePrint {
        let nodes = [getCreateWeightRingPointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRemoveWeightRingPointsCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     getRemoveWeightRingPointTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getSpacerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterGraphEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Guides_Points)
    }
    
    func getRowBluePrint_Bottom_Secondary2_Graph_Pad() -> RowBluePrint {
        let nodes = [
            getExitGraphExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
            getResetZoomSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getResetZoomTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_Graph)
    }
    
    func getRowBluePrint_Bottom_Secondary2_View_Pad() -> RowBluePrint {
        let nodes = [getJigglePowerSliderToolNode(widthCategory: .halfWidthLeft, neighborTypeLeft: nil, neighborTypeRight: .slider),
                     getJiggleSpeedSliderToolNode(widthCategory: .halfWidthRight, neighborTypeLeft: .slider, neighborTypeRight: nil),
                                  
        ]
        return RowBluePrint(nodes: nodes, configuration: .bottom_Secondary2_View)
    }
}
