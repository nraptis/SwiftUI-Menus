//
//  ToolInterfaceViewModel+TimeLineInvertV.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/22/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineInvertVSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineInvertVLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineInvertVLine2()
        let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineInvertV = MagicalSexyButtonViewModelTimeLineInvertV(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineInvertV,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineInvertV,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineInvertV.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
