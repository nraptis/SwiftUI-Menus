//
//  ToolInterfaceViewModel+AddAndRemoveGuidePoints.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getAddAndRemoveGuidePointsCreateSwatchToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
       let addGuidePointTextIconPack = FramedLongIconLibrary.menuA
        let addGuidePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddGuidePointLine1()
        let addGuidePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextAddGuidePointLine2()
        let addGuidePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                               iconPack: addGuidePointTextIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: addGuidePointLine1,
                                                                               nameLabelLine2: addGuidePointLine2)
        buttonConfigurations.append(addGuidePointConfiguration)
        
        let removeGuidePointIconPack = FramedLongIconLibrary.menuB
        let removeGuidePointLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveGuidePointLine1()
        let removeGuidePointLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextRemoveGuidePointLine2()
        let removeGuidePointConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                               iconPack: removeGuidePointIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: removeGuidePointLine1,
                                                                               nameLabelLine2: removeGuidePointLine2)
        buttonConfigurations.append(removeGuidePointConfiguration)
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalCreateSwatchViewModelAddAndRemoveGuidePoints(orientation: jiggleViewModel.orientation,
                                                                                  createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchAddAndRemoveGuidePoints,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
