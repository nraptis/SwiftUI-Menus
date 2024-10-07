//
//  ToolInterfaceViewModel+SexyResetWeightGraphLinearDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetWeightGraphLinearDampenedSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphLinearDampened = MagicalSexyButtonViewModelResetWeightGraphLinearDampened(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let resetWeightGraphLinearDampenedToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonResetWeightGraphLinearDampened,
                                    flex: flex,
                                    magicalViewModel: viewModelResetWeightGraphLinearDampened,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphLinearDampened.refresh()
        return resetWeightGraphLinearDampenedToolNode
    }
    
}
