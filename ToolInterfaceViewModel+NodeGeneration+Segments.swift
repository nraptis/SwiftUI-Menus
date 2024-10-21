//
//  ToolInterfaceViewModel+NodeGeneration+Segments.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_Segment(_ inr: INR_Segment,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        switch inr {
        case .editMode:
            return ToolInterfaceFactory.getEditModeSegmentToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        case .weightMode:
            return ToolInterfaceFactory.getWeightModeSegmentToolNode(orientation: orientation,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        case .animationMode:
            return ToolInterfaceFactory.getAnimationModeSegmentToolNode(orientation: orientation,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        }
    }
    
}
