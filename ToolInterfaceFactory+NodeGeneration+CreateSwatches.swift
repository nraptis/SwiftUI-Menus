//
//  ToolInterfaceViewModel+NodeGeneration+CreateSwatches.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_CreateSwatch(orientation: Orientation,
                                          inr: INR_CreateSwatch,
                                          neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .jiggleAffine:
            return getMakeAndDrawJiggleCreateSwatchToolNode(orientation: orientation,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight)
        case .jigglePoints:
            return getAddAndRemoveJigglePointsCreateSwatchToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        case .guideAffine:
            return getMakeAndDrawGuideCreateSwatchToolNode(orientation: orientation,
                                                           neighborTypeLeft: neighborTypeLeft,
                                                           neighborTypeRight: neighborTypeRight)
        case .guidePoints:
            return getAddAndRemoveGuidePointsCreateSwatchToolNode(orientation: orientation,
                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                  neighborTypeRight: neighborTypeRight)
        }
    }
}
