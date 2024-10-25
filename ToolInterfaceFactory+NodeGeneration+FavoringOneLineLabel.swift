//
//  ToolInterfaceViewModel+NodeGeneration+FavoringOneLineLabel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_FavoringOneLineLabel(orientation: Orientation,
                                                  inr: INR_FavoringOneLineLabel_Data,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        getFavoringOneLineLabelToolNode(orientation: orientation,
                                        minimumWidth: inr.minimumWidth,
                                        text: inr.text,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
    }
}
