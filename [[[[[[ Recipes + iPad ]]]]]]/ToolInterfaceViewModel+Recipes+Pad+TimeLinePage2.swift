//
//  ToolInterfaceViewModel+Recipes+Pad+TimeLinePage2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.timeLinePage2),
            .spacer,
            .button_pair(.timeLineInvertHorizontal, .timeLineInvertVertical),
            .dividerSpacerDivider,
            .button(.timeLineFlipAll),
            .spacer,
            .enterMode(.timeLinePage3)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.timeLine),
            .slider(.init(widthCategory: .stretch, slider: .timeLineFrameOffset)),
            .button_pair(.timeLineDampen, .timeLineAmplify)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button(.timeLineSyncFrames)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
