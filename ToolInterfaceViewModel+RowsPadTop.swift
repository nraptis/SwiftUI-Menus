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
    
    @MainActor func getRowBluePrint_Top_Primary_Standard_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .stretch, slider: .jiggleOpacity))
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_Standard, centerPinnedElement: nil)
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
        let nodes = generateNodes([
            .button_pair(.flipJiggleHorizontal, .flipJiggleVertical),
            .dividerSpacerDivider,
            .button_pair(.rotateJiggleLeft, .rotateJiggleRight),
            
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Points_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button_pair(.flipJiggleHorizontal, .flipJiggleVertical),
            .dividerSpacerDivider,
            .button_pair(.rotateJiggleLeft, .rotateJiggleRight),
            
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Points)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Jiggles_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_triplet(.selectPreviousJiggle, .selectNextJiggle, .rotateJiggleLeft),
            .dividerSpacerDivider,
            .button_pair(.freezeJiggle, .unfreezeJiggles)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Jiggles)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_Grab_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .slider(.init(widthCategory: .stretch, slider: .jiggleDampen)),
            .checkBox(.animationGrabApplyToAll)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_Continuous_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .slider(.init(widthCategory: .stretch, slider: .jiggleDampen)),
            .checkBox(.animationGrabApplyToAll)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_LoopsPage1_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .slider(.init(widthCategory: .stretch, slider: .jiggleDampen)),
            .enterMode(.loopsPage2)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_LoopsPage2_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .slider(.init(widthCategory: .stretch, slider: .jiggleDampen)),
            .enterMode(.loopsPage3)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_View_LoopsPage3_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .slider(.init(widthCategory: .stretch, slider: .jiggleDampen)),
            .enterMode(.loopsPage1)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Points_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.selectPreviousJigglePoint, .selectNextJigglePoint),
            .dividerSpacerDivider,
            .button_pair(.unfreezeJiggles, .freezeJiggle),
            
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Points)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_Grab_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .slider(.init(widthCategory: .halfWidthLeft, slider: .jiggleSpeed)),
            .slider(.init(widthCategory: .halfWidthRight, slider: .jigglePower))
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_Continuous_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .slider(.init(widthCategory: .halfWidthLeft, slider: .jigglePower)),
            .slider(.init(widthCategory: .halfWidthRight, slider: .jiggleSpeed))
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_LoopsPage1_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .greenButton(.createScene),
            .spacer,
            .checkBox(.buy),
            .checkBox(.darkMode),
            .checkBox(.stereoscopic),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_LoopsPage2_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.loopsPage2),
            .spacer,
            .checkBox(.buy),
            .checkBox(.darkMode),
            .checkBox(.stereoscopic),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .exitMode(.loopsPage3),
            .spacer,
            .checkBox(.buy),
            .checkBox(.darkMode),
            .checkBox(.stereoscopic),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_Grab_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .checkBox(.buy),
            .spacer,
            .enterMode(.animationLoops),
            .enterMode(.animationContinuous)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_Grab)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_Continuous_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .checkBox(.buy),
            .spacer,
            .enterMode(.animationLoops),
            .enterMode(.animationContinuous)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_Continuous)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_LoopsPage1_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .checkBox(.buy),
            .spacer,
            .enterMode(.animationContinuous),
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Loops Page 1")),
            .enterMode(.animationLoops)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_LoopsPage1)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_LoopsPage2_Pad() -> RowBluePrint {
        
        let nodes = generateNodes([
            .button(.menu),
            .checkBox(.buy),
            .spacer,
            .enterMode(.animationContinuous),
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Loops Page 2")),
            .enterMode(.animationLoops)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_LoopsPage2)
    }
    
    @MainActor func getRowBluePrint_Top_Primary_View_LoopsPage3_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button(.menu),
            .checkBox(.buy),
            .spacer,
            .enterMode(.animationContinuous),
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Loops Page 3")),
            .enterMode(.animationLoops)
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Primary_View_LoopsPage3)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.selectPreviousGuide, .selectNextGuide),
            .dividerSpacerDivider,
            .button_pair(.rotateGuideLeft, .rotateGuideRight),
            .dividerSpacerDivider,
            .button_triplet(.unfreezeJiggles, .unfreezeGuides, .freezeGuide),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary1_Guides_Points_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.flipGuideHorizontal, .flipGuideVertical),
            .dividerSpacerDivider,
            .button_pair(.rotateGuideLeft, .rotateGuideRight),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary1_Guides_Points)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Guides_Affine_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.selectPreviousGuide, .selectNextGuide),
            .dividerSpacerDivider,
            .button(.generateTopography),
            .dividerSpacerDivider,
            .button_triplet(.unfreezeJiggles, .unfreezeGuides, .freezeGuide),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Guides_Affine)
    }
    
    @MainActor func getRowBluePrint_Top_Secondary2_Guides_Points_Pad() -> RowBluePrint {
        let nodes = generateNodes([
            .button_pair(.selectPreviousGuidePoint, .selectNextGuidePoint),
            .dividerSpacerDivider,
            .button_pair(.rotateGuideLeft, .rotateGuideRight),
            .dividerSpacerDivider,
            .button_triplet(.unfreezeJiggles, .unfreezeGuides, .freezeGuide),
        ])
        return RowBluePrint(nodes: nodes, configuration: .top_Secondary2_Guides_Points)
    }
    
}
