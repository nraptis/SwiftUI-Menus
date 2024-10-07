//
//  ToolInterfaceViewModel+SexyAnimationJiggleApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAnimationJiggleApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationJiggleApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationJiggleApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationJiggleApplyToAll = MagicalSexyCheckBoxViewModelAnimationJiggleApplyToAll(orientation: orientation,
                                                                               sexyCheckBoxConfiguration: configuration)
        let animationJiggleApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                             element: .sexyCheckBoxAnimationJiggleApplyToAll,
                                             flex: flex,
                                             magicalViewModel: viewModelAnimationJiggleApplyToAll,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelAnimationJiggleApplyToAll.refresh()
        return animationJiggleApplyToAllToolNode
    }
}
