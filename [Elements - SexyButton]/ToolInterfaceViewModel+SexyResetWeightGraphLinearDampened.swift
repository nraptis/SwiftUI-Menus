//
//  ToolInterfaceViewModel+SexyResetWeightGraphLinearDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getResetWeightGraphLinearDampenedButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphLinearDampened = MagicalButtonViewModelResetWeightGraphLinearDampened(orientation: jiggleViewModel.orientation,
                                                                                                               buttonConfiguration: configuration)
        let resetWeightGraphLinearDampenedToolNode = ToolNode(id: getToolNodeID(),
                                                              element: .buttonResetWeightGraphLinearDampened,
                                                              flex: flex,
                                                              magicalViewModel: viewModelResetWeightGraphLinearDampened,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphLinearDampened.refresh()
        return resetWeightGraphLinearDampenedToolNode
    }
}
