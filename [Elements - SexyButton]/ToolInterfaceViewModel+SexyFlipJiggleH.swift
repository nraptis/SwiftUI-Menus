//
//  ToolInterfaceViewModel+SexyFlipJiggleH.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getFlipJiggleHSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleHLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipJiggleHLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipJiggleH = MagicalSexyButtonViewModelFlipJiggleH(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonFlipJiggleH,
                                    flex: flex,
                                    magicalViewModel: viewModelFlipJiggleH,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelFlipJiggleH.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
