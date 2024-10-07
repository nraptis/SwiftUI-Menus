//
//  ToolInterfaceViewModel+SexySwivelRotateLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSwivelRotateLeftSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelRotateLeft = MagicalSexyButtonViewModelSwivelRotateLeft(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let swivelRotateLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSwivelRotateLeft,
                                    flex: flex,
                                    magicalViewModel: viewModelSwivelRotateLeft,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSwivelRotateLeft.refresh()
        return swivelRotateLeftToolNode
    }
    
}
