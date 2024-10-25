//
//  ToolInterfaceFactory+MainTab.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getDocumentModeMainTabToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementMainTabButtonConfiguration]()
        
        let viewTextIconPackable = FramedLongIconLibrary.continuousA
        let viewLine1 = ToolInterfaceStringLibraryMainTabs.buttonTextViewLine1()
        let viewLine2 = ToolInterfaceStringLibraryMainTabs.buttonTextViewLine2()
        let viewConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 0,
                                                                               iconPack: viewTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: viewLine1,
                                                                               nameLabelLine2: viewLine2)
        buttonConfigurations.append(viewConfiguration)
        
        let editTextIconPackable = FramedLongIconLibrary.continuousB
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
        let viewModelDocumentMode = MagicalMainTabViewModelDocumentMode(orientation: orientation,
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
    
    static func getJainTabTestMainTabToolNode(orientation: Orientation,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementMainTabButtonConfiguration]()
        
        
        
        
        
        let viewTextIconPackable = FramedLongIconLibrary.menuC
        let viewLine1 = "Line One"
        let viewLine2 = "Two"
        let viewConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 0,
                                                                               iconPack: viewTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: viewLine1,
                                                                               nameLabelLine2: viewLine2)
        buttonConfigurations.append(viewConfiguration)
        
        let editTextIconPackable = FramedLongIconLibrary.continuousB
        let editLine1: String? = nil
        let editLine2 = "L2"
        let editConfiguration = ToolInterfaceElementMainTabButtonConfiguration(id: 1,
                                                                               iconPack: editTextIconPackable,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: editLine1,
                                                                               nameLabelLine2: editLine2)
        buttonConfigurations.append(editConfiguration)
        
        let thirdTextIconPackable = FramedLongIconLibrary.continuousA
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
        let viewModelDocumentMode = MagicalMainTabViewModelDocumentMode(orientation: orientation,
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
    
    static func getSkainTabTestMainTabToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
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
        
        let thirdTextIconPackable = FramedLongIconLibrary.menuC
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
        let viewModelDocumentMode = MagicalMainTabViewModelDocumentMode(orientation: orientation,
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
