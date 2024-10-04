//
//  ToolInterfaceViewModel+SexyRotateGuideLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRotateGuideLeftSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideLeftLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateGuideLeft = MagicalSexyButtonViewModelRotateGuideLeft(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonRotateGuideLeft,
                                    flex: flex,
                                    magicalViewModel: viewModelRotateGuideLeft,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRotateGuideLeft.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
