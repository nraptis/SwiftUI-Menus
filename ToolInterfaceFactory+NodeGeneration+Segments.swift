//
//  ToolInterfaceViewModel+NodeGeneration+Segments.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_Segment(orientation: Orientation,
                                     inr: INR_Segment,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        switch inr {
        case .editMode:
            return getEditModeSegmentToolNode(orientation: orientation,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        case .weightMode:
            return getWeightModeSegmentToolNode(orientation: orientation,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        case .animationMode:
            return getAnimationModeSegmentToolNode(orientation: orientation,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        }
    }
}
