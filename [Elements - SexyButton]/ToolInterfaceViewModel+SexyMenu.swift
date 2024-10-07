//
//  ToolInterfaceViewModel+SexyMenu.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getMenuSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextMainMenuLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextMainMenuLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        print("Menu Flex: \(flex)")
        
        let viewModelMenu = MagicalSexyButtonViewModelMenu(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let menuToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonMenu,
                                    flex: flex,
                                    magicalViewModel: viewModelMenu,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelMenu.refresh()
        return menuToolNode
    }
    
}
