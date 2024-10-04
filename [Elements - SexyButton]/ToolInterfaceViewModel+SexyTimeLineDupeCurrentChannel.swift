//
//  ToolInterfaceViewModel+SexyTimeLineDupeCurrentChannel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/17/24.
//

import Foundation


extension ToolInterfaceViewModel {
    
   @MainActor func getTimeLineDupeCurrentChannelSexyButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeCurrentChannelLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextTimeLineDupeCurrentChannelLine2()
       let iconPack = LooseConvertibleIconLibrary.menuA
        
        let configuration = ToolInterfaceElementSexyButtonConfiguration(iconPack: iconPack,
                                                                        orientation: orientation,
                                                                        nameLabelLine1: textLine1,
                                                                        nameLabelLine2: textLine2)
        let flex = Self.getSexyButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelTimeLineDupeCurrentChannel = MagicalSexyButtonViewModelTimeLineDupeCurrentChannel(orientation: jiggleViewModel.orientation,
                                                           sexyButtonConfiguration: configuration)
        let rotateJiggleLeftToolNode = ToolNode(id: getToolNodeID(),
                                    element: .sexyButtonTimeLineDupeCurrentChannel,
                                    flex: flex,
                                    magicalViewModel: viewModelTimeLineDupeCurrentChannel,
                                    neighborTypeLeft: neighborTypeLeft,
                                    neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDupeCurrentChannel.refresh()
        return rotateJiggleLeftToolNode
    }
    
}
