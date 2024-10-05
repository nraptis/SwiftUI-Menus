//
//  ToolInterfaceViewModel+SexyUndo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getUndoSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUndoLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUndoLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelUndo = MagicalSexyButtonViewModelUndo(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let undoToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonUndo,
                                    flex: flex,
                                    magicalViewModel: viewModelUndo,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelUndo.refresh()
        return undoToolNode
    }
    
}
