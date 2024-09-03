//
//  ToolInterfaceViewModel+SendFrontJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/21/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSendFrontJiggleTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSendFrontJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSendFrontJiggleLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSendFrontJiggle = MagicalTextIconButtonViewModelSendFrontJiggle(orientation: jiggleViewModel.orientation,
                                                                                     textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), 
                                     element: .textIconButtonSendFrontJiggle,
                                     flex: flex,
                                     magicalViewModel: viewModelSendFrontJiggle,
                                     neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight)
        viewModelSendFrontJiggle.refresh()
        return test1ToolNode
    }
}
