//
//  ToolInterfaceViewModel+DeleteSelectedGuidePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getDeleteGuidePointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuidePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextDeleteGuidePointLine2()
       let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelDeleteGuidePoint = MagicalSexyButtonViewModelDeleteGuidePoint(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonDeleteGuidePoint,
                                    flex: flex,
                                    magicalViewModel: viewModelDeleteGuidePoint,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelDeleteGuidePoint.refresh()
        return rotateJiggleLeftToolNode
    }
    
}

