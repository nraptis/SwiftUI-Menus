//
//  ToolInterfaceViewModel+Recipes+Pad+TimeLinePage1.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage1_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage1_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage1_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [

        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage1_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.timeLinePage1),
            .spacer,
            .button_triplet(.timeLineResetFlat, .timeLineResetCurve, .timeLineResetCurveSmall),
            .spacer,
            .enterMode(.timeLinePage2)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage1_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.timeLine),
            .spacer,
            .button_triplet(.timeLineResetSwan, .timeLineResetDivot, .timeLineResetDivotSmall),
            .spacer,
            .checkBox(.animationLoopApplyToAll),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage1_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button(.timeLineSyncFrames)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
