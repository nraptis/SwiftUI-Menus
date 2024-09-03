//
//  ToolInterfaceViewModel+MakeAndDrawJiggle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getMakeAndDrawJiggleCreateSwatchToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementCreateSwatchButtonConfiguration]()
        
        
        
        
        
        
        let makeJiggleTextIconPack = MainTabIconLibrary.makeJiggle
        let makeJiggleLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeJiggleLine1()
        let makeJiggleLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextMakeJiggleLine2()
        let makeJiggleConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 0,
                                                                               iconPack: makeJiggleTextIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: makeJiggleLine1,
                                                                               nameLabelLine2: makeJiggleLine2)
        buttonConfigurations.append(makeJiggleConfiguration)
        
        let drawJiggleIconPack = MainTabIconLibrary.drawJiggle
        let drawJiggleLine1 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawJiggleLine1()
        let drawJiggleLine2 = ToolInterfaceStringLibraryCreateSwatches.swatchTextDrawJiggleLine2()
        let drawJiggleConfiguration = ToolInterfaceElementCreateSwatchButtonConfiguration(id: 1,
                                                                               iconPack: drawJiggleIconPack,
                                                                               orientation: orientation,
                                                                               nameLabelLine1: drawJiggleLine1,
                                                                               nameLabelLine2: drawJiggleLine2)
        buttonConfigurations.append(drawJiggleConfiguration)
        
        let configuration = ToolInterfaceElementCreateSwatchConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getCreateSwatchFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelDocumentMode = MagicalCreateSwatchViewModelMakeAndDrawJiggle(orientation: jiggleViewModel.orientation,
                                                                                  createSwatchConfiguration: configuration)
        
        
        
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .createSwatchMakeAndDrawJiggle,
                              flex: flex,
                              magicalViewModel: viewModelDocumentMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelDocumentMode.refresh()
        return result
    }
}
