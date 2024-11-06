//
//  ToolInterfaceViewModel+Recipes+Pad+GraphPage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage2_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage2_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage2_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage2_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[GR2]")),
            .exitMode(.graphPage2),
            .spacer,
            .button_triplet(.swivelPanLeft, .swivelPanRight, .swivelPanReset),
            .spacer,
            .exitMode(.graph),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage2_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.resetWeightGraphLinear, .resetWeightGraphLinearDampened),
            .dividerSpacerDivider,
            .button_pair(.resetWeightGraphInverseDampened, .resetWeightGraphInverse),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GraphPage2_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button_pair(.resetWeightGraphLinearDampened, .resetWeightGraphLinear)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
