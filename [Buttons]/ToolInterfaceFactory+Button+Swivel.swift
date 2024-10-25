//
//  ToolInterfaceFactory+Button+Swivel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/22/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getSwivelPanResetButtonToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanReset = MagicalButtonViewModelSwivelPanReset(orientation: orientation,
                                                                           buttonConfiguration: configuration)
        let swivelPanResetToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonSwivelPanReset,
                                              flex: flex,
                                              magicalViewModel: viewModelSwivelPanReset,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanReset.refresh()
        return swivelPanResetToolNode
    }
    
    static func getSwivelPanLeftButtonToolNode(orientation: Orientation,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanLeft = MagicalButtonViewModelSwivelPanLeft(orientation: orientation,
                                                                         buttonConfiguration: configuration)
        let swivelPanLeftToolNode = ToolNode(id: getToolNodeID(),
                                             element: .buttonSwivelPanLeft,
                                             flex: flex,
                                             magicalViewModel: viewModelSwivelPanLeft,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanLeft.refresh()
        return swivelPanLeftToolNode
    }
    
    static func getSwivelPanRightButtonToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanRight = MagicalButtonViewModelSwivelPanRight(orientation: orientation,
                                                                           buttonConfiguration: configuration)
        let swivelPanRightToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonSwivelPanRight,
                                              flex: flex,
                                              magicalViewModel: viewModelSwivelPanRight,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanRight.refresh()
        return swivelPanRightToolNode
    }
}
