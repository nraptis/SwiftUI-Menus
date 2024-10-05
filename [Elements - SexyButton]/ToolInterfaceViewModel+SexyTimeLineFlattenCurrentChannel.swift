//
//  ToolInterfaceViewModel+SexyTimeLineFlattenCurrentChannel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation


extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineFlattenCurrentChannelSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlattenCurrentChannelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineFlattenCurrentChannelLine2()
       let iconPack = LooseConvertibleIconLibrary.menuB
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineFlattenCurrentChannel = MagicalSexyButtonViewModelTimeLineFlattenCurrentChannel(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineFlattenCurrentChannel,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineFlattenCurrentChannel,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineFlattenCurrentChannel.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
