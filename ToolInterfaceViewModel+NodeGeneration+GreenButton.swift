//
//  ToolInterfaceViewModel+NodeGeneration+GreenButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_GreenButton(_ inr: INR_GreenButton,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        switch inr {
        case .createScene:
            return getCreateSceneGreenButtonToolNode(neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        case .done:
            return getDoneGreenButtonToolNode(neighborTypeLeft: neighborTypeLeft, neighborTypeRight: neighborTypeRight)
        }
    }
}
