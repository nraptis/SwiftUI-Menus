//
//  ToolInterfaceViewModel+RowsPadTop.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRowBluePrint_Top_Primary_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        if configuration.isView {
            if configuration.isAnimationLoopsEnabled {
                if configuration.animationLoopsPage == 3 {
                    return getRowBluePrint_Top_Primary_View_LoopsPage3_Pad()
                } else if configuration.animationLoopsPage == 2 {
                    return getRowBluePrint_Top_Primary_View_LoopsPage2_Pad()
                } else {
                    return getRowBluePrint_Top_Primary_View_LoopsPage1_Pad()
                }
            }
            if configuration.isAnimationContinuousEnabled {
                return getRowBluePrint_Top_Primary_View_Continuous_Pad()
            }
            return getRowBluePrint_Top_Primary_View_Grab_Pad()
        }
        
        return getRowBluePrint_Top_Primary_Standard_Pad()
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        if configuration.isView {
                    if configuration.isAnimationLoopsEnabled {
                        if configuration.animationLoopsPage == 3 {
                            return getRowBluePrint_Top_Secondary1_View_LoopsPage3_Pad()
                        } else if configuration.animationLoopsPage == 2 {
                            return getRowBluePrint_Top_Secondary1_View_LoopsPage2_Pad()
                        } else {
                            return getRowBluePrint_Top_Secondary1_View_LoopsPage1_Pad()
                        }
                    }
                    if configuration.isAnimationContinuousEnabled {
                        return getRowBluePrint_Top_Secondary1_View_Continuous_Pad()
                    }
                    return getRowBluePrint_Top_Secondary1_View_Grab_Pad()
                }
        
        if configuration.isPoints { return getRowBluePrint_Top_Secondary1_Points_Pad() }
        
        if configuration.isGuides {
            if configuration.isGuidesAffine {
                return getRowBluePrint_Top_Secondary1_Guides_Affine_Pad()
            } else {
                return getRowBluePrint_Top_Secondary1_Guides_Points_Pad()
            }
        }
        
        return getRowBluePrint_Top_Secondary1_Jiggles_Pad()
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Pad(_ configuration: any InterfaceConfigurationConforming) -> RowBluePrint? {
        
        if configuration.isPoints { return getRowBluePrint_Top_Secondary2_Points_Pad() }
        
        if configuration.isView {
            if configuration.isAnimationLoopsEnabled {
                if configuration.animationLoopsPage == 3 {
                    return getRowBluePrint_Top_Secondary2_View_LoopsPage3_Pad()
                } else if configuration.animationLoopsPage == 2 {
                    return getRowBluePrint_Top_Secondary2_View_LoopsPage2_Pad()
                } else {
                    return getRowBluePrint_Top_Secondary2_View_LoopsPage1_Pad()
                }
            }
            if configuration.isAnimationContinuousEnabled {
                return getRowBluePrint_Top_Secondary2_View_Continuous_Pad()
            }
            return getRowBluePrint_Top_Secondary2_View_Grab_Pad()
        }
        
        if configuration.isGuides {
            if configuration.isGuidesAffine {
                return getRowBluePrint_Top_Secondary2_Guides_Affine_Pad()
            } else {
                return getRowBluePrint_Top_Secondary2_Guides_Points_Pad()
            }
        }
        
        return getRowBluePrint_Top_Secondary2_Jiggles_Pad()
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getFlipJiggleHSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getFlipJiggleVSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getExitZoomExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getExitTimeLineExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getRotateJiggleLeftSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateJiggleRightSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Points_Pad() -> RowBluePrint {
        let nodes = [getFlipJiggleHSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getFlipJiggleVSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     
                     getRotateJiggleLeftSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateJiggleRightSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Points)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getSelectNextJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getExitVideoExportExitModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getUnfreezeAllJigglesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeSelectedJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
                     
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_Grab_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_Continuous_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            
            
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_LoopsPage3)
    }
    
    
    
    @MainActor func getRowBluePrint_Top_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = [
            getSelectPreviousJigglePointSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
            Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getSelectNextJigglePointSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
            Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
            getUnfreezeAllJigglesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
            Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getFreezeSelectedJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Points)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_Grab_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_Continuous_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = [
            getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage1EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
            getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_Standard_Pad() -> RowBluePrint {
        let nodes = [getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleOpacitySliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_Standard, centerPinnedElement: nil)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_Grab_Pad() -> RowBluePrint {
        let nodes = [getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_Continuous_Pad() -> RowBluePrint {
        let nodes = [getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = [getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterLoopsPage2EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = [getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = [getMenuSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getJiggleDampenSliderToolNode(widthCategory: .stretch, neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterLoopsPage3EnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getEnterAnimationContinuousEnterModeToolNode(neighborTypeLeft: nil, neighborTypeRight: nil)
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_LoopsPage3)
    }
    
    
    @MainActor func getRowBluePrint_Top_Secondary1_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [getFlipGuideHSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getFlipGuideVSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getUnfreezeAllJigglesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeSelectedJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRotateGuideLeftSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateGuideRightSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Guides_Points_Pad() -> RowBluePrint {
        let nodes = [getFlipGuideHSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     getFlipGuideVSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRotateGuideLeftSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateGuideRightSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Guides_Points)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousGuideSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getSelectNextGuideSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     
                     
                     
                     
                     getGenerateTopographyTextIconButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getUnfreezeAllJigglesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil), //DELETE
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil), //DELETE
                     getFreezeSelectedJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil), //DELETE
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getUnfreezeAllGuidesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeSelectedGuideSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Guides_Points_Pad() -> RowBluePrint {
        let nodes = [getSelectPreviousGuidePointSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getSelectNextGuidePointSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getUnfreezeAllJigglesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeSelectedJiggleSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getRotateGuideLeftSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getRotateGuideRightSexyButtonToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     
                     Self.getDividerSpacerDividerToolNode(neighborTypeLeft: nil, neighborTypeRight: nil, orientation: orientation),
                     
                     getUnfreezeAllGuidesSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
                     Self.getDividerTinyToolNode(neighborTypeLeft: nil, neighborTypeRight: nil),
                     getFreezeSelectedGuideSexyButtonToolNode(neighborTypeLeft: .textIconButton, neighborTypeRight: nil),
        ]
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Guides_Points)
    }
    
}
