//
//  ToolInterfaceViewModel+Recipes+Pad+EditPoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_EditPoints_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "Points")),
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .stretch, slider: .jiggleOpacity))
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditPoints_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.flipJiggleHorizontal, .flipJiggleVertical),
            .dividerSpacerDivider,
            .button_pair(.rotateJiggleLeft, .rotateJiggleRight),
            .dividerSpacerDivider,
            .button_pair(.unfreezeJiggles, .freezeJiggle),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditPoints_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .createSwatch(.jigglePoints),
            .spacer,
            .button(.deleteJigglePoint),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditPoints_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.selectPreviousJigglePoint, .selectNextJigglePoint),
            .spacer,
            .enterMode(.guides)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditPoints_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .segment(.editMode),
            .spacer,
            .button_pair(.zoomJiggle, .zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_EditPoints_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.zoom),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
