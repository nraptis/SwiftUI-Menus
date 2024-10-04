//
//  ToolInterfaceViewModel+SexyRotateJiggleLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRotateJiggleLeftSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateJiggleLeft = MagicalSexyButtonViewModelRotateJiggleLeft(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonRotateJiggleLeft,
                                    flex: flex,
                                    magicalViewModel: viewModelRotateJiggleLeft,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRotateJiggleLeft.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
