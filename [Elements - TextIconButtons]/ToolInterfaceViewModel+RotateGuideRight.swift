//
//  ToolInterfaceViewModel+RotateGuideRight.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRotateGuideRightTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideRightLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideRightLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateGuideRight = MagicalTextIconButtonViewModelRotateGuideRight(orientation: jiggleViewModel.orientation,
                                                                               textIconButtonConfiguration: configuration)
        let removeJiggleToolNode = ToolNode(id: getToolNodeID(),
                                            element: .textIconButtonRotateGuideRight,
                                            flex: flex,
                                            magicalViewModel: viewModelRotateGuideRight,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelRotateGuideRight.refresh()
        return removeJiggleToolNode
    }
}
