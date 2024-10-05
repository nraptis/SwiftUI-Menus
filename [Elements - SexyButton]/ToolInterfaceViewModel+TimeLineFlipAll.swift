//
//  ToolInterfaceViewModel+TimeLineFlipAll.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineFlipAllSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipAllLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlipAllLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineFlipAll = MagicalSexyButtonViewModelTimeLineFlipAll(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineFlipAll,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineFlipAll,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineFlipAll.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
