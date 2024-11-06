//
//  ToolInterfaceViewModel+Recipes+Pad+AnimationContinuousPage3.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/1/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[A.C3]")),
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .halfWidthLeft, slider: .continuousSwoop)),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .slider(.init(widthCategory: .halfWidthLeft, slider: .continuousStartRotation)),
            .slider(.init(widthCategory: .halfWidthRight, slider: .continuousEndRotation)),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.continuousResetStartRotation, .continuousResetEndRotation),
            .spacer,
            .button_pair(.continuousResetSwoop, .continuousResetAngleDiag2),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.continuousPage3),
            .slider(.init(widthCategory: .stretch, slider: .continuousEndRotation)),
            .button_pair(.continuousResetStartRotation, .continuousResetStartScale),
            .enterMode(.continuousPage1)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.animationContinuous),
            .checkBox(.animationContinuousApplyToAll),
            .checkBox(.continuousDisableGrabEnabled),
            .spacer,
            .button_pair(.continuousSyncFrames, .zoomReset),
            .button(.zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
