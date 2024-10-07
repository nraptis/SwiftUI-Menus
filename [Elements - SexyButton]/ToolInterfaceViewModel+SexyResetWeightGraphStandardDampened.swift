//
//  ToolInterfaceViewModel+SexyResetWeightGraphStandardDampened.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetWeightGraphStandardDampenedSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardDampenedLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetWeightGraphStandardDampenedLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetWeightGraphStandardDampened = MagicalSexyButtonViewModelResetWeightGraphStandardDampened(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let resetWeightGraphStandardDampenedToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonResetWeightGraphStandardDampened,
                                    flex: flex,
                                    magicalViewModel: viewModelResetWeightGraphStandardDampened,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelResetWeightGraphStandardDampened.refresh()
        return resetWeightGraphStandardDampenedToolNode
    }
    
}
