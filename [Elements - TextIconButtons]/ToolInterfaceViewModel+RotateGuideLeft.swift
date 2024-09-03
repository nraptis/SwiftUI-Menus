//
//  ToolInterfaceViewModel+RotateGuideLeft.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/26/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRotateGuideLeftTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideLeftLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRotateGuideLeftLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRotateGuideLeft = MagicalTextIconButtonViewModelRotateGuideLeft(orientation: jiggleViewModel.orientation,
                                                                               textIconButtonConfiguration: configuration)
        let removeJiggleToolNode = ToolNode(id: getToolNodeID(),
                                            element: .textIconButtonRotateGuideLeft,
                                            flex: flex,
                                            magicalViewModel: viewModelRotateGuideLeft,
                                            neighborTypeLeft: neighborTypeLeft,
                                            neighborTypeRight: neighborTypeRight)
        viewModelRotateGuideLeft.refresh()
        return removeJiggleToolNode
    }
}
