//
//  ToolInterfaceViewModel+SexyFlipGuideV.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getFlipGuideVSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideVLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextFlipGuideVLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelFlipGuideV = MagicalSexyButtonViewModelFlipGuideV(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonFlipGuideV,
                                    flex: flex,
                                    magicalViewModel: viewModelFlipGuideV,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelFlipGuideV.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
