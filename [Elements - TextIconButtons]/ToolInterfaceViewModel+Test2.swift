//
//  ToolInterfaceViewModel+Test2.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTest2TextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTest2Line1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTest2Line2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTest2 = MagicalTextIconButtonViewModelTest2(orientation: jiggleViewModel.orientation,
                                                                 textIconButtonConfiguration: configuration)
        let test2ToolNode = ToolNode(id: getToolNodeID(), 
                                     element: .textIconButtonTest2,
                                     flex: flex,
                                     magicalViewModel: viewModelTest2,
                                     neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight)
        viewModelTest2.refresh()
        return test2ToolNode
    }
}
