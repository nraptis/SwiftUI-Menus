//
//  ToolInterfaceViewModel+FreezeSelectedGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getFreezeSelectedGuideSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFreezeSelectedGuideLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelFreezeSelectedGuide = MagicalSexyButtonViewModelFreezeSelectedGuide(orientation: jiggleViewModel.orientation,
                                                                                         sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                                element: .sexyButtonFreezeSelectedGuide,
                                                flex: flex,
                                                magicalViewModel: viewModelFreezeSelectedGuide,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelFreezeSelectedGuide.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
