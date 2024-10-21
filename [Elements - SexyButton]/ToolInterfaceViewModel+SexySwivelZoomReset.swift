//
//  ToolInterfaceViewModel+SexySwivelZoomReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelZoomResetButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelZoomResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelZoomResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelZoomReset = MagicalButtonViewModelSwivelZoomReset(orientation: jiggleViewModel.orientation,
                                                                                 buttonConfiguration: configuration)
        let swivelZoomResetToolNode = ToolNode(id: getToolNodeID(),
                                               element: .buttonSwivelZoomReset,
                                               flex: flex,
                                               magicalViewModel: viewModelSwivelZoomReset,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelSwivelZoomReset.refresh()
        return swivelZoomResetToolNode
    }
}
