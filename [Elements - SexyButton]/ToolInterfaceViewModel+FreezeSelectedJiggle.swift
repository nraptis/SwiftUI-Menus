//
//  ToolInterfaceViewModel+FreezeSelectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getFreezeSelectedJiggleSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeSelectedJiggle = MagicalSexyButtonViewModelFreezeSelectedJiggle(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonFreezeSelectedJiggle,
                                    flex: flex,
                                    magicalViewModel: viewModelFreezeSelectedJiggle,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelFreezeSelectedJiggle.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

