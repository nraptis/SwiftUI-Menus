//
//  ToolInterfaceViewModel+Recipes+PadPortrait+Bottom+Primary.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Top_Primary(_ configuration: any InterfaceConfigurationConforming) -> RowRecipe {
        switch configuration.documentMode {
        case .edit:
            if configuration.isGuidesEnabled {
                if configuration.isGraphEnabled {
                    if configuration.graphPage == 3 {
                        // animation graph page 3 [GraphPage3]
                        return getRowRecipe_Pad_Portrait_GraphPage3_Top_Primary()
                    } else if configuration.graphPage == 2 {
                        // animation graph page 2 [GraphPage2]
                        return getRowRecipe_Pad_Portrait_GraphPage2_Top_Primary()
                    } else {
                        // animation graph page 1 [GraphPage1]
                        return getRowRecipe_Pad_Portrait_GraphPage1_Top_Primary()
                    }
                } else {
                    switch configuration.weightMode {
                    case .guides:
                        // guides affine [GuidesAffine]
                        return getRowRecipe_Pad_Portrait_GuidesAffine_Top_Primary()
                    case .points:
                        // guides points [GuidesPoints]
                        return getRowRecipe_Pad_Portrait_GuidesPoints_Top_Primary()
                    }
                }
            } else {
                switch configuration.editMode {
                case .jiggles:
                    // edit jiggles [EditJiggles]
                    return getRowRecipe_Pad_Portrait_EditJiggles_Top_Primary()
                case .points:
                    // edit points [EditPoints]
                    return getRowRecipe_Pad_Portrait_EditPoints_Top_Primary()
                }
            }
        case .view:
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    if configuration.animationTimeLinePage == 3 {
                        // animation loops page 3 [TimeLinePage3]
                        return getRowRecipe_Pad_Portrait_TimeLinePage3_Top_Primary()
                    } else if configuration.animationTimeLinePage == 2 {
                        // animation loops page 2 [TimeLinePage2]
                        return getRowRecipe_Pad_Portrait_TimeLinePage2_Top_Primary()
                    } else {
                        // animation loops page 1 [TimeLinePage1]
                        return getRowRecipe_Pad_Portrait_TimeLinePage1_Top_Primary()
                    }
                    
                } else {
                    if configuration.animationLoopsPage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_LoopsPage3_Top_Primary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_LoopsPage2_Top_Primary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_LoopsPage1_Top_Primary()
                    }
                }
            } else {
                if configuration.isAnimationContinuousEnabled {
                    if configuration.animationContinuousPage == 3 {
                        // animation loops page 3 [AnimationContinuousPage3]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Primary()
                    } else if configuration.animationContinuousPage == 2 {
                        // animation loops page 2 [AnimationContinuousPage2]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Primary()
                    } else {
                        // animation loops page 1 [AnimationContinuousPage1]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Primary()
                    }
                } else {
                    // animation grab page 1 [AnimationGrab]
                    return getRowRecipe_Pad_Portrait_AnimationGrab_Top_Primary()
                }
            }
        }
    }
    
    @MainActor func getRowRecipe_Pad_Top_Secondary(_ configuration: any InterfaceConfigurationConforming) -> RowRecipe {
        switch configuration.documentMode {
        case .edit:
            if configuration.isGuidesEnabled {
                if configuration.isGraphEnabled {
                    if configuration.graphPage == 3 {
                        // animation graph page 3 [GraphPage3]
                        return getRowRecipe_Pad_Portrait_GraphPage3_Top_Secondary()
                    } else if configuration.graphPage == 2 {
                        // animation graph page 2 [GraphPage2]
                        return getRowRecipe_Pad_Portrait_GraphPage2_Top_Secondary()
                    } else {
                        // animation graph page 1 [GraphPage1]
                        return getRowRecipe_Pad_Portrait_GraphPage1_Top_Secondary()
                    }
                } else {
                    switch configuration.weightMode {
                    case .guides:
                        // guides affine [GuidesAffine]
                        return getRowRecipe_Pad_Portrait_GuidesAffine_Top_Secondary()
                    case .points:
                        // guides points [GuidesPoints]
                        return getRowRecipe_Pad_Portrait_GuidesPoints_Top_Secondary()
                    }
                }
            } else {
                switch configuration.editMode {
                case .jiggles:
                    // edit jiggles [EditJiggles]
                    return getRowRecipe_Pad_Portrait_EditJiggles_Top_Secondary()
                case .points:
                    // edit points [EditPoints]
                    return getRowRecipe_Pad_Portrait_EditPoints_Top_Secondary()
                }
            }
        case .view:
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    if configuration.animationTimeLinePage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_TimeLinePage3_Top_Secondary()
                    } else if configuration.animationTimeLinePage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_TimeLinePage2_Top_Secondary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_TimeLinePage1_Top_Secondary()
                    }
                } else {
                    if configuration.animationLoopsPage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_LoopsPage3_Top_Secondary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_LoopsPage2_Top_Secondary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_LoopsPage1_Top_Secondary()
                    }
                }
            } else {
                if configuration.isAnimationContinuousEnabled {
                    if configuration.animationContinuousPage == 3 {
                        // animation loops page 3 [AnimationContinuousPage3]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Secondary()
                    } else if configuration.animationContinuousPage == 2 {
                        // animation loops page 2 [AnimationContinuousPage2]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Secondary()
                    } else {
                        // animation loops page 1 [AnimationContinuousPage1]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Secondary()
                    }
                } else {
                    // animation grab page 1 [AnimationGrab]
                    return getRowRecipe_Pad_Portrait_AnimationGrab_Top_Secondary()
                }
            }
        }
    }
    
    @MainActor func getRowRecipe_Pad_Top_Tertiary(_ configuration: any InterfaceConfigurationConforming) -> RowRecipe {
        switch configuration.documentMode {
        case .edit:
            if configuration.isGuidesEnabled {
                if configuration.isGraphEnabled {
                    if configuration.graphPage == 3 {
                        // animation graph page 3 [GraphPage3]
                        return getRowRecipe_Pad_Portrait_GraphPage3_Top_Tertiary()
                    } else if configuration.graphPage == 2 {
                        // animation graph page 2 [GraphPage2]
                        return getRowRecipe_Pad_Portrait_GraphPage2_Top_Tertiary()
                    } else {
                        // animation graph page 1 [GraphPage1]
                        return getRowRecipe_Pad_Portrait_GraphPage1_Top_Tertiary()
                    }
                } else {
                    switch configuration.weightMode {
                    case .guides:
                        // guides affine [GuidesAffine]
                        return getRowRecipe_Pad_Portrait_GuidesAffine_Top_Tertiary()
                    case .points:
                        // guides points [GuidesPoints]
                        return getRowRecipe_Pad_Portrait_GuidesPoints_Top_Tertiary()
                    }
                }
            } else {
                switch configuration.editMode {
                case .jiggles:
                    // edit jiggles [EditJiggles]
                    return getRowRecipe_Pad_Portrait_EditJiggles_Top_Tertiary()
                case .points:
                    // edit points [EditPoints]
                    return getRowRecipe_Pad_Portrait_EditPoints_Top_Tertiary()
                }
            }
        case .view:
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    if configuration.animationTimeLinePage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_TimeLinePage3_Top_Tertiary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_TimeLinePage2_Top_Tertiary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_TimeLinePage1_Top_Tertiary()
                    }
                } else {
                    if configuration.animationLoopsPage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_LoopsPage3_Top_Tertiary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_LoopsPage2_Top_Tertiary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_LoopsPage1_Top_Tertiary()
                    }
                }
            } else {
                if configuration.isAnimationContinuousEnabled {
                    
                    if configuration.animationContinuousPage == 3 {
                        // animation loops page 3 [AnimationContinuousPage3]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Tertiary()
                    } else if configuration.animationContinuousPage == 2 {
                        // animation loops page 2 [AnimationContinuousPage2]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Tertiary()
                    } else {
                        // animation loops page 1 [AnimationContinuousPage1]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Tertiary()
                    }
                    
                } else {
                    // animation grab page 1 [AnimationGrab]
                    return getRowRecipe_Pad_Portrait_AnimationGrab_Top_Tertiary()
                }
            }
        }
    }
    
    @MainActor func getRowRecipe_Pad_Bottom_Tertiary(_ configuration: any InterfaceConfigurationConforming) -> RowRecipe {
        switch configuration.documentMode {
        case .edit:
            if configuration.isGuidesEnabled {
                if configuration.isGraphEnabled {
                    if configuration.graphPage == 3 {
                        // animation graph page 3 [GraphPage3]
                        return getRowRecipe_Pad_Portrait_GraphPage3_Bottom_Tertiary()
                    } else if configuration.graphPage == 2 {
                        // animation graph page 2 [GraphPage2]
                        return getRowRecipe_Pad_Portrait_GraphPage2_Bottom_Tertiary()
                    } else {
                        // animation graph page 1 [GraphPage1]
                        return getRowRecipe_Pad_Portrait_GraphPage1_Bottom_Tertiary()
                    }
                } else {
                    switch configuration.weightMode {
                    case .guides:
                        // guides affine [GuidesAffine]
                        return getRowRecipe_Pad_Portrait_GuidesAffine_Bottom_Tertiary()
                    case .points:
                        // guides points [GuidesPoints]
                        return getRowRecipe_Pad_Portrait_GuidesPoints_Bottom_Tertiary()
                    }
                }
            } else {
                switch configuration.editMode {
                case .jiggles:
                    // edit jiggles [EditJiggles]
                    return getRowRecipe_Pad_Portrait_EditJiggles_Bottom_Tertiary()
                case .points:
                    // edit points [EditPoints]
                    return getRowRecipe_Pad_Portrait_EditPoints_Bottom_Tertiary()
                }
            }
        case .view:
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    
                    if configuration.animationTimeLinePage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_TimeLinePage3_Bottom_Tertiary()
                    } else if configuration.animationTimeLinePage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Tertiary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_TimeLinePage1_Bottom_Tertiary()
                    }
                } else {
                    if configuration.animationLoopsPage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_LoopsPage3_Bottom_Tertiary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_LoopsPage2_Bottom_Tertiary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_LoopsPage1_Bottom_Tertiary()
                    }
                }
            } else {
                if configuration.isAnimationContinuousEnabled {
                    if configuration.animationContinuousPage == 3 {
                        // animation loops page 3 [AnimationContinuousPage3]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Tertiary()
                    } else if configuration.animationContinuousPage == 2 {
                        // animation loops page 2 [AnimationContinuousPage2]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Tertiary()
                    } else {
                        // animation loops page 1 [AnimationContinuousPage1]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Tertiary()
                    }
                } else {
                    // animation grab page 1 [AnimationGrab]
                    return getRowRecipe_Pad_Portrait_AnimationGrab_Bottom_Tertiary()
                }
            }
        }
    }
    
    @MainActor func getRowRecipe_Pad_Bottom_Secondary(_ configuration: any InterfaceConfigurationConforming) -> RowRecipe {
        switch configuration.documentMode {
        case .edit:
            if configuration.isGuidesEnabled {
                if configuration.isGraphEnabled {
                    if configuration.graphPage == 3 {
                        // animation graph page 3 [GraphPage3]
                        return getRowRecipe_Pad_Portrait_GraphPage3_Bottom_Secondary()
                    } else if configuration.graphPage == 2 {
                        // animation graph page 2 [GraphPage2]
                        return getRowRecipe_Pad_Portrait_GraphPage2_Bottom_Secondary()
                    } else {
                        // animation graph page 1 [GraphPage1]
                        return getRowRecipe_Pad_Portrait_GraphPage1_Bottom_Secondary()
                    }
                } else {
                    switch configuration.weightMode {
                    case .guides:
                        // guides affine [GuidesAffine]
                        return getRowRecipe_Pad_Portrait_GuidesAffine_Bottom_Secondary()
                    case .points:
                        // guides points [GuidesPoints]
                        return getRowRecipe_Pad_Portrait_GuidesPoints_Bottom_Secondary()
                    }
                }
            } else {
                switch configuration.editMode {
                case .jiggles:
                    // edit jiggles [EditJiggles]
                    return getRowRecipe_Pad_Portrait_EditJiggles_Bottom_Secondary()
                case .points:
                    // edit points [EditPoints]
                    return getRowRecipe_Pad_Portrait_EditPoints_Bottom_Secondary()
                }
            }
        case .view:
            
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    
                    if configuration.animationTimeLinePage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_TimeLinePage3_Bottom_Secondary()
                    } else if configuration.animationTimeLinePage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Secondary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_TimeLinePage1_Bottom_Secondary()
                    }
                } else {
                    if configuration.animationLoopsPage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_LoopsPage3_Bottom_Secondary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_LoopsPage2_Bottom_Secondary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_LoopsPage1_Bottom_Secondary()
                    }
                }
            } else {
                if configuration.isAnimationContinuousEnabled {
                    if configuration.animationContinuousPage == 3 {
                        // animation loops page 3 [AnimationContinuousPage3]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Secondary()
                    } else if configuration.animationContinuousPage == 2 {
                        // animation loops page 2 [AnimationContinuousPage2]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Secondary()
                    } else {
                        // animation loops page 1 [AnimationContinuousPage1]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Secondary()
                    }
                } else {
                    // animation grab page 1 [AnimationGrab]
                    return getRowRecipe_Pad_Portrait_AnimationGrab_Bottom_Secondary()
                }
            }
        }
    }
    
    @MainActor func getRowRecipe_Pad_Bottom_Primary(_ configuration: any InterfaceConfigurationConforming) -> RowRecipe {
        switch configuration.documentMode {
        case .edit:
            if configuration.isGuidesEnabled {
                if configuration.isGraphEnabled {
                    if configuration.graphPage == 3 {
                        // animation graph page 3 [GraphPage3]
                        return getRowRecipe_Pad_Portrait_GraphPage3_Bottom_Primary()
                    } else if configuration.graphPage == 2 {
                        // animation graph page 2 [GraphPage2]
                        return getRowRecipe_Pad_Portrait_GraphPage2_Bottom_Primary()
                    } else {
                        // animation graph page 1 [GraphPage1]
                        return getRowRecipe_Pad_Portrait_GraphPage1_Bottom_Primary()
                    }
                } else {
                    switch configuration.weightMode {
                    case .guides:
                        // guides affine [GuidesAffine]
                        return getRowRecipe_Pad_Portrait_GuidesAffine_Bottom_Primary()
                    case .points:
                        // guides points [GuidesPoints]
                        return getRowRecipe_Pad_Portrait_GuidesPoints_Bottom_Primary()
                    }
                }
            } else {
                switch configuration.editMode {
                case .jiggles:
                    // edit jiggles [EditJiggles]
                    return getRowRecipe_Pad_Portrait_EditJiggles_Bottom_Primary()
                case .points:
                    // edit points [EditPoints]
                    return getRowRecipe_Pad_Portrait_EditPoints_Bottom_Primary()
                }
            }
        case .view:
            if configuration.isAnimationLoopsEnabled {
                if configuration.isTimeLineEnabled {
                    if configuration.animationTimeLinePage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_TimeLinePage3_Bottom_Primary()
                    } else if configuration.animationTimeLinePage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Primary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_TimeLinePage1_Bottom_Primary()
                    }
                } else {
                    if configuration.animationLoopsPage == 3 {
                        // animation loops page 3 [LoopsPage3]
                        return getRowRecipe_Pad_Portrait_LoopsPage3_Bottom_Primary()
                    } else if configuration.animationLoopsPage == 2 {
                        // animation loops page 2 [LoopsPage2]
                        return getRowRecipe_Pad_Portrait_LoopsPage2_Bottom_Primary()
                    } else {
                        // animation loops page 1 [LoopsPage1]
                        return getRowRecipe_Pad_Portrait_LoopsPage1_Bottom_Primary()
                    }
                }
            } else {
                if configuration.isAnimationContinuousEnabled {
                    if configuration.animationContinuousPage == 3 {
                        // animation loops page 3 [AnimationContinuousPage3]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Primary()
                    } else if configuration.animationContinuousPage == 2 {
                        // animation loops page 2 [AnimationContinuousPage2]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Primary()
                    } else {
                        // animation loops page 1 [AnimationContinuousPage1]
                        return getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Primary()
                    }
                } else {
                    // animation grab page 1 [AnimationGrab]
                    return getRowRecipe_Pad_Portrait_AnimationGrab_Bottom_Primary()
                }
            }
        }
    }
    
    @MainActor func getRowRecipe_Pad_Zoom_Top_Primary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_Zoom_Top_Primary()
    }
    
    @MainActor func getRowRecipe_Pad_Zoom_Top_Secondary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_Zoom_Top_Secondary()
    }
    
    @MainActor func getRowRecipe_Pad_Zoom_Top_Tertiary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_Zoom_Top_Tertiary()
    }
    
    @MainActor func getRowRecipe_Pad_Zoom_Bottom_Tertiary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_Zoom_Bottom_Tertiary()
    }
    
    @MainActor func getRowRecipe_Pad_Zoom_Bottom_Secondary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_Zoom_Bottom_Secondary()
    }
    
    @MainActor func getRowRecipe_Pad_Zoom_Bottom_Primary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_Zoom_Bottom_Primary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoRecord_Top_Primary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoRecord_Top_Primary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoRecord_Top_Secondary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoRecord_Top_Secondary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoRecord_Top_Tertiary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoRecord_Top_Tertiary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoRecord_Bottom_Tertiary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoRecord_Bottom_Tertiary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoRecord_Bottom_Secondary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoRecord_Bottom_Secondary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoRecord_Bottom_Primary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoRecord_Bottom_Primary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoExport_Top_Primary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoExport_Top_Primary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoExport_Top_Secondary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoExport_Top_Secondary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoExport_Top_Tertiary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoExport_Top_Tertiary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoExport_Bottom_Tertiary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoExport_Bottom_Tertiary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoExport_Bottom_Secondary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoExport_Bottom_Secondary()
    }
    
    @MainActor func getRowRecipe_Pad_VideoExport_Bottom_Primary() -> RowRecipe {
        return getRowRecipe_Pad_Portrait_VideoExport_Bottom_Primary()
    }
    
}
