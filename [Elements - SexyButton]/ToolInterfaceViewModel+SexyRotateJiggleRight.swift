//
//  ToolInterfaceViewModel+SexyRotateJiggleRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/10/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getRotateJiggleRightSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleRightLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateJiggleRight = MagicalSexyButtonViewModelRotateJiggleRight(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleRightToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonRotateJiggleRight,
                                    flex: flex,
                                    magicalViewModel: viewModelRotateJiggleRight,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelRotateJiggleRight.refresh()
        return rotateJiggleRightToolNode
    }
}
