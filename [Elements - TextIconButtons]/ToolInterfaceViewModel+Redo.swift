//
//  ToolInterfaceViewModel+Redo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRedoTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRedoLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRedoLine2()
        let iconPack = TextIconButtonIconLibrary.redo
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRedo = MagicalTextIconButtonViewModelRedo(orientation: jiggleViewModel.orientation,
                                                               textIconButtonConfiguration: configuration)
        let redoToolNode = ToolNode(id: getToolNodeID(), 
                                    element: .textIconButtonRedo,
                                    flex: flex,
                                    magicalViewModel: viewModelRedo,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRedo.refresh()
        return redoToolNode
    }
}
