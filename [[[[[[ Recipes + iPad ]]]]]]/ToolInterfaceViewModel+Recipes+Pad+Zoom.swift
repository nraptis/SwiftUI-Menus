//
//  ToolInterfaceViewModel+Recipes+Pad+Zoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_Zoom_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Zoom")),
            .button(.menu),
            .checkBox(.darkMode),
            .spacer,
            .checkBox(.buy)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_Zoom_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_Zoom_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_Zoom_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_Zoom_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.zoomIn, .zoomOut),
            .dividerSpacerDivider,
            .button_pair(.zoomJiggle, .zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_Zoom_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.zoom),
            .slider(.init(widthCategory: .stretch, slider: .zoomAmount))
        ]
        return RowRecipe(inrs: inrs)
    }
}
