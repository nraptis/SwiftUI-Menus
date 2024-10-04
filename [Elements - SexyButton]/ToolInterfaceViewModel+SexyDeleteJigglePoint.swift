//
//  ToolInterfaceViewModel+DeleteSelectedJigglePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getDeleteJigglePointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJigglePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJigglePointLine2()
       let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteJigglePoint = MagicalSexyButtonViewModelDeleteJigglePoint(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonDeleteJigglePoint,
                                    flex: flex,
                                    magicalViewModel: viewModelDeleteJigglePoint,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelDeleteJigglePoint.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

