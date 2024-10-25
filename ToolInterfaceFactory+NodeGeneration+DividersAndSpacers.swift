//
//  ToolInterfaceViewModel+NodeGeneration+DividersAndSpacers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_DividerTiny(orientation: Orientation,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        getDividerTinyToolNode(orientation: orientation,
                               neighborTypeLeft: neighborTypeLeft,
                               neighborTypeRight: neighborTypeRight)
    }
    
    static func generateNode_DividerHuge(orientation: Orientation,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        getDividerHugeToolNode(orientation: orientation,
                               neighborTypeLeft: neighborTypeLeft,
                               neighborTypeRight: neighborTypeRight)
    }
    
    static func generateNode_DividerSpacerDivider(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        getDividerSpacerDividerToolNode(orientation: orientation,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
    }
    
    static func generateNode_Spacer(orientation: Orientation,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        getSpacerToolNode(orientation: orientation,
                          neighborTypeLeft: neighborTypeLeft,
                          neighborTypeRight: neighborTypeRight)
    }
}
