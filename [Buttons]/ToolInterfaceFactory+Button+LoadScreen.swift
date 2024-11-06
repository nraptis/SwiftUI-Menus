//
//  ToolInterfaceFactory+Button+LoadScreen.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/21/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getLoadSceneBackButtonToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = GeneralStringLibrary.generalTextBackLine1()
        let textLine2 = GeneralStringLibrary.generalTextBackLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelLoadSceneBack = MagicalButtonViewModelLoadSceneBack(orientation: orientation,
                                                                         buttonConfiguration: configuration)
        let generateGuidesToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonLoadScreenButtonBack,
                                              flex: flex,
                                              magicalViewModel: viewModelLoadSceneBack,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelLoadSceneBack.refresh()
        return generateGuidesToolNode
    }
    
}
