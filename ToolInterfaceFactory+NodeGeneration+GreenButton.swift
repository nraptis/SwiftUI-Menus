//
//  ToolInterfaceViewModel+NodeGeneration+GreenButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_GreenButton(orientation: Orientation,
                                         inr: INR_GreenButton,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        switch inr {
        case .createScene:
            return getCreateSceneGreenButtonToolNode(orientation: orientation,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .done:
            return getDoneGreenButtonToolNode(orientation: orientation,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        }
    }
}
