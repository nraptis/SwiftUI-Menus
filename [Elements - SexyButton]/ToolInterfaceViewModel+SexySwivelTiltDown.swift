//
//  ToolInterfaceViewModel+SexySwivelTiltDown.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSwivelTiltDownSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltDownLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltDownLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelTiltDown = MagicalSexyButtonViewModelSwivelTiltDown(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let swivelTiltDownToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSwivelTiltDown,
                                    flex: flex,
                                    magicalViewModel: viewModelSwivelTiltDown,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSwivelTiltDown.refresh()
        return swivelTiltDownToolNode
    }
    
}
