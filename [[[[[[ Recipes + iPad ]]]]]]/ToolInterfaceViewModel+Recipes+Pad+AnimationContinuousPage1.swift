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
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[A.C1]")),
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .halfWidthLeft, slider: .continuousAngle)),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .slider(.init(widthCategory: .halfWidthLeft, slider: .continuousDuration)),
            .slider(.init(widthCategory: .halfWidthRight, slider: .continuousPower)),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.continuousResetAngleVertical, .continuousResetAngleHorizontal),
            .spacer,
            .button_pair(.continuousResetAngleDiag1, .continuousResetAngleDiag2),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
            .exitMode(.continuousPage1),
            .button_pair(.continuousResetSwoop, .continuousSyncFrames),
            .button_pair(.continuousResetAngleHorizontal, .continuousResetAngleVertical),
            
            .enterMode(.continuousPage2),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Secondary() -> RowRecipe {
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
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
