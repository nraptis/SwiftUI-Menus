//
//  ToolInterfaceViewModel+EditMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation
//
//  ToolInterfaceViewModel+EditMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getEditModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()

        let jigglesTextIconPackable = SegmentIconLibrary.modeJiggleEditAffine
        let jigglesLine1 = ToolInterfaceStringLibrarySegments.segmentTextEditModeJigglesLine1()
        let jigglesLine2 = ToolInterfaceStringLibrarySegments.segmentTextEditModeJigglesLine2()
        let jigglesConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                          iconPack: jigglesTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: jigglesLine1,
                                                                                          nameLabelLine2: jigglesLine2)
        buttonConfigurations.append(jigglesConfiguration)
        
        let pointsTextIconPackable = SegmentIconLibrary.modeWeightsEditCenters
        let pointsLine1 = ToolInterfaceStringLibrarySegments.segmentTextEditModePointsLine1()
        let pointsLine2 = ToolInterfaceStringLibrarySegments.segmentTextEditModePointsLine2()
        let pointsConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                         iconPack: pointsTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: pointsLine1,
                                                                                         nameLabelLine2: pointsLine2)
        buttonConfigurations.append(pointsConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        let viewModelEditMode = MagicalSegmentedPickerViewModelEditMode(orientation: jiggleViewModel.orientation,
                                                                                segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentEditMode,
                              flex: flex,
                              magicalViewModel: viewModelEditMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelEditMode.refresh()
        return result
    }
    
    
    
}
