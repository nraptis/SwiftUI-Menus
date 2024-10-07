//
//  ToolInterfaceViewModel+SexyResetWeightGraphInverse.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetWeightGraphInverseSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphInverseLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphInverse = MagicalSexyButtonViewModelResetWeightGraphInverse(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let resetWeightGraphInverseToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonResetWeightGraphInverse,
                                    flex: flex,
                                    magicalViewModel: viewModelResetWeightGraphInverse,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphInverse.refresh()
        return resetWeightGraphInverseToolNode
    }
    
}
