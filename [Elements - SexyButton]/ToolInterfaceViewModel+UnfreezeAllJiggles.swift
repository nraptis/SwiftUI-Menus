//
//  ToolInterfaceViewModel+UnfreezeAllJiggles.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getUnfreezeAllJigglesSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllJigglesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllJigglesLine2()
       let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelUnfreezeAllJiggles = MagicalSexyButtonViewModelUnfreezeAllJiggles(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonUnfreezeAllJiggles,
                                    flex: flex,
                                    magicalViewModel: viewModelUnfreezeAllJiggles,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelUnfreezeAllJiggles.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

