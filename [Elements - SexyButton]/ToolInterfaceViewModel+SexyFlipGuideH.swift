//
//  ToolInterfaceViewModel+SexyFlipGuideH.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getFlipGuideHSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideHLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideHLine2()
        
        let iconPack = LooseConvertibleIconLibrary.menuA
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipGuideH = MagicalSexyButtonViewModelFlipGuideH(orientation: jiggleViewModel.orientation,
                                                                       sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                                element: .sexyButtonFlipGuideH,
                                                flex: flex,
                                                magicalViewModel: viewModelFlipGuideH,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelFlipGuideH.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
