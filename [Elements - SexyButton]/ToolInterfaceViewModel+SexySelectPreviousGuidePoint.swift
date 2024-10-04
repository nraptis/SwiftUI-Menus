//
//  ToolInterfaceViewModel+SelectPreviousGuidePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSelectPreviousGuidePointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousGuidePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousGuidePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousGuidePoint = MagicalSexyButtonViewModelSelectPreviousGuidePoint(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSelectPreviousGuidePoint,
                                    flex: flex,
                                    magicalViewModel: viewModelSelectPreviousGuidePoint,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousGuidePoint.refresh()
        return rotateJiggleLeftToolNode
    }
}
