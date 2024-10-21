//
//  ToolInterfaceViewModel+SexySwivelTiltReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelTiltResetButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelTiltReset = MagicalButtonViewModelSwivelTiltReset(orientation: jiggleViewModel.orientation,
                                                                                 buttonConfiguration: configuration)
        let swivelTiltResetToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonSwivelTiltReset,
                                               flex: flex,
                                               magicalViewModel: viewModelSwivelTiltReset,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelSwivelTiltReset.refresh()
        return swivelTiltResetToolNode
    }
}
