//
//  ToolInterfaceViewModel+SexyTimeLineDupeDuration.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineDupeDurationSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeDurationLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeDurationLine2()
       let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDupeDuration = MagicalSexyButtonViewModelTimeLineDupeDuration(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineDupeDuration,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineDupeDuration,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDupeDuration.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
