//
//  ToolInterfaceViewModel+ZoomJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getZoomJiggleSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomJiggleLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomJiggleLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomJiggle = MagicalSexyButtonViewModelZoomJiggle(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonZoomJiggle,
                                    flex: flex,
                                    magicalViewModel: viewModelZoomJiggle,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelZoomJiggle.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
