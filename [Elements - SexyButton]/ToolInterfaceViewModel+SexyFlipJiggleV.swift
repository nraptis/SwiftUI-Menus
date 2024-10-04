//
//  ToolInterfaceViewModel+SexyFlipJiggleV.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getFlipJiggleVSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleVLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleVLine2()
       let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipJiggleV = MagicalSexyButtonViewModelFlipJiggleV(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonFlipJiggleV,
                                    flex: flex,
                                    magicalViewModel: viewModelFlipJiggleV,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelFlipJiggleV.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
