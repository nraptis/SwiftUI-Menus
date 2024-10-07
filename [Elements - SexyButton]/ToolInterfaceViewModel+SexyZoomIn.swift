//
//  ToolInterfaceViewModel+SexyZoomIn.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getZoomInSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomInLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomInLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomIn = MagicalSexyButtonViewModelZoomIn(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let zoomInToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonZoomIn,
                                    flex: flex,
                                    magicalViewModel: viewModelZoomIn,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelZoomIn.refresh()
        return zoomInToolNode
    }
    
}
