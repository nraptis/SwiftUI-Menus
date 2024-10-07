//
//  ToolInterfaceViewModel+SexyResetWeightGraphInverseDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//


import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetWeightGraphInverseDampenedSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphInverseDampened = MagicalSexyButtonViewModelResetWeightGraphInverseDampened(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let resetWeightGraphInverseDampenedToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonResetWeightGraphInverseDampened,
                                    flex: flex,
                                    magicalViewModel: viewModelResetWeightGraphInverseDampened,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphInverseDampened.refresh()
        return resetWeightGraphInverseDampenedToolNode
    }
    
}
