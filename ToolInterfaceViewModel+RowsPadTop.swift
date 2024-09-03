//
//  ToolInterfaceViewModel+RowsPadTop.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRowBluePrint_Top_Primary_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {

        return getRowBluePrint_Top_Primary_Standard_Pad()
    }
    
    func getRowBluePrint_Top_Secondary1_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        return getRowBluePrint_Top_Secondary1_Jiggles_Pad()
    }
    
    func getRowBluePrint_Top_Secondary2_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        if configuration.isPoints { return getRowBluePrint_Top_Secondary2_Points_Pad() }
        
        return getRowBluePrint_Top_Secondary2_Jiggles_Pad()
    }
    
    func getRowBluePrint_Top_Secondary1_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getFlipVerticalJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getFlipHorizontalJiggleTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getRotateJiggleLeftTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateJiggleRightTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Jiggles)
    }
    
    func getRowBluePrint_Top_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getSelectNextJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeOnSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Jiggles)
    }
    
    func getRowBluePrint_Top_Secondary1_View_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .fullWidth, neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View)
    }
    
    
    
    func getRowBluePrint_Top_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = [
            
            getRedoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getUndoSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
            
            getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getSelectPreviousPointTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getSelectNextPointTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeOnSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
            getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Points)
    }
    
    func getRowBluePrint_Top_Secondary2_View_Pad() -> RowBluePrint {
        let nodes = [
            getSwivelLightDiffuseSliderToolNode(widthCategory: .halfWidthLeft,
                                                neighborTypeLeft: nil,
                                                neighborTypeRight: nil),
            getSwivelLightSpecularSliderToolNode(widthCategory: .halfWidthRight,
                                                 neighborTypeLeft: nil,
                                                 neighborTypeRight: nil)
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View)
    }
    
    func getRowBluePrint_Top_Primary_Standard_Pad() -> RowBluePrint {
        let nodes = [getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getDarkModeEnabledCheckBoxNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleOpacitySliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     getPhoneCollapseTopToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_Standard, centerPinnedElement: nil)
    }
    
    func getRowBluePrint_Top_Primary_View_Pad() -> RowBluePrint {
        let nodes = [getMainMenuTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: .dividerTiny),
                     Self.getDividerTinyToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .textIconButton),
                     getSineEnabledCheckBoxNode(neighborTypeLeft: .dividerTiny, neighborTypeRight: .dividerHuge),
                     Self.getDividerHugeToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .checkBox),
                     getBulgeEnabledCheckBoxNode(neighborTypeLeft: .dividerHuge, neighborTypeRight: .dividerHuge),
                     Self.getDividerHugeToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: .spacer),
                     
                     
                     Self.getSpacerToolNode(neighborTypeLeft: .dividerHuge, neighborTypeRight: .checkBox),
                     getDarkModeEnabledCheckBoxNode(neighborTypeLeft: .spacer, neighborTypeRight: nil),
                     Self.getSpacerToolNode(neighborTypeLeft: .dividerHuge, neighborTypeRight: .checkBox),
                     
                     getPhoneCollapseTopToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View, centerPinnedElement: nil)
    }
    
    func getRowBluePrint_Top_Secondary1_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [getFlipVerticalWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFlipHorizontalWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRotateGuideLeftTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateGuideRightTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Guides_Affine)
    }
    
    func getRowBluePrint_Top_Secondary2_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [getFreezeOffAllWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeOnSelectedWeightRingTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getGenerateTopographyTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getFreezeOffAllJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeOnSelectedJiggleTextIconButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Guides_Affine)
    }
    
    func getRowBluePrint_Top_Secondary1_Guides_Points_Pad() -> RowBluePrint {
        getRowBluePrint_Top_Secondary1_Guides_Affine_Pad()
    }
    
    func getRowBluePrint_Top_Secondary2_Guides_Points_Pad() -> RowBluePrint {
        getRowBluePrint_Top_Secondary2_Guides_Affine_Pad()
    }
    
}
