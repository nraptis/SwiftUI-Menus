//
//  ToolInterfaceViewModel+SexyResetWeightGraphInverse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getResetWeightGraphInverseButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphInverse = MagicalButtonViewModelResetWeightGraphInverse(orientation: jiggleViewModel.orientation,
                                                                                                 buttonConfiguration: configuration)
        let resetWeightGraphInverseToolNode = ToolNode(id: getToolNodeID(),
                                                       element: .buttonResetWeightGraphInverse,
                                                       flex: flex,
                                                       magicalViewModel: viewModelResetWeightGraphInverse,
                                                       neighborTypeLeft: neighborTypeLeft,
                                                       neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphInverse.refresh()
        return resetWeightGraphInverseToolNode
    }
}
