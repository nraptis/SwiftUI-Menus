//
//  ToolInterfaceViewModel+DeleteSelectedGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getDeleteGuideSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuideLine2()
        
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteGuide = MagicalSexyButtonViewModelDeleteGuide(orientation: jiggleViewModel.orientation,
                                                                         sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                                element: .sexyButtonDeleteGuide,
                                                flex: flex,
                                                magicalViewModel: viewModelDeleteGuide,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelDeleteGuide.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
