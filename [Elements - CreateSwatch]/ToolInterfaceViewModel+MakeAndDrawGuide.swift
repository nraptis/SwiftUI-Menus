//
//  ToolInterfaceViewModel+MakeAndDrawGuide.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/5/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getMakeAndDrawGuideCreateSwatchToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
       let makeGuideTextIconPack = FramedLongIconLibrary.menuA
        let makeGuideLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeGuideLine1()
        let makeGuideLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeGuideLine2()
        let makeGuideConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                               iconPack: makeGuideTextIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: makeGuideLine1,
                                                                               nameLabelLine2: makeGuideLine2)
        buttonConfigurations.append(makeGuideConfiguration)
        
        let drawGuideIconPack = FramedLongIconLibrary.menuB
        let drawGuideLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawGuideLine1()
        let drawGuideLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawGuideLine2()
        let drawGuideConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                               iconPack: drawGuideIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: drawGuideLine1,
                                                                               nameLabelLine2: drawGuideLine2)
        buttonConfigurations.append(drawGuideConfiguration)
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalCreateSwatchViewModelMakeAndDrawGuide(orientation: jiggleViewModel.orientation,
                                                                                  createSwatchConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchMakeAndDrawGuide,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
