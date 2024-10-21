//
//  ToolInterfaceViewModel+SexyResetWeightGraphStandardDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getResetWeightGraphStandardDampenedButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                          neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphStandardDampened = MagicalButtonViewModelResetWeightGraphStandardDampened(orientation: jiggleViewModel.orientation,
                                                                                                                   buttonConfiguration: configuration)
        let resetWeightGraphStandardDampenedToolNode = ToolNode(id: getToolNodeID(),
                                                                element: .buttonResetWeightGraphStandardDampened,
                                                                flex: flex,
                                                                magicalViewModel: viewModelResetWeightGraphStandardDampened,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphStandardDampened.refresh()
        return resetWeightGraphStandardDampenedToolNode
    }
}
