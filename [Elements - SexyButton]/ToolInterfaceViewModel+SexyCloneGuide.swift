//
//  ToolInterfaceViewModel+CloneSelectedGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getCloneGuideSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextCloneGuideLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextCloneGuideLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelCloneGuide = MagicalSexyButtonViewModelCloneGuide(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonCloneGuide,
                                    flex: flex,
                                    magicalViewModel: viewModelCloneGuide,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelCloneGuide.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

