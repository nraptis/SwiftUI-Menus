//
//  ToolInterfaceViewModel+SexyResetWeightGraphLinear.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetWeightGraphLinearSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphLinear = MagicalSexyButtonViewModelResetWeightGraphLinear(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let resetWeightGraphLinearToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonResetWeightGraphLinear,
                                    flex: flex,
                                    magicalViewModel: viewModelResetWeightGraphLinear,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphLinear.refresh()
        return resetWeightGraphLinearToolNode
    }
    
}