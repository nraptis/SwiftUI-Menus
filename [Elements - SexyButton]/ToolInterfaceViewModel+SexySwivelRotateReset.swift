//
//  ToolInterfaceViewModel+SexySwivelRotateReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSwivelRotateResetSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelRotateResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelRotateReset = MagicalSexyButtonViewModelSwivelRotateReset(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let swivelRotateResetToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSwivelRotateReset,
                                    flex: flex,
                                    magicalViewModel: viewModelSwivelRotateReset,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSwivelRotateReset.refresh()
        return swivelRotateResetToolNode
    }
    
}
