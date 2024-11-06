//
//  ToolInterfaceFactory+GreenButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/21/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getCreateSceneGreenButtonToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ImageImportStringLibrary.buttonTextCreateSceneLine1()
        let textLine2 = ImageImportStringLibrary.buttonTextCreateSceneLine2()
        let iconPack = FramedLongIconLibrary.menuC
        
        let configuration = ToolInterfaceElementGreenButtonConfiguration(iconPack: iconPack,
                                                                         orientation: orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2)
        let flex = Self.getGreenButtonFlex(orientation: orientation,
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
    
    static func getDoneGreenButtonToolNode(orientation: Orientation,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = "Done?"
        let textLine2: String? = nil
        let iconPack = FramedLongIconLibrary.menuC
        
        let configuration = ToolInterfaceElementGreenButtonConfiguration(iconPack: iconPack,
                                                                         orientation: orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2)
        let flex = Self.getGreenButtonFlex(orientation: orientation,
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
