//
//  ToolInterfaceViewModel+Recipes+Pad+VideoExport.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoExport_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Video Export")),
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.buy)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoExport_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoExport_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoExport_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoExport_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_VideoExport_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.videoExport),
            .spacer,
        ]
        return RowRecipe(inrs: inrs)
    }
}
