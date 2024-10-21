//
//  ToolInterfaceViewModel+NodeGeneration+CreateSwatches.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_CreateSwatch(_ inr: INR_CreateSwatch,
                             neighborTypeLeft: ToolInterfaceElementType?,
                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .jiggleAffine:
            return ToolInterfaceFactory.getMakeAndDrawJiggleCreateSwatchToolNode(orientation: orientation,
                                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                                 neighborTypeRight: neighborTypeRight)
        case .jigglePoints:
            return ToolInterfaceFactory.getAddAndRemoveJigglePointsCreateSwatchToolNode(orientation: orientation,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        case .guideAffine:
            return ToolInterfaceFactory.getMakeAndDrawGuideCreateSwatchToolNode(orientation: orientation,
                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                neighborTypeRight: neighborTypeRight)
        case .guidePoints:
            return ToolInterfaceFactory.getAddAndRemoveGuidePointsCreateSwatchToolNode(orientation: orientation,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        }
    }
    
}
