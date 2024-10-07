//
//  ImageImportViewModel+Next.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/1/24.
//

import Foundation

extension ImageImportViewModel {
    
    @MainActor func getCreateSceneGreenButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextCreateSceneLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextCreateSceneLine2()
        let iconPack = FramedLongIconLibrary.menuB
        
        let configuration = ToolInterfaceElementGreenButtonConfiguration(iconPack: iconPack,
                                                                         orientation: Self.orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2)
        let flex = ToolInterfaceViewModel.getGreenButtonFlex(orientation: Self.orientation,
                                                             configuration: configuration,
                                                             neighborTypeLeft: neighborTypeLeft,
                                                             neighborTypeRight: neighborTypeRight)
        
        let viewModelCreateScene = MagicalGreenButtonViewModelCreateScene(orientation: Self.orientation,
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
