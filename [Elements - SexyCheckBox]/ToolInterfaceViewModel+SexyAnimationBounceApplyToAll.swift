//
//  ToolInterfaceViewModel+SexyAnimationBounceApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAnimationBounceApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationBounceApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationBounceApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationBounceApplyToAll = MagicalSexyCheckBoxViewModelAnimationBounceApplyToAll(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let animationBounceApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBoxAnimationBounceApplyToAll,
                                             flex: flex,
                                             magicalViewModel: viewModelAnimationBounceApplyToAll,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelAnimationBounceApplyToAll.refresh()
        return animationBounceApplyToAllToolNode
    }
}
