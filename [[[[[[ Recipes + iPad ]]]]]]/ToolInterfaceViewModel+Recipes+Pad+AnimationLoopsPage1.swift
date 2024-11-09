//
//  ToolInterfaceViewModel+Recipes+Pad+LoopsPage1.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_LoopsPage1_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.stereoscopic),
            .enterMode(.videoRecord),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_LoopsPage1_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.loopsPage1),
            .spacer,
            .enterMode(.loopsPage2)
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_LoopsPage1_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_LoopsPage1_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.animationLoops),
            .spacer,
            .enterMode(.timeLine)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_LoopsPage1_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button(.timeLineSyncFrames),
            .slider(.init(widthCategory: .stretch, slider: .timeLineDuration)),
            .button(.zoomReset),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_LoopsPage1_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .checkBox(.animationLoopApplyToAll),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
