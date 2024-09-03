//
//  ToolInterfaceViewModel+RotateJiggleLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRotateJiggleLeftTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleLeftLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateJiggleLeft = MagicalTextIconButtonViewModelRotateJiggleLeft(orientation: jiggleViewModel.orientation,
                                                                               textIconButtonConfiguration: configuration)
        let removeJiggleToolNode = ToolNode(id: getToolNodeID(),
                                            element: .textIconButtonRotateJiggleLeft,
                                            flex: flex,
                                            magicalViewModel: viewModelRotateJiggleLeft,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelRotateJiggleLeft.refresh()
        return removeJiggleToolNode
    }
}
