//
//  ToolInterfaceViewModel+Recipes+Pad+AnimationContinuousPage1.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.stereoscopic),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.continuousPage1),
            .slider(.init(widthCategory: .stretch, slider: .continuousDuration)),
            .enterMode(.continuousPage2),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
            .exitMode(.animationContinuous),
            .slider(.init(widthCategory: .stretch, slider: .continuousPower)),
            .button(.continuousResetAngleDiag1),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.continuousResetAngleDiag2),
            .slider(.init(widthCategory: .stretch, slider: .continuousAngle)),
            .checkBox(.continuousDisableGrabEnabled),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.continuousSyncFrames),
            .dividerSpacerDivider,
            .button_triplet(.continuousShuffleGroup1, .continuousInvertAngles, .continuousResetGroup1),
            .dividerSpacerDivider,
            .button(.zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .checkBox(.animationContinuousApplyToAll),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
    
}
