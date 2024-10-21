//
//  ToolInterfaceViewModel+SexyResetWeightGraphInverseDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//


import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getResetWeightGraphInverseDampenedButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphInverseDampened = MagicalButtonViewModelResetWeightGraphInverseDampened(orientation: jiggleViewModel.orientation,
                                                                                                                 buttonConfiguration: configuration)
        let resetWeightGraphInverseDampenedToolNode = ToolNode(id: getToolNodeID(),
                                                               element: .buttonResetWeightGraphInverseDampened,
                                                               flex: flex,
                                                               magicalViewModel: viewModelResetWeightGraphInverseDampened,
                                                               neighborTypeLeft: neighborTypeLeft,
                                                               neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphInverseDampened.refresh()
        return resetWeightGraphInverseDampenedToolNode
    }
}
