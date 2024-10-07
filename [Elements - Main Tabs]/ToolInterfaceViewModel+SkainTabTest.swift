//
//  ToolInterfaceViewModel+SkainTabTest.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/6/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSkainTabTestMainTabToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementMainTabButtonConfiguration]()
        
        
        
        
        
       let viewTextIconPackable = FramedLongIconLibrary.checkBoxSquare
        let viewLine1 = "Pit"
        let viewLine2 = "Patter"
        let viewConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 0,
                                                                               iconPack: viewTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: viewLine1,
                                                                               nameLabelLine2: viewLine2)
        buttonConfigurations.append(viewConfiguration)
        
       let editTextIconPackable = FramedLongIconLibrary.checkBoxSquare
      let editLine1 = "Skain"
       let editLine2 = "Ska"
       let editConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 1,
                                                                              iconPack: editTextIconPackable,
                                                                              orientation: orientation,
                                                                              nameLabelLine1: editLine1,
                                                                              nameLabelLine2: editLine2)
       buttonConfigurations.append(editConfiguration)
       
       let thirdTextIconPackable = FramedLongIconLibrary.menuB
       let thirdLine1: String? = "A"
       let thirdLine2: String? = nil
       let thirdConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 2,
                                                                              iconPack: editTextIconPackable,
                                                                              orientation: orientation,
                                                                              nameLabelLine1: thirdLine1,
                                                                              nameLabelLine2: thirdLine2)
       buttonConfigurations.append(thirdConfiguration)
       
       
       let fortTextIconPackable = FramedConvertibleIconLibrary.menuC
       let fortLine1: String? = "A"
       let fortLine2: String? = nil
       let fortConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 3,
                                                                              iconPack: editTextIconPackable,
                                                                              orientation: orientation,
                                                                              nameLabelLine1: fortLine1,
                                                                              nameLabelLine2: fortLine2)
       buttonConfigurations.append(fortConfiguration)
        
        let configuration = ToolInterfaceElementMainTabConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getMainTabFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalMainTabViewModelDocumentMode(orientation: jiggleViewModel.orientation,
                                                                        mainTabConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .mainTabSkainTest,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
