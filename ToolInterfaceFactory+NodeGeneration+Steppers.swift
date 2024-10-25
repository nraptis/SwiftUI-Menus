//
//  ToolInterfaceViewModel+NodeGeneration+Steppers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_Stepper(orientation: Orientation,
                                     inr: INR_Stepper,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .timeLinePointCount:
            return getTimelinePointCountStepperToolNode(orientation: orientation,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        case .coinCount:
            return getCoinCountStepperToolNode(orientation: orientation,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        case .gemCount:
            return getGemCountStepperToolNode(orientation: orientation,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        }
    }
}
