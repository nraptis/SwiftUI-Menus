//
//  ToolInterfaceViewModel+SexyRotateGuideRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/29/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getRotateGuideRightSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideRightLine2()
       let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateGuideRight = MagicalSexyButtonViewModelRotateGuideRight(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonRotateGuideRight,
                                    flex: flex,
                                    magicalViewModel: viewModelRotateGuideRight,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRotateGuideRight.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
