//
//  ToolInterfaceViewModel+NodeGeneration+CheckBoxes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_CheckBox(_ inr: INR_CheckBox,
                                          neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .darkMode:
            return ToolInterfaceFactory.getDarkModeEnabledCheckBoxToolNode(orientation: orientation,
                                                                           neighborTypeLeft: neighborTypeLeft,
                                                                           neighborTypeRight: neighborTypeRight)
        case .buy:
            return ToolInterfaceFactory.getPurchasedEnabledCheckBoxToolNode(orientation: orientation,
                                                                            neighborTypeLeft: neighborTypeLeft,
                                                                            neighborTypeRight: neighborTypeRight)
        case .stereoscopic:
            return ToolInterfaceFactory.getStereoscopicEnabledCheckBoxToolNode(orientation: orientation,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
            
        case .animationGrabApplyToAll:
            return ToolInterfaceFactory.getAnimationGrabApplyToAllCheckBoxToolNode(orientation: orientation,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        case .animationLoopApplyToAll:
            return ToolInterfaceFactory.getAnimationLoopApplyToAllCheckBoxToolNode(orientation: orientation,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
            
        }
    }
}
