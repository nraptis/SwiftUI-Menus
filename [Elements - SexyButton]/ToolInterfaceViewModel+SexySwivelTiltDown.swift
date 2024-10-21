//
//  ToolInterfaceViewModel+SexySwivelTiltDown.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelTiltDownButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltDownLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltDownLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelTiltDown = MagicalButtonViewModelSwivelTiltDown(orientation: jiggleViewModel.orientation,
                                                                               buttonConfiguration: configuration)
        let swivelTiltDownToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonSwivelTiltDown,
                                              flex: flex,
                                              magicalViewModel: viewModelSwivelTiltDown,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelSwivelTiltDown.refresh()
        return swivelTiltDownToolNode
    }
}
