//
//  ToolInterfaceViewModel+SexyAnimationGrabApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAnimationGrabApplyToAllCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationGrabApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationGrabApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationGrabApplyToAll = MagicalCheckBoxViewModelAnimationGrabApplyToAll(orientation: orientation,
                                                                                                       checkBoxConfiguration: configuration)
        let animationJiggleApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .checkBoxAnimationGrabApplyToAll,
                                                         flex: flex,
                                                         magicalViewModel: viewModelAnimationGrabApplyToAll,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelAnimationGrabApplyToAll.refresh()
        return animationJiggleApplyToAllToolNode
    }
}
