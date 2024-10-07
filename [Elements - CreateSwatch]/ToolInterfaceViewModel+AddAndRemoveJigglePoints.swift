//
//  ToolInterfaceViewModel+AddAndRemoveJigglePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getAddAndRemoveJigglePointsCreateSwatchToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
        let addJigglePointTextIconPack = FramedLongIconLibrary.menuB
        let addJigglePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddJigglePointLine1()
        let addJigglePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddJigglePointLine2()
        let addJigglePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                               iconPack: addJigglePointTextIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: addJigglePointLine1,
                                                                               nameLabelLine2: addJigglePointLine2)
        buttonConfigurations.append(addJigglePointConfiguration)
        
        let removeJigglePointIconPack = FramedLongIconLibrary.menuA
        let removeJigglePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveJigglePointLine1()
        let removeJigglePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveJigglePointLine2()
        let removeJigglePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                               iconPack: removeJigglePointIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: removeJigglePointLine1,
                                                                               nameLabelLine2: removeJigglePointLine2)
        buttonConfigurations.append(removeJigglePointConfiguration)
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalCreateSwatchViewModelAddAndRemoveJigglePoints(orientation: jiggleViewModel.orientation,
                                                                                  createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchAddAndRemoveJigglePoints,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
