//
//  ToolInterfaceViewModel+SelectPreviousJigglePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSelectPreviousJigglePointSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJigglePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectPreviousJigglePointLine2()
        let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                          configuration: configuration,
                                          neighborTypeLeft: neighborTypeLeft,
                                          neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectPreviousJigglePoint = MagicalSexyButtonViewModelSelectPreviousJigglePoint(orientation: jiggleViewModel.orientation,
                                                                                                     sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                                element: .sexyButtonSelectPreviousJigglePoint,
                                                flex: flex,
                                                magicalViewModel: viewModelSelectPreviousJigglePoint,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        viewModelSelectPreviousJigglePoint.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
