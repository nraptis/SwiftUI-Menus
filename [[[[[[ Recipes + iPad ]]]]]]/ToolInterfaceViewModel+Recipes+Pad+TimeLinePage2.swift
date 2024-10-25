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
            .slider(.init(widthCategory: .stretch, slider: .timeLineOffset)),
            .exitMode(.timeLine)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .checkBox(.animationLoopApplyToAll),
            .spacer,
            .button_pair(.timeLineFlipAll, .timeLineBreakPoint),
            .dividerSpacerDivider,
            .button_pair(.timeLineResetCurveCurrentChannel, .timeLineResetFlatCurrentChannel)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage2_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button_pair(.timeLineInvertHorizontal, .timeLineInvertVertical)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
