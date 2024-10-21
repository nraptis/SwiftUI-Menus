//
//  ToolInterfaceViewModel+SexySwivelTiltUp.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelTiltUpButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltUpLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltUpLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelTiltUp = MagicalButtonViewModelSwivelTiltUp(orientation: jiggleViewModel.orientation,
                                                                           buttonConfiguration: configuration)
        let swivelTiltUpToolNode = ToolNode(id: getToolNodeID(),
                                            element: .buttonSwivelTiltUp,
                                            flex: flex,
                                            magicalViewModel: viewModelSwivelTiltUp,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelSwivelTiltUp.refresh()
        return swivelTiltUpToolNode
    }
}
