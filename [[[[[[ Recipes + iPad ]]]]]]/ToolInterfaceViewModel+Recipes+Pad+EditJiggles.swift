//
//  ToolInterfaceViewModel+Recipes+Pad+EditJiggles.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_EditJiggles_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[J]")),
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .stretch, slider: .jiggleOpacity)),
            //.checkBox(.buy),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditJiggles_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.flipJiggleHorizontal, .flipJiggleVertical),
            .dividerSpacerDivider,
            .button_pair(.rotateJiggleLeft, .rotateJiggleRight),
            .dividerSpacerDivider,
            .button_pair(.unfreezeJiggles, .freezeJiggle),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditJiggles_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .createSwatch(.jiggleAffine),
            .spacer,
            .button_pair(.cloneJiggle, .deleteJiggle),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditJiggles_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.selectPreviousJiggle, .selectNextJiggle),
            .spacer,
            .enterMode(.guides)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditJiggles_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .segment(.editMode),
            .spacer,
            .button_pair(.zoomJiggle, .zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditJiggles_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            
            .enterMode(.zoom),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
