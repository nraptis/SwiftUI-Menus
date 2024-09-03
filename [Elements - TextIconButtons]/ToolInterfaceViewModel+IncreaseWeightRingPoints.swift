//
//  ToolInterfaceViewModel+IncreaseWeightRingPoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getIncreaseWeightRingPointsTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextIncreaseWeightRingPointsLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextIncreaseWeightRingPointsLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelIncreaseWeightRingPoints = MagicalTextIconButtonViewModelIncreaseWeightRingPoints(orientation: jiggleViewModel.orientation,
                                                                                                       textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), 
                                     element: .textIconButtonIncreaseWeightRingPoints,
                                     flex: flex,
                                     magicalViewModel: viewModelIncreaseWeightRingPoints,
                                     neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight)
        viewModelIncreaseWeightRingPoints.refresh()
        return test1ToolNode
    }
}
