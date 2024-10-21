//
//  ToolInterfaceFactory+Button+MainMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getMenuButtonToolNode(orientation: Orientation,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextMainMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextMainMenuLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelMenu = MagicalButtonViewModelMenu(orientation: orientation,
                                                       buttonConfiguration: configuration)
        let menuToolNode = ToolNode(id: getToolNodeID(),
                                    element: .buttonMenu,
                                    flex: flex,
                                    magicalViewModel: viewModelMenu,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelMenu.refresh()
        return menuToolNode
    }
    
    static func getGenerateTopographyButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextGenerateTopographyLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextGenerateTopographyLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelGenerateTopography = MagicalButtonViewModelGenerateTopography(orientation: orientation,
                                                                                   buttonConfiguration: configuration)
        let generateTopographyToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .buttonGenerateTopography,
                                                  flex: flex,
                                                  magicalViewModel: viewModelGenerateTopography,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelGenerateTopography.refresh()
        return generateTopographyToolNode
    }
}
