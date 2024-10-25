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
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "A.C. Page 1")),
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.buy)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .spacer,
            .enterMode(.animationContinuousPage2),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.animationContinuous),
            .spacer
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_AnimationContinuousPage1_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .spacer,
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
