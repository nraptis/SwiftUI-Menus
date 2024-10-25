//
//  ToolInterfaceViewModel+Recipes+Pad+VideoRecord.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoRecord_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Video Record")),
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.buy)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoRecord_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoRecord_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoRecord_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoRecord_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoRecord_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.videoRecord),
            .spacer,
            .enterMode(.videoExport)
        ]
        return RowRecipe(inrs: inrs)
    }
}
