//
//  ToolInterfaceViewModel+GreenButtonCreateScene.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getCreateSceneGreenButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        
        let textLine1 = ImageImportStringLibrary.buttonTextCreateSceneLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextCreateSceneLine2()
        let iconPack = FramedLongIconLibrary.menuB
        
        let configuration = ToolInterfaceElementGreenButtonConfiguration(iconPack: iconPack,
                                                                         orientation: orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getGreenButtonFlex(orientation: orientation,
                                                             configuration: configuration,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        
        let viewModelCreateScene = MagicalGreenButtonViewModelCreateScene(orientation: orientation,
                                                                          greenButtonConfiguration: configuration)
        let createSceneToolNode = ToolNode(id: getToolNodeID(),
                                           element: .greenButtonCreateScene,
                                           flex: flex,
                                           magicalViewModel: viewModelCreateScene,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelCreateScene.refresh()
        return createSceneToolNode
    }
}
