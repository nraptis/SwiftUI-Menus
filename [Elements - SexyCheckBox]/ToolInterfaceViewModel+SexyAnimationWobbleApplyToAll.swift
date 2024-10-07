//
//  ToolInterfaceViewModel+SexyAnimationWobbleApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAnimationWobbleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationWobbleApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationWobbleApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationWobbleApplyToAll = MagicalSexyCheckBoxViewModelAnimationWobbleApplyToAll(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let animationWobbleApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBoxAnimationWobbleApplyToAll,
                                             flex: flex,
                                             magicalViewModel: viewModelAnimationWobbleApplyToAll,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelAnimationWobbleApplyToAll.refresh()
        return animationWobbleApplyToAllToolNode
    }
}
