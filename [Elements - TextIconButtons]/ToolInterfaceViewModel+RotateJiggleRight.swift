//
//  ToolInterfaceViewModel+RotateJiggleRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRotateJiggleRightTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateJiggleRightLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateJiggleRight = MagicalTextIconButtonViewModelRotateJiggleRight(orientation: jiggleViewModel.orientation,
                                                                               textIconButtonConfiguration: configuration)
        let removeJiggleToolNode = ToolNode(id: getToolNodeID(),
                                            element: .textIconButtonRotateJiggleRight,
                                            flex: flex,
                                            magicalViewModel: viewModelRotateJiggleRight,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelRotateJiggleRight.refresh()
        return removeJiggleToolNode
    }
}
