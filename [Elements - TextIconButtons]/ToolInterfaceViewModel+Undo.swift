//
//  ToolInterfaceViewModel+Undo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getUndoTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUndoLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUndoLine2()
        let iconPack = TextIconButtonIconLibrary.undo
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelUndo = MagicalTextIconButtonViewModelUndo(orientation: jiggleViewModel.orientation,
                                                               textIconButtonConfiguration: configuration)
        let undoToolNode = ToolNode(id: getToolNodeID(), 
                                    element: .textIconButtonUndo,
                                    flex: flex,
                                    magicalViewModel: viewModelUndo, 
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelUndo.refresh()
        return undoToolNode
    }
}
