//
//  ToolInterfaceFactory+Button+Zoom.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getZoomResetButtonToolNode(orientation: Orientation,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomResetLine2()
        let iconPack = LooseConvertibleIconLibrary.undo
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomReset = MagicalButtonViewModelZoomReset(orientation: orientation,
                                                                 buttonConfiguration: configuration)
        let zoomResetToolNode = ToolNode(id: getToolNodeID(),
                                         element: .buttonZoomReset,
                                         flex: flex,
                                         magicalViewModel: viewModelZoomReset,
                                         neighborTypeLeft: neighborTypeLeft,
                                         neighborTypeRight: neighborTypeRight)
        viewModelZoomReset.refresh()
        return zoomResetToolNode
    }
    
    static func getZoomJiggleButtonToolNode(orientation: Orientation,
                                            neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.redo
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomJiggle = MagicalButtonViewModelZoomJiggle(orientation: orientation,
                                                                   buttonConfiguration: configuration)
        let zoomJiggleToolNode = ToolNode(id: getToolNodeID(),
                                          element: .buttonZoomJiggle,
                                          flex: flex,
                                          magicalViewModel: viewModelZoomJiggle,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        viewModelZoomJiggle.refresh()
        return zoomJiggleToolNode
    }
    
    static func getZoomInButtonToolNode(orientation: Orientation,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomInLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomInLine2()
        let iconPack = LooseConvertibleIconLibrary.redo
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomIn = MagicalButtonViewModelZoomIn(orientation: orientation,
                                                           buttonConfiguration: configuration)
        let zoomInToolNode = ToolNode(id: getToolNodeID(),
                                      element: .buttonZoomIn,
                                      flex: flex,
                                      magicalViewModel: viewModelZoomIn,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        viewModelZoomIn.refresh()
        return zoomInToolNode
    }
    
    static func getZoomOutButtonToolNode(orientation: Orientation,
                                         neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomOutLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomOutLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomOut = MagicalButtonViewModelZoomOut(orientation: orientation,
                                                             buttonConfiguration: configuration)
        let zoomOutToolNode = ToolNode(id: getToolNodeID(),
                                       element: .buttonZoomOut,
                                       flex: flex,
                                       magicalViewModel: viewModelZoomOut,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        viewModelZoomOut.refresh()
        return zoomOutToolNode
    }
}
