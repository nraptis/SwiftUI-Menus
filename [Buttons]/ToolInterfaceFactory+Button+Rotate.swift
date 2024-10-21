//
//  ToolInterfaceFactory+Button+Rotate.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getRotateGuideLeftButtonToolNode(orientation: Orientation,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.rotateLeftB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateGuideLeft = MagicalButtonViewModelRotateGuideLeft(orientation: orientation,
                                                                             buttonConfiguration: configuration)
        let rotateGuideLeftToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonRotateGuideLeft,
                                               flex: flex,
                                               magicalViewModel: viewModelRotateGuideLeft,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelRotateGuideLeft.refresh()
        return rotateGuideLeftToolNode
    }
    
    static func getRotateGuideRightButtonToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideRightLine2()
        let iconPack = LooseConvertibleIconLibrary.rotateRightB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateGuideRight = MagicalButtonViewModelRotateGuideRight(orientation: orientation,
                                                                               buttonConfiguration: configuration)
        let rotateGuideRightToolNode = ToolNode(id: getToolNodeID(),
                                                element: .buttonRotateGuideRight,
                                                flex: flex,
                                                magicalViewModel: viewModelRotateGuideRight,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelRotateGuideRight.refresh()
        return rotateGuideRightToolNode
    }
    
    static func getRotateJiggleLeftButtonToolNode(orientation: Orientation,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.rotateLeftA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateJiggleLeft = MagicalButtonViewModelRotateJiggleLeft(orientation: orientation,
                                                                               buttonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                                element: .buttonRotateJiggleLeft,
                                                flex: flex,
                                                magicalViewModel: viewModelRotateJiggleLeft,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelRotateJiggleLeft.refresh()
        return rotateJiggleLeftToolNode
    }
    
    static func getRotateJiggleRightButtonToolNode(orientation: Orientation,
                                                   neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleRightLine2()
        let iconPack = LooseConvertibleIconLibrary.rotateRightA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateJiggleRight = MagicalButtonViewModelRotateJiggleRight(orientation: orientation,
                                                                                 buttonConfiguration: configuration)
        let rotateJiggleRightToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonRotateJiggleRight,
                                                 flex: flex,
                                                 magicalViewModel: viewModelRotateJiggleRight,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelRotateJiggleRight.refresh()
        return rotateJiggleRightToolNode
    }
}
