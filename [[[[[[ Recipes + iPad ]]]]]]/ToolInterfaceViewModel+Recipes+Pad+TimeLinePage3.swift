//
//  ToolInterfaceViewModel+Recipes+Pad+TimeLinePage3.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 11/1/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage3_Top_Primary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage3_Top_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage3_Top_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage3_Bottom_Tertiary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.timeLinePage3),
            .spacer,
            .button_pair(.timeLineShiftUp, .timeLineShiftDown),
            .spacer,
            .enterMode(.timeLinePage1),
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage3_Bottom_Secondary() -> RowRecipe {
        let inrs: [INR] = [
            .exitMode(.timeLine),
            .spacer,
            .stepper(.timeLinePointCount),
            .spacer,
            .button_pair(.timeLineDupeCurrentChannel, .timeLineDupeAll)
        ]
        return RowRecipe(inrs: inrs)
    }
    
    @MainActor func getRowRecipe_Pad_Portrait_TimeLinePage3_Bottom_Primary() -> RowRecipe {
        let inrs: [INR] = [
            .button_pair(.undo, .redo),
            .mainTab(.documentMode),
            .button(.timeLineSyncFrames)
        ]
        return RowRecipe(inrs: inrs, centerPinnedElement: .mainTabDocumentMode)
    }
}
