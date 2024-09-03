//
//  ToolInterfaceViewModel+RemovePoint.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getRemovePointTextIconButtonToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibraryButtons.buttonTextRemovePointLine1()
        let textLine2 = ToolInterfaceStringLibraryButtons.buttonTextRemovePointLine2()
        let iconPack = TextIconButtonIconLibrary.removePoint
        
        let configuration = ToolInterfaceElementTextIconButtonConfiguration(iconPack: iconPack, orientation: orientation, nameLabelLine1: textLine1, nameLabelLine2: textLine2)
        let flex = Self.getTextIconButtonFlex(orientation: orientation,
                                              configuration: configuration,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight)
        
        let viewModelRemovePoint = MagicalTextIconButtonViewModelRemovePoint(orientation: jiggleViewModel.orientation,
                                                                             textIconButtonConfiguration: configuration)
        let removePointToolNode = ToolNode(id: getToolNodeID(), 
                                           element: .textIconButtonRemovePoint,
                                           flex: flex,
                                           magicalViewModel: viewModelRemovePoint,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        viewModelRemovePoint.refresh()
        return removePointToolNode
    }
}
