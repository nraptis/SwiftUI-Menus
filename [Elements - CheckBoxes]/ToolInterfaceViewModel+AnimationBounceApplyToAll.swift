//
//  ToolInterfaceViewModel+AnimationBounceApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getAnimationBounceApplyToAllCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationBounceApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationBounceApplyToAllLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAnimationBounceApplyToAll = MagicalCheckBoxViewModelAnimationBounceApplyToAll(orientation: jiggleViewModel.orientation,
                                                                                                   checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxAnimationBounceApplyToAll,
                              flex: flex,
                              magicalViewModel: viewModelAnimationBounceApplyToAll,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelAnimationBounceApplyToAll.refresh()
        
        return result
    }
}
