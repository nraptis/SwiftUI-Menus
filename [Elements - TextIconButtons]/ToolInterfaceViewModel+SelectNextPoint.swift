//
//  ToolInterfaceViewModel+SelectNextPoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getSelectNextPointTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextPointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextSelectNextPointLine2()
        let iconPack = TextIconButtonIconLibrary.box
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelSelectNextPoint = MagicalTextIconButtonViewModelSelectNextPoint(orientation: jiggleViewModel.orientation,
                                                                                     textIconButtonConfiguration: configuration)
        let selectNextPointToolNode = ToolNode(id: getToolNodeID(), 
                                               element: .textIconButtonSelectNextPoint,
                                               flex: flex,
                                               magicalViewModel: viewModelSelectNextPoint,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        viewModelSelectNextPoint.refresh()
        return selectNextPointToolNode
    }
}
