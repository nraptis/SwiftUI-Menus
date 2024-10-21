//
//  ToolInterfaceViewModel+SexySwivelRotateRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelRotateRightButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelRotateRight = MagicalButtonViewModelSwivelRotateRight(orientation: jiggleViewModel.orientation,
                                                                                     buttonConfiguration: configuration)
        let swivelRotateRightToolNode = ToolNode(id: getToolNodeID(),
                                                 element: .buttonSwivelRotateRight,
                                                 flex: flex,
                                                 magicalViewModel: viewModelSwivelRotateRight,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelSwivelRotateRight.refresh()
        return swivelRotateRightToolNode
    }
}
