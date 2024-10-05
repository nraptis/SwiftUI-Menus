//
//  ToolInterfaceViewModel+SexyTimeLineResetDefaultCurrentChannel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineResetDefaultCurrentChannelSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDefaultCurrentChannelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineResetDefaultCurrentChannelLine2()
       let iconPack = LooseConvertibleIconLibrary.menuC
        
        let configuration = ToolInterfaceElementButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineResetDefaultCurrentChannel = MagicalSexyButtonViewModelTimeLineResetDefaultCurrentChannel(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineResetDefaultCurrentChannel,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineResetDefaultCurrentChannel,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineResetDefaultCurrentChannel.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
