//
//  ToolInterfaceViewModel+SexyGenerateTopography.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getGenerateTopographySexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextGenerateTopographyLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextGenerateTopographyLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelGenerateTopography = MagicalSexyButtonViewModelGenerateTopography(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let generateTopographyToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonGenerateTopography,
                                    flex: flex,
                                    magicalViewModel: viewModelGenerateTopography,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelGenerateTopography.refresh()
        return generateTopographyToolNode
    }
    
}
