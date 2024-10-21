//
//  ToolInterfaceViewModel+SexySwivelPanReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelPanResetButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanReset = MagicalButtonViewModelSwivelPanReset(orientation: jiggleViewModel.orientation,
                                                                               buttonConfiguration: configuration)
        let swivelPanResetToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonSwivelPanReset,
                                              flex: flex,
                                              magicalViewModel: viewModelSwivelPanReset,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanReset.refresh()
        return swivelPanResetToolNode
    }
}
