//
//  ToolInterfaceViewModel+DividerSpacerDividers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getDividerSpacerDividerFlex(orientation: Orientation) -> ToolInterfaceElementFlex {
        let minimumWidth = DividerLayout.getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: orientation)
        var standardWidth = minimumWidth + (Device.isPad ? 8 : 4)
        let flexDividerSpacerDividerData = FlexDividerSpacerDividerData(minimumWidth: minimumWidth,
                                                                        standardWidth: standardWidth)
        return ToolInterfaceElementFlex.dividerSpacerDivider(flexDividerSpacerDividerData)
    }
    
    static func getDividerSpacerDividerToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?,
                                                orientation: Orientation) -> ToolNode {
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
}
