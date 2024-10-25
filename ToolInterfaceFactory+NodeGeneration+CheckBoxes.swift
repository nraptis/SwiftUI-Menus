//
//  ToolInterfaceViewModel+NodeGeneration+CheckBoxes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_CheckBox(orientation: Orientation,
                                      inr: INR_CheckBox,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr {
        case .darkMode:
            return getDarkModeEnabledCheckBoxToolNode(orientation: orientation,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        case .buy:
            return getPurchasedEnabledCheckBoxToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .stereoscopic:
            return getStereoscopicEnabledCheckBoxToolNode(orientation: orientation,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        case .gyroscopeEnabled:
            return getGyroscopeEnabledCheckBoxToolNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .animationGrabApplyToAll:
            return getAnimationGrabApplyToAllCheckBoxToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .animationLoopApplyToAll:
            return getAnimationLoopApplyToAllCheckBoxToolNode(orientation: orientation,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        case .recordAudioEnabled:
            return getRecordAudioEnabledCheckBoxToolNode(orientation: orientation,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        case .imageImportSnapEdges:
            return getImageImportSnapEdgesCheckBoxNode(orientation: orientation,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        case .imageImportSnapRotation:
            return getImageImportSnapRotationCheckBoxNode(orientation: orientation,
                                                          neighborTypeLeft: neighborTypeLeft,
                                                          neighborTypeRight: neighborTypeRight)
        }
    }
}
