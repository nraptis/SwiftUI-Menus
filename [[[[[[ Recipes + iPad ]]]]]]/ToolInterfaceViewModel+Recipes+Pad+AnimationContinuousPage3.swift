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
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.stereoscopic),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Secondary() -> RowRecipe {
        
        let inrs: [INR] = [
            .exitMode(.continuousPage3),
            .slider(.init(widthCategory: .stretch, slider: .continuousStartRotation)),
            .enterMode(.continuousPage1),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.animationContinuous),
            .slider(.init(widthCategory: .stretch, slider: .continuousEndRotation)),
            .button(.continuousInvertRotation),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.continuousInvertSwoop),
            .slider(.init(widthCategory: .stretch, slider: .continuousSwoop)),
            .checkBox(.continuousDisableGrabEnabled),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.continuousSyncFrames),
            .dividerSpacerDivider,
            .button_triplet(.continuousShuffleGroup3, .continuousSwapRotation, .continuousResetGroup3),
            .dividerSpacerDivider,
            .button(.zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage3_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .checkBox(.animationContinuousApplyToAll),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
    
}
