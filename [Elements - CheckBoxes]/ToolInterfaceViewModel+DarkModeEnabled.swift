//
//  ToolInterfaceViewModel+DarkModeEnabled.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/20/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getDarkModeEnabledCheckBoxNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextDarkModeEnabledLine1()
        let textLine2 = ToolInterfaceStringLibraryCheckBoxes.checkBoxTextDarkModeEnabledLine2()
        let iconPack = CheckBoxIconLibrary.removePoints
        let configuration = ToolInterfaceElementCheckBoxConfiguration(iconPack: iconPack,
                                                                      orientation: orientation,
                                                                      nameLabelLine1: textLine1,
                                                                      nameLabelLine2: textLine2)
        let flex = Self.getCheckBoxFlex(orientation: orientation,
                                        configuration: configuration,
                                        neighborTypeLeft: neighborTypeLeft,
                                        neighborTypeRight: neighborTypeRight)
        let viewModelDarkModeEnabled = MagicalCheckBoxViewModelDarkModeEnabled(orientation: jiggleViewModel.orientation,
                                                                               checkBoxConfiguration: configuration)

        
        let result = ToolNode(id: getToolNodeID(),
                              element: .checkBoxDarkModeEnabled,
                              flex: flex,
                              magicalViewModel: viewModelDarkModeEnabled,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        
        viewModelDarkModeEnabled.refresh()
        
        return result
    }
}
