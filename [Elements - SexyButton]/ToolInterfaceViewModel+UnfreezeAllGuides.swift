//
//  ToolInterfaceViewModel+UnfreezeAllGuides.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getUnfreezeAllGuidesSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllGuidesLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextUnfreezeAllGuidesLine2()
       let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelUnfreezeAllGuides = MagicalSexyButtonViewModelUnfreezeAllGuides(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonUnfreezeAllGuides,
                                    flex: flex,
                                    magicalViewModel: viewModelUnfreezeAllGuides,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelUnfreezeAllGuides.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

