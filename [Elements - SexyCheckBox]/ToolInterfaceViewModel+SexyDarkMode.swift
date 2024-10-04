//
//  ToolInterfaceViewModel+SexyDarkMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getDarkModeSexyCheckBoxToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextDarkModeEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextDarkModeEnabledLine2()
        let iconPack = MainTabIconLibrary.drawGuide
        
        
        let configuration = ToolInterfaceElementSexyCheckBoxConfiguration(iconPack: iconPack,
                                                                          orientation: orientation,
                                                                          nameLabelLine1: textLine1,
                                                                          nameLabelLine2: textLine2)
        
        let flex = Self.getSexyCheckBoxFlex(orientation: orientation,
                                            configuration: configuration,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        
        let viewModelDarkMode = MagicalSexyCheckBoxViewModelDarkMode(orientation: orientation,
                                                                     sexyCheckBoxConfiguration: configuration)
        let darkModeToolNode = ToolNode(id: getToolNodeID(),
                                        element: .sexyCheckBoxDarkMode,
                                        flex: flex,
                                        magicalViewModel: viewModelDarkMode,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        viewModelDarkMode.refresh()
        return darkModeToolNode
    }
}
