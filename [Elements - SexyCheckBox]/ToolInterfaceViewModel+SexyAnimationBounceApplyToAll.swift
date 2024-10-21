//
//  ToolInterfaceViewModel+SexyAnimationLoopApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAnimationLoopApplyToAllCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationLoopApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationLoopApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationLoopApplyToAll = MagicalCheckBoxViewModelAnimationLoopApplyToAll(orientation: orientation,
                                                                                                       checkBoxConfiguration: configuration)
        let animationBounceApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                         element: .checkBoxAnimationLoopApplyToAll,
                                                         flex: flex,
                                                         magicalViewModel: viewModelAnimationLoopApplyToAll,
                                                         neighborTypeLeft: neighborTypeLeft,
                                                         neighborTypeRight: neighborTypeRight)
        viewModelAnimationLoopApplyToAll.refresh()
        return animationBounceApplyToAllToolNode
    }
}
