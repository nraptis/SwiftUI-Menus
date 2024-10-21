//
//  ToolInterfaceViewModel+NodeGeneration+DividersAndSpacers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_DividerTiny(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        ToolInterfaceFactory.getDividerTinyToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
    }
    
    @MainActor func generateNode_DividerHuge(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        ToolInterfaceFactory.getDividerHugeToolNode(orientation: orientation,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
    }
    
    @MainActor func generateNode_DividerSpacerDivider(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        ToolInterfaceFactory.getDividerSpacerDividerToolNode(orientation: orientation,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
    }
    
    @MainActor func generateNode_Spacer(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        ToolInterfaceFactory.getSpacerToolNode(orientation: orientation,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
    }
}
