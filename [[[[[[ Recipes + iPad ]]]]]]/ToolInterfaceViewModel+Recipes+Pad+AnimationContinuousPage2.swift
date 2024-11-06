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
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[A.C2]")),
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .halfWidthLeft, slider: .continuousFrameOffset)),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .slider(.init(widthCategory: .halfWidthLeft, slider: .continuousStartScale)),
            .slider(.init(widthCategory: .halfWidthRight, slider: .continuousEndScale)),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.continuousResetStartScale, .continuousResetEndScale),
            .spacer,
            .button_pair(.continuousResetAngleDiag1, .continuousResetAngleDiag2),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.continuousPage2),
            
            .slider(.init(widthCategory: .stretch, slider: .continuousEndRotation)),
            .button_pair(.continuousResetStartRotation, .continuousResetStartScale),
            .enterMode(.continuousPage3)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Secondary() -> RowRecipe {
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
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage2_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
