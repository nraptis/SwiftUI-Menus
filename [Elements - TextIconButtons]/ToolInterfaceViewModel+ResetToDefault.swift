//
//  ToolInterfaceViewModel+ResetToDefault.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetToDefaultTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetToDefaultLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetToDefaultLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetToDefault = MagicalTextIconButtonViewModelResetToDefault(orientation: jiggleViewModel.orientation,
                                                                                   textIconButtonConfiguration: configuration)
        let resetToDefaultToolNode = ToolNode(id: getToolNodeID(), 
                                              element: .textIconButtonResetToDefault,
                                              flex: flex,
                                              magicalViewModel: viewModelResetToDefault,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelResetToDefault.refresh()
        return resetToDefaultToolNode
    }
}
