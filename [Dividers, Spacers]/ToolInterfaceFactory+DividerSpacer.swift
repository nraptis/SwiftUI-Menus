//
//  ToolInterfaceFactory+Divider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/21/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getSpacerToolNode(orientation: Orientation,
                                  neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        ToolNode(id: getToolNodeID(),
                 element: .spacer,
                 flex: .spacer(.init(defaultWidth: 0)),
                 magicalViewModel: MagicalViewModel(orientation: orientation),
                 neighborTypeLeft: neighborTypeLeft,
                 neighborTypeRight: neighborTypeRight)
    }
    
    static func getDividerSpacerDividerToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let flex = Self.getDividerSpacerDividerFlex(orientation: orientation)
        let magicalViewModel = MagicalViewModel(orientation: orientation)
        let result = ToolNode(id: getToolNodeID(),
                              element: .dividerSpacerDivider,
                              flex: flex,
                              magicalViewModel: magicalViewModel,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        return result
    }
    
    static func getDividerTinyToolNode(orientation: Orientation,
                                       neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let flex = getDividerTinyFlex(orientation: orientation)
        let viewModelDivider = MagicalViewModel(orientation: orientation)
        let result = ToolNode(id: getToolNodeID(),
                              element: .dividerTiny,
                              flex: flex,
                              magicalViewModel: viewModelDivider,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        return result
    }
    
    static func getDividerHugeToolNode(orientation: Orientation,
                                       neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let flex = getDividerHugeFlex(orientation: orientation)
        let viewModelDivider = MagicalViewModel(orientation: orientation)
        let result = ToolNode(id: getToolNodeID(),
                              element: .dividerHuge,
                              flex: flex,
                              magicalViewModel: viewModelDivider,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        return result
    }
}
