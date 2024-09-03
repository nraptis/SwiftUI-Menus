//
//  ToolInterfaceViewModel+AnimationJiggleApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/15/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getAnimationJiggleApplyToAllCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationJiggleApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationJiggleApplyToAllLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelAnimationJiggleApplyToAll = MagicalCheckBoxViewModelAnimationJiggleApplyToAll(orientation: jiggleViewModel.orientation,
                                                                                                   checkBoxConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxAnimationJiggleApplyToAll,
                              flex: flex,
                              magicalViewModel: viewModelAnimationJiggleApplyToAll,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelAnimationJiggleApplyToAll.refresh()
        
        return result
    }
}
