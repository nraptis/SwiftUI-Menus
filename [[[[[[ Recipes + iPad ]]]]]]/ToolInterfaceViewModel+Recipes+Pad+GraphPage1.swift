//
//  ToolInterfaceViewModel+Recipes+Pad+GraphPage1.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage1_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage1_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage1_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage1_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.graphPage1),
            
            .spacer,
            .button_triplet(.swivelPanLeft, .swivelPanRight, .swivelPanReset),
            .spacer,
            .enterMode(.graphPage2)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage1_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.graph),
            .button_pair(.resetWeightGraphLinear, .resetWeightGraphLinearDampened),
            .dividerSpacerDivider,
            .dividerSpacerDivider,
            .button_pair(.resetWeightGraphInverseDampened, .resetWeightGraphInverse),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage1_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button_pair(.resetWeightGraphStandardDampened, .resetWeightGraphStandard)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
