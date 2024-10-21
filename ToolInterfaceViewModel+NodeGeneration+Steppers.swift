//
//  ToolInterfaceViewModel+NodeGeneration+Steppers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_Stepper(_ inr: INR_Stepper,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .timeLinePointCount:
            return ToolInterfaceFactory.getTimelinePointCountStepperToolNode(orientation: orientation,
                                                                             neighborTypeLeft: neighborTypeLeft,
                                                                             neighborTypeRight: neighborTypeRight)
        case .coinCount:
            return ToolInterfaceFactory.getCoinCountStepperToolNode(orientation: orientation,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        case .gemCount:
            return ToolInterfaceFactory.getGemCountStepperToolNode(orientation: orientation,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        }
    }
}
