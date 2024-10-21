//
//  ToolInterfaceViewModel+NodeGeneration+MainTabs.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_MainTab(_ inr: INR_MainTab,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .documentMode:
            return ToolInterfaceFactory.getDocumentModeMainTabToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .skainTabTest:
            return ToolInterfaceFactory.getSkainTabTestMainTabToolNode(orientation: orientation,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .jainTabTest:
            return ToolInterfaceFactory.getJainTabTestMainTabToolNode(orientation: orientation,
                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                      neighborTypeRight: neighborTypeRight)
            
        }
        
    }
    
}
