//
//  ToolInterfaceViewModel+SexySwivelTiltReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSwivelTiltResetSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelTiltResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelTiltReset = MagicalSexyButtonViewModelSwivelTiltReset(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let swivelTiltResetToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSwivelTiltReset,
                                    flex: flex,
                                    magicalViewModel: viewModelSwivelTiltReset,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSwivelTiltReset.refresh()
        return swivelTiltResetToolNode
    }
    
}
