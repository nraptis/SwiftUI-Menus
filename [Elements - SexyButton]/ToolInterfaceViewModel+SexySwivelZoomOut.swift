//
//  ToolInterfaceViewModel+SexySwivelZoomOut.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelZoomOutButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelZoomOutLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelZoomOutLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelZoomOut = MagicalButtonViewModelSwivelZoomOut(orientation: jiggleViewModel.orientation,
                                                                             buttonConfiguration: configuration)
        let swivelZoomOutToolNode = ToolNode(id: getToolNodeID(),
                                             element: .buttonSwivelZoomOut,
                                             flex: flex,
                                             magicalViewModel: viewModelSwivelZoomOut,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelSwivelZoomOut.refresh()
        return swivelZoomOutToolNode
    }
}
