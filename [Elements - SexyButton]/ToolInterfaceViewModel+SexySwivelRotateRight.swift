//
//  ToolInterfaceViewModel+SexySwivelRotateRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSwivelRotateRightSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelRotateRight = MagicalSexyButtonViewModelSwivelRotateRight(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let swivelRotateRightToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSwivelRotateRight,
                                    flex: flex,
                                    magicalViewModel: viewModelSwivelRotateRight,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSwivelRotateRight.refresh()
        return swivelRotateRightToolNode
    }
    
}
