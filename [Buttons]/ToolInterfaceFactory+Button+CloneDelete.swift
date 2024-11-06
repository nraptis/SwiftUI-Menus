//
//  ToolInterfaceFactory+Button+CloneDelete.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getCloneJiggleButtonToolNode(orientation: Orientation,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextCloneJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextCloneJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelCloneJiggle = MagicalButtonViewModelCloneJiggle(orientation: orientation,
                                                                     buttonConfiguration: configuration)
        let cloneJiggleToolNode = ToolNode(id: getToolNodeID(),
                                           element: .buttonCloneJiggle,
                                           flex: flex,
                                           magicalViewModel: viewModelCloneJiggle,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelCloneJiggle.refresh()
        return cloneJiggleToolNode
    }
    
    static func getDeleteJiggleButtonToolNode(orientation: Orientation,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.deleteBinA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteJiggle = MagicalButtonViewModelDeleteJiggle(orientation: orientation,
                                                                       buttonConfiguration: configuration)
        let deleteJiggleToolNode = ToolNode(id: getToolNodeID(),
                                            element: .buttonDeleteJiggle,
                                            flex: flex,
                                            magicalViewModel: viewModelDeleteJiggle,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelDeleteJiggle.refresh()
        return deleteJiggleToolNode
    }
    
    static func getDeleteJigglePointButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJigglePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJigglePointLine2()
        let iconPack = LooseConvertibleIconLibrary.deleteBinA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteJigglePoint = MagicalButtonViewModelDeleteJigglePoint(orientation: orientation,
                                                                                 buttonConfiguration: configuration)
        let deleteJigglePointToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonDeleteJigglePoint,
                                                 flex: flex,
                                                 magicalViewModel: viewModelDeleteJigglePoint,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelDeleteJigglePoint.refresh()
        return deleteJigglePointToolNode
    }
    
    static func getCloneGuideButtonToolNode(orientation: Orientation,
                                            neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextCloneGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextCloneGuideLine2()
        let iconPack = LooseConvertibleIconLibrary.cloneJiggleA
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelCloneGuide = MagicalButtonViewModelCloneGuide(orientation: orientation,
                                                                   buttonConfiguration: configuration)
        let cloneGuideToolNode = ToolNode(id: getToolNodeID(),
                                          element: .buttonCloneGuide,
                                          flex: flex,
                                          magicalViewModel: viewModelCloneGuide,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelCloneGuide.refresh()
        return cloneGuideToolNode
    }
    
    static func getDeleteGuideButtonToolNode(orientation: Orientation,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuideLine2()
        
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteGuide = MagicalButtonViewModelDeleteGuide(orientation: orientation,
                                                                     buttonConfiguration: configuration)
        let deleteGuideToolNode = ToolNode(id: getToolNodeID(),
                                           element: .buttonDeleteGuide,
                                           flex: flex,
                                           magicalViewModel: viewModelDeleteGuide,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelDeleteGuide.refresh()
        return deleteGuideToolNode
    }
    
    static func getDeleteGuidePointButtonToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuidePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuidePointLine2()
        let iconPack = LooseConvertibleIconLibrary.deleteBinA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteGuidePoint = MagicalButtonViewModelDeleteGuidePoint(orientation: orientation,
                                                                               buttonConfiguration: configuration)
        let deleteGuidePointToolNode = ToolNode(id: getToolNodeID(),
                                                element: .buttonDeleteGuidePoint,
                                                flex: flex,
                                                magicalViewModel: viewModelDeleteGuidePoint,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelDeleteGuidePoint.refresh()
        return deleteGuidePointToolNode
    }
    
}
