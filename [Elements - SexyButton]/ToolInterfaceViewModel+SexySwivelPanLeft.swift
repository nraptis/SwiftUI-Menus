//
//  ToolInterfaceViewModel+SexySwivelPanLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getSwivelPanLeftButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                    orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2)
        let flex = Self.getButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanLeft = MagicalButtonViewModelSwivelPanLeft(orientation: jiggleViewModel.orientation,
                                                                             buttonConfiguration: configuration)
        let swivelPanLeftToolNode = ToolNode(id: getToolNodeID(),
                                             element: .buttonSwivelPanLeft,
                                             flex: flex,
                                             magicalViewModel: viewModelSwivelPanLeft,
                                             neighborTypeLeft: neighborTypeLeft,
                                             neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanLeft.refresh()
        return swivelPanLeftToolNode
    }
}
