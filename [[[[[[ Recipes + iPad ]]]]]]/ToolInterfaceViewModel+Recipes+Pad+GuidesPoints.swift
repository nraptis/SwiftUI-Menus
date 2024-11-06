//
//  ToolInterfaceViewModel+Recipes+Pad+GuidesPoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_GuidesPoints_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .favoringOneLineLabel(.init(minimumWidth: 0, text: "[G.P.]")),
            .button(.menu),
            .checkBox(.darkMode),
            .slider(.init(widthCategory: .stretch, slider: .jiggleOpacity)),
            //.checkBox(.buy),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GuidesPoints_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.flipGuideHorizontal, .flipGuideVertical),
            .dividerSpacerDivider,
            .button_pair(.rotateGuideLeft, .rotateGuideRight),
            .dividerSpacerDivider,
            .button_pair(.unfreezeGuides, .freezeGuide),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GuidesPoints_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .createSwatch(.guidePoints),
            .spacer,
            .button(.deleteGuidePoint)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GuidesPoints_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.guides),
            .spacer,
            .button_pair(.selectPreviousGuidePoint, .selectNextGuidePoint),
            .spacer,
            .enterMode(.graph)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GuidesPoints_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .segment(.weightMode),
            .spacer,
            .button_pair(.zoomJiggle, .zoomReset)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_GuidesPoints_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .enterMode(.zoom),
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
