//
//  ToolInterfaceViewModel+AnimationWobbleApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getAnimationWobbleApplyToAllCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationWobbleApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationWobbleApplyToAllLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAnimationWobbleApplyToAll = MagicalCheckBoxViewModelAnimationWobbleApplyToAll(orientation: jiggleViewModel.orientation,
                                                                                                   checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxAnimationWobbleApplyToAll,
                              flex: flex,
                              magicalViewModel: viewModelAnimationWobbleApplyToAll,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelAnimationWobbleApplyToAll.refresh()
        
        return result
    }
}
