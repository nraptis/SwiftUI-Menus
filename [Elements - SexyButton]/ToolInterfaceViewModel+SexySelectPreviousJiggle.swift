//
//  ToolInterfaceViewModel+SelectPreviousJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSelectPreviousJiggleSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousJiggle = MagicalSexyButtonViewModelSelectPreviousJiggle(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSelectPreviousJiggle,
                                    flex: flex,
                                    magicalViewModel: viewModelSelectPreviousJiggle,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousJiggle.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
