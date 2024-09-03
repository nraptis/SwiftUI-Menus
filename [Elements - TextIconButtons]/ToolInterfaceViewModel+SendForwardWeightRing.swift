//
//  ToolInterfaceViewModel+SendForwardWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSendForwardWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSendForwardWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSendForwardWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSendForwardWeightRing = MagicalTextIconButtonViewModelSendForwardWeightRing(orientation: jiggleViewModel.orientation,
                                                                                                 textIconButtonConfiguration: configuration)
        let sendForwardWeightRingToolNode = ToolNode(id: getToolNodeID(), 
                                                     element: .textIconButtonSendForwardWeightRing,
                                                     flex: flex,
                                                     magicalViewModel: viewModelSendForwardWeightRing,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        viewModelSendForwardWeightRing.refresh()
        return sendForwardWeightRingToolNode
    }
}

