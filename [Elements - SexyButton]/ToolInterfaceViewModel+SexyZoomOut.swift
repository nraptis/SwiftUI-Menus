//
//  ToolInterfaceViewModel+SexyZoomOut.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getZoomOutSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomOutLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomOutLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomOut = MagicalSexyButtonViewModelZoomOut(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let zoomOutToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonZoomOut,
                                    flex: flex,
                                    magicalViewModel: viewModelZoomOut,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelZoomOut.refresh()
        return zoomOutToolNode
    }
    
}
