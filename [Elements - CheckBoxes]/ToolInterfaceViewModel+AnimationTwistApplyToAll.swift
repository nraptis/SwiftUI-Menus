//
//  ToolInterfaceViewModel+AnimationTwistApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getAnimationTwistApplyToAllCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationTwistApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationTwistApplyToAllLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAnimationTwistApplyToAll = MagicalCheckBoxViewModelAnimationTwistApplyToAll(orientation: jiggleViewModel.orientation,
                                                                                                 checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxAnimationTwistApplyToAll,
                              flex: flex,
                              magicalViewModel: viewModelAnimationTwistApplyToAll,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelAnimationTwistApplyToAll.refresh()
        
        return result
    }
}
