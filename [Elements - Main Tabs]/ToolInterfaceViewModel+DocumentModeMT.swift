//
//  ToolInterfaceViewModel+DocumentModeMT.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getDocumentModeMainTabToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementMainTabButtonConfiguration]()
        
        
        
        
        
        let viewTextIconPackable = MainTabIconLibrary.polygon
        let viewLine1 = ToolInterfaceStringLibraryMainTabs.buttonTextViewLine1()
        let viewLine2 = ToolInterfaceStringLibraryMainTabs.buttonTextViewLine2()
        let viewConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 0,
                                                                               iconPack: viewTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: viewLine1,
                                                                               nameLabelLine2: viewLine2)
        buttonConfigurations.append(viewConfiguration)
        
        let editTextIconPackable = MainTabIconLibrary.perfectJiggle
        let editLine1 = ToolInterfaceStringLibraryMainTabs.buttonTextEditLine1()
        let editLine2 = ToolInterfaceStringLibraryMainTabs.buttonTextEditLine2()
        let editConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 1,
                                                                               iconPack: editTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: editLine1,
                                                                               nameLabelLine2: editLine2)
        buttonConfigurations.append(editConfiguration)
        
        let configuration = ToolInterfaceElementMainTabConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getMainTabFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalMainTabViewModelDocumentMode(orientation: jiggleViewModel.orientation,
                                                                        mainTabConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .mainTabDocumentMode,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
