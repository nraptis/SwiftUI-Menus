//
//  ToolInterfaceViewModel+Recipes+Pad+GraphPage3.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/6/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage3_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage3_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage3_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage3_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.graphPage3),
            .spacer,
            .button_triplet(.swivelPanLeft, .swivelPanRight, .swivelPanReset),
            .spacer,
            .enterMode(.graphPage1)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage3_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.graph),
            .button_pair(.resetWeightGraphLinear, .resetWeightGraphLinearDampened),
            .dividerSpacerDivider,
            .button_pair(.resetWeightGraphInverseDampened, .resetWeightGraphInverse),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage3_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button_pair(.resetWeightGraphLinearDampened, .resetWeightGraphLinear)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
