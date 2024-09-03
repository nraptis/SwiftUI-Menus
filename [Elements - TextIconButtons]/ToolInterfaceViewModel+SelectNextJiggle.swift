//
//  ToolInterfaceViewModel+SelectNextJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation


extension ToolInterfaceViewModel {
    
    func getSelectNextJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextJiggle = MagicalTextIconButtonViewModelSelectNextJiggle(orientation: jiggleViewModel.orientation,
                                                                                       textIconButtonConfiguration: configuration)
        let selectNextJiggleToolNode = ToolNode(id: getToolNodeID(), 
                                                element: .textIconButtonSelectNextJiggle,
                                                flex: flex,
                                                magicalViewModel: viewModelSelectNextJiggle,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelSelectNextJiggle.refresh()
        return selectNextJiggleToolNode
    }
}
