//
//  ToolInterfaceViewModel+SexySwivelZoomIn.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelZoomInButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelZoomInLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelZoomInLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelZoomIn = MagicalButtonViewModelSwivelZoomIn(orientation: jiggleViewModel.orientation,
                                                                           buttonConfiguration: configuration)
        let swivelZoomInToolNode = ToolNode(id: getToolNodeID(),
                                            element: .buttonSwivelZoomIn,
                                            flex: flex,
                                            magicalViewModel: viewModelSwivelZoomIn,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelSwivelZoomIn.refresh()
        return swivelZoomInToolNode
    }
}
