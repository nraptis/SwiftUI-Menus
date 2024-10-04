//
//  ToolInterfaceViewModel+ResetSwivelCamera.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getResetSwivelCameraTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelCameraLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextResetSwivelCameraLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelResetSwivelCamera = MagicalTextIconButtonViewModelResetSwivelCamera(orientation: jiggleViewModel.orientation,
                                                                                         textIconButtonConfiguration: configuration)
        let resetSwivelCameraToolNode = ToolNode(id: getToolNodeID(), 
                                                 element: .textIconButtonResetSwivelCamera,
                                                 flex: flex,
                                                 magicalViewModel: viewModelResetSwivelCamera,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        viewModelResetSwivelCamera.refresh()
        return resetSwivelCameraToolNode
    }
}
