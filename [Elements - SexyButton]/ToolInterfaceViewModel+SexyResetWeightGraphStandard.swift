//
//  ToolInterfaceViewModel+SexyResetWeightGraphStandard.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getResetWeightGraphStandardButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphStandard = MagicalButtonViewModelResetWeightGraphStandard(orientation: jiggleViewModel.orientation,
                                                                                                   buttonConfiguration: configuration)
        let resetWeightGraphStandardToolNode = ToolNode(id: getToolNodeID(),
                                                        element: .buttonResetWeightGraphStandard,
                                                        flex: flex,
                                                        magicalViewModel: viewModelResetWeightGraphStandard,
                                                        neighborTypeLeft: neighborTypeLeft,
                                                        neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphStandard.refresh()
        return resetWeightGraphStandardToolNode
    }
}
