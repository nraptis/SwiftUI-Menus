//
//  ToolInterfaceViewModel+SexySwivelPanRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelPanRightButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanRight = MagicalButtonViewModelSwivelPanRight(orientation: jiggleViewModel.orientation,
                                                                               buttonConfiguration: configuration)
        let swivelPanRightToolNode = ToolNode(id: getToolNodeID(),
                                              element: .buttonSwivelPanRight,
                                              flex: flex,
                                              magicalViewModel: viewModelSwivelPanRight,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanRight.refresh()
        return swivelPanRightToolNode
    }
}
