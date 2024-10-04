//
//  ToolInterfaceViewModel+ResetSwivelTilt.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/23/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetSwivelTiltTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelTiltLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelTiltLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetSwivelTilt = MagicalTextIconButtonViewModelResetSwivelTilt(orientation: jiggleViewModel.orientation,
                                                                                     textIconButtonConfiguration: configuration)
        let test1ToolNode = ToolNode(id: getToolNodeID(), 
                                     element: .textIconButtonResetSwivelTilt,
                                     flex: flex,
                                     magicalViewModel: viewModelResetSwivelTilt,
                                     neighborTypeLeft: neighborTypeLeft,
                                     neighborTypeRight: neighborTypeRight)
        viewModelResetSwivelTilt.refresh()
        return test1ToolNode
    }
}
