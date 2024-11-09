//
//  ToolInterfaceViewModel+Recipes+Pad+AnimationContinuousPage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.stereoscopic),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Secondary() -> RowRecipe {
        
        let inrs: [INR] = [
            .exitMode(.continuousPage2),
            .slider(.init(widthCategory: .stretch, slider: .continuousStartScale)),
            .enterMode(.continuousPage3),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.animationContinuous),
            .slider(.init(widthCategory: .stretch, slider: .continuousEndScale)),
            .button(.continuousSyncFrames),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.continuousResetStartRotation),
            .slider(.init(widthCategory: .stretch, slider: .continuousEndRotation)),
            .checkBox(.continuousDisableGrabEnabled),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.continuousSyncFrames),
            .dividerSpacerDivider,
            .button_triplet(.continuousResetFrameOffset, .continuousShuffleGroup2, .continuousResetGroup2),
            .dividerSpacerDivider,
            .button(.zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .checkBox(.animationContinuousApplyToAll),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
    
}
