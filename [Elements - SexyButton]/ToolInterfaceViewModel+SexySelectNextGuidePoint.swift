//
//  ToolInterfaceViewModel+SelectNextGuidePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSelectNextGuidePointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextGuidePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextGuidePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextGuidePoint = MagicalSexyButtonViewModelSelectNextGuidePoint(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSelectNextGuidePoint,
                                    flex: flex,
                                    magicalViewModel: viewModelSelectNextGuidePoint,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSelectNextGuidePoint.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
