//
//  ToolInterfaceViewModel+NodeGeneration+FavoringOneLineLabel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_FavoringOneLineLabel(_ inr: INR_FavoringOneLineLabel.FavoringOneLineLabel_Data,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        Self.getFavoringOneLineLabelToolNode(orientation: orientation,
                                             minimumWidth: inr.minimumWidth,
                                             text: inr.text,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
    }
}
