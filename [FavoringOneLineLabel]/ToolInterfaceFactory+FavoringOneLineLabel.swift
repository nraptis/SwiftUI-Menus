//
//  ToolInterfaceFactory+FavoringOneLineLabel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/21/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getFavoringOneLineLabelToolNode(orientation: Orientation,
                                                minimumWidth: Int,
                                                text: String,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let configuration = ToolInterfaceElementFavoringOneLineLabelConfiguration(orientation: orientation,
                                                                                  text: text)
        let viewModel = MagicalFavoringOneLineLabelViewModel(orientation: orientation,
                                                             favoringOneLineLabelConfiguration: configuration)
        
        let flex = Self.getFavoringOneLineLabelFlex(orientation: orientation,
                                                    configuration: configuration,
                                                    minimumWidth: minimumWidth,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        
        return ToolNode(id: getToolNodeID(),
                        element: .favoringOneLineLabel,
                        flex: flex,
                        magicalViewModel: viewModel,
                        neighborTypeLeft: neighborTypeLeft,
                        neighborTypeRight: neighborTypeRight)
    }
    
}
