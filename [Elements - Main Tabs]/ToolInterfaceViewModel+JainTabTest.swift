//
//  ToolInterfaceViewModel+JainTabTest.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/6/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getJainTabTestMainTabToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementMainTabButtonConfiguration]()
        
        
        
        
        
       let viewTextIconPackable = FramedLongIconLibrary.menuA
        let viewLine1 = "Line One"
        let viewLine2 = "Two"
        let viewConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 0,
                                                                               iconPack: viewTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: viewLine1,
                                                                               nameLabelLine2: viewLine2)
        buttonConfigurations.append(viewConfiguration)
        
       let editTextIconPackable = FramedLongIconLibrary.menuB
      let editLine1: String? = nil
       let editLine2 = "L2"
       let editConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 1,
                                                                              iconPack: editTextIconPackable,
                                                                              orientation: orientation,
                                                                              nameLabelLine1: editLine1,
                                                                              nameLabelLine2: editLine2)
       buttonConfigurations.append(editConfiguration)
       
       let thirdTextIconPackable = FramedLongIconLibrary.menuC
      let thirdLine1 = "Harvey"
       let thirdLine2 = "Nash X"
       let thirdConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 2,
                                                                              iconPack: editTextIconPackable,
                                                                              orientation: orientation,
                                                                              nameLabelLine1: thirdLine1,
                                                                              nameLabelLine2: thirdLine2)
       buttonConfigurations.append(thirdConfiguration)
        
        let configuration = ToolInterfaceElementMainTabConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getMainTabFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalMainTabViewModelDocumentMode(orientation: jiggleViewModel.orientation,
                                                                        mainTabConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .mainTabJainTest,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
