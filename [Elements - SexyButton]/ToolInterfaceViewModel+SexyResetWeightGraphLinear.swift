//
//  ToolInterfaceViewModel+SexyResetWeightGraphLinear.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getResetWeightGraphLinearButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphLinearLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphLinear = MagicalButtonViewModelResetWeightGraphLinear(orientation: jiggleViewModel.orientation,
                                                                                               buttonConfiguration: configuration)
        let resetWeightGraphLinearToolNode = ToolNode(id: getToolNodeID(),
                                                      element: .buttonResetWeightGraphLinear,
                                                      flex: flex,
                                                      magicalViewModel: viewModelResetWeightGraphLinear,
                                                      neighborTypeLeft: neighborTypeLeft,
                                                      neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphLinear.refresh()
        return resetWeightGraphLinearToolNode
    }
}
