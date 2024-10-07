//
//  ToolInterfaceViewModel+SexyAnimationTwistApplyToAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getAnimationTwistApplyToAllSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationTwistApplyToAllLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextAnimationTwistApplyToAllLine2()
        let iconPack = FramedConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationTwistApplyToAll = MagicalSexyCheckBoxViewModelAnimationTwistApplyToAll(orientation: orientation,
                                                                                                     sexyCheckBoxConfiguration: configuration)
        let animationTwistApplyToAllToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .sexyCheckBoxAnimationTwistApplyToAll,
                                                        flex: flex,
                                                        magicalViewModel: viewModelAnimationTwistApplyToAll,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelAnimationTwistApplyToAll.refresh()
        return animationTwistApplyToAllToolNode
        
    }
}
