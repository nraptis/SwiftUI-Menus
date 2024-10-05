//
//  ToolInterfaceViewModel+DeleteSelectedJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getDeleteJiggleSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteJiggle = MagicalSexyButtonViewModelDeleteJiggle(orientation: jiggleViewModel.orientation,
                                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                                element: .sexyButtonDeleteJiggle,
                                                flex: flex,
                                                magicalViewModel: viewModelDeleteJiggle,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelDeleteJiggle.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
