//
//  ToolInterfaceViewModel+FlipVerticalWeightRing.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getFlipVerticalWeightRingTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipVerticalWeightRingLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipVerticalWeightRingLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipVerticalWeightRing = MagicalTextIconButtonViewModelFlipVerticalWeightRing(orientation: jiggleViewModel.orientation,
                                                                                                   textIconButtonConfiguration: configuration)
        let flipVerticalWeightRingToolNode = ToolNode(id: getToolNodeID(), 
                                                      element: .textIconButtonFlipVerticalWeightRing,
                                                      flex: flex,
                                                      magicalViewModel: viewModelFlipVerticalWeightRing,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        viewModelFlipVerticalWeightRing.refresh()
        return flipVerticalWeightRingToolNode
    }
}
