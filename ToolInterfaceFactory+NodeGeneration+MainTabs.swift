//
//  ToolInterfaceViewModel+NodeGeneration+MainTabs.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_MainTab(orientation: Orientation,
                                     inr: INR_MainTab,
                                     neighborTypeLeft: ToolInterfaceElementType?,
                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .documentMode:
            return getDocumentModeMainTabToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .skainTabTest:
            return getSkainTabTestMainTabToolNode(orientation: orientation,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .jainTabTest:
            return getJainTabTestMainTabToolNode(orientation: orientation,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        }
    }
}
