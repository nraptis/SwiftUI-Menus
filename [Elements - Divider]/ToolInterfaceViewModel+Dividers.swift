//
//  ToolInterfaceViewModel+Dividers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getDividerTinyFlex(orientation: Orientation) -> ToolInterfaceElementFlex {
        ToolInterfaceElementFlex.fixed(DividerLayout.getPillWidthTiny(orientation: orientation))
    }
    
    static func getDividerHugeFlex(orientation: Orientation) -> ToolInterfaceElementFlex {
        ToolInterfaceElementFlex.fixed(DividerLayout.getPillWidthHuge(orientation: orientation))
    }
    
    @MainActor static func getDividerTinyToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            return getDividerTinyToolNode(neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight,
                                          orientation: jiggleDocument.orientation)
        } else if let rootViewModel = ApplicationController.rootViewModel {
            return getDividerTinyToolNode(neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight,
                                          orientation: rootViewModel.orientation)
        } else {
            return getDividerTinyToolNode(neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight,
                                          orientation: .portrait)
        }
    }
    
    @MainActor static func getDividerTinyToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?,
                                       orientation: Orientation) -> ToolNode {
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
    
    @MainActor static func getDividerHugeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        if let jiggleDocument = ApplicationController.shared.jiggleDocument {
            return getDividerHugeToolNode(neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight,
                                          orientation: jiggleDocument.orientation)
        } else if let rootViewModel = ApplicationController.rootViewModel {
            return getDividerHugeToolNode(neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight,
                                          orientation: rootViewModel.orientation)
        } else {
            return getDividerHugeToolNode(neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight,
                                          orientation: .portrait)
        }
    }
    
    @MainActor static func getDividerHugeToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                       neighborTypeRight: ToolInterfaceElementType?,
                                       orientation: Orientation) -> ToolNode {
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
