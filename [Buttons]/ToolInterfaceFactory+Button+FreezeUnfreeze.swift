//
//  ToolInterfaceFactory+Button+Freeze.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getFreezeSelectedJiggleButtonToolNode(orientation: Orientation,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeSelectedJiggle = MagicalButtonViewModelFreezeSelectedJiggle(orientation: orientation,
                                                                                       buttonConfiguration: configuration)
        let freezeSelectedJiggleToolNode = ToolNode(id: getToolNodeID(),
                                                    element: .buttonFreezeSelectedJiggle,
                                                    flex: flex,
                                                    magicalViewModel: viewModelFreezeSelectedJiggle,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        viewModelFreezeSelectedJiggle.refresh()
        return freezeSelectedJiggleToolNode
    }
    
    static func getFreezeSelectedGuideButtonToolNode(orientation: Orientation,
                                                     neighborTypeLeft: ToolInterfaceElementType?,
                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedGuideLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeSelectedGuide = MagicalButtonViewModelFreezeSelectedGuide(orientation: orientation,
                                                                                     buttonConfiguration: configuration)
        let freezeSelectedGuideToolNode = ToolNode(id: getToolNodeID(),
                                                   element: .buttonFreezeSelectedGuide,
                                                   flex: flex,
                                                   magicalViewModel: viewModelFreezeSelectedGuide,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        viewModelFreezeSelectedGuide.refresh()
        return freezeSelectedGuideToolNode
    }
    
    static func getUnfreezeAllJigglesButtonToolNode(orientation: Orientation,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllJigglesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllJigglesLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelUnfreezeAllJiggles = MagicalButtonViewModelUnfreezeAllJiggles(orientation: orientation,
                                                                                   buttonConfiguration: configuration)
        let unfreezeAllJigglesToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .buttonUnfreezeAllJiggles,
                                                  flex: flex,
                                                  magicalViewModel: viewModelUnfreezeAllJiggles,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelUnfreezeAllJiggles.refresh()
        return unfreezeAllJigglesToolNode
    }
    
    static func getUnfreezeAllGuidesButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllGuidesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllGuidesLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelUnfreezeAllGuides = MagicalButtonViewModelUnfreezeAllGuides(orientation: orientation,
                                                                                 buttonConfiguration: configuration)
        let unfreezeAllGuidesToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonUnfreezeAllGuides,
                                                 flex: flex,
                                                 magicalViewModel: viewModelUnfreezeAllGuides,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelUnfreezeAllGuides.refresh()
        return unfreezeAllGuidesToolNode
    }
    
}
