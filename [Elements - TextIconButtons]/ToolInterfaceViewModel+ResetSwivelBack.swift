//
//  ToolInterfaceViewModel+ResetSwivelBack.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetSwivelBackTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelBackLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelBackLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetSwivelBack = MagicalTextIconButtonViewModelResetSwivelBack(orientation: jiggleViewModel.orientation,
                                                                                     textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), 
                                     element: .textIconButtonResetSwivelBack,
                                     flex: flex,
                                     magicalViewModel: viewModelResetSwivelBack,
                                     neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight)
        viewModelResetSwivelBack.refresh()
        return test1ToolNode
    }
}
