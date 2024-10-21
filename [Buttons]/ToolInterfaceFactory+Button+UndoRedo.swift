//
//  ToolInterfaceFactory+Button+Redo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/19/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getUndoButtonToolNode(orientation: Orientation,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUndoLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUndoLine2()
        let iconPack = LooseConvertibleIconLibrary.undo
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        
        let viewModelUndo = MagicalButtonViewModelUndo(orientation: orientation,
                                                       buttonConfiguration: configuration)
        let undoToolNode = ToolNode(id: getToolNodeID(),
                                    element: .buttonUndo,
                                    flex: flex,
                                    magicalViewModel: viewModelUndo,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelUndo.refresh()
        return undoToolNode
    }
    
    static func getRedoButtonToolNode(orientation: Orientation,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRedoLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRedoLine2()
        let iconPack = LooseConvertibleIconLibrary.redo
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelRedo = MagicalButtonViewModelRedo(orientation: orientation,
                                                       buttonConfiguration: configuration)
        let redoToolNode = ToolNode(id: getToolNodeID(),
                                    element: .buttonRedo,
                                    flex: flex,
                                    magicalViewModel: viewModelRedo,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRedo.refresh()
        return redoToolNode
    }
}
