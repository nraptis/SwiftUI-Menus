//
//  ToolInterfaceViewModel+Recipes+Pad+AnimationGrab.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationGrab_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[V.G]")),
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.stereoscopic)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationGrab_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .slider(.init(widthCategory: .fullWidth, slider: .jiggleDampen))
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationGrab_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .slider(.init(widthCategory: .fullWidth, slider: .jiggleSpeed))
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationGrab_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .checkBox(.animationGrabApplyToAll),
            .spacer,
            .enterMode(.animationContinuous),
            .enterMode(.animationLoops)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationGrab_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .checkBox(.gyroscopeEnabled),
            .slider(.init(widthCategory: .stretch, slider: .jigglePower)),
            .button(.zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationGrab_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
