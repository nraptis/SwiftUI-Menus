//
//  ToolInterfaceViewModel+GreenButtonDone.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getDoneGreenButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        
        let textLine1 = "U Done"
        let textLine2: String? = nil
        let iconPack = FramedLongIconLibrary.menuB
        
        let configuration = ToolInterfaceElementGreenButtonConfiguration(iconPack: iconPack,
                                                                         orientation: orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getGreenButtonFlex(orientation: orientation,
                                                             configuration: configuration,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        
        let viewModelDone = MagicalGreenButtonViewModelDone(orientation: orientation,
                                                                          greenButtonConfiguration: configuration)
        let createSceneToolNode = ToolNode(id: getToolNodeID(),
                                           element: .greenButtonDone,
                                           flex: flex,
                                           magicalViewModel: viewModelDone,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelDone.refresh()
        return createSceneToolNode
    }
}
