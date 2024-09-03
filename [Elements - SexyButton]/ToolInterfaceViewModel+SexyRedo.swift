//
//  ToolInterfaceViewModel+SexyRedo.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRedoSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRedoLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRedoLine2()
        let iconPack = SexyButtonIconLibrary.graph
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack, 
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRedo = MagicalSexyButtonViewModelRedo(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let redoToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonRedo,
                                    flex: flex,
                                    magicalViewModel: viewModelRedo,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRedo.refresh()
        return redoToolNode
    }
}
