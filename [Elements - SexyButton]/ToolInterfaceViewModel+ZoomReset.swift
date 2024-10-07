//
//  ToolInterfaceViewModel+ZoomReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/27/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getZoomResetSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextZoomResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextZoomResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelZoomReset = MagicalSexyButtonViewModelZoomReset(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonZoomReset,
                                    flex: flex,
                                    magicalViewModel: viewModelZoomReset,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelZoomReset.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

