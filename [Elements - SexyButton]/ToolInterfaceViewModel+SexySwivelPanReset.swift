//
//  ToolInterfaceViewModel+SexySwivelPanReset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getSwivelPanResetSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanResetLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSwivelPanResetLine2()
        let iconPack = LooseConvertibleIconLibrary.menuB
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSwivelPanReset = MagicalSexyButtonViewModelSwivelPanReset(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let swivelPanResetToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonSwivelPanReset,
                                    flex: flex,
                                    magicalViewModel: viewModelSwivelPanReset,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelSwivelPanReset.refresh()
        return swivelPanResetToolNode
    }
    
}
