//
//  ToolInterfaceViewModel+SelectNextJigglePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSelectNextJigglePointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJigglePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextJigglePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextJigglePoint = MagicalSexyButtonViewModelSelectNextJigglePoint(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSelectNextJigglePoint,
                                    flex: flex,
                                    magicalViewModel: viewModelSelectNextJigglePoint,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSelectNextJigglePoint.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
