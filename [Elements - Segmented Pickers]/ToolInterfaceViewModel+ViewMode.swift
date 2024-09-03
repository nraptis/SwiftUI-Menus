//
//  ToolInterfaceViewModel+ViewMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/11/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    func getViewModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let bounceTextIconPackable = CheckBoxIconLibrary.removePoints
        let standardLine1 = ToolInterfaceStringLibrarySegments.segmentTextViewModeStandardLine1()
        let standardLine2 = ToolInterfaceStringLibrarySegments.segmentTextViewModeStandardLine2()
        let standardConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                           iconPack: bounceTextIconPackable,
                                                                                           orientation: orientation,
                                                                                           nameLabelLine1: standardLine1,
                                                                                           nameLabelLine2: standardLine2)
        buttonConfigurations.append(standardConfiguration)
        
        let wobbleTextIconPackable = CheckBoxIconLibrary.removePoints
        let loopsLine1 = ToolInterfaceStringLibrarySegments.segmentTextViewModeLoopsLine1()
        let loopsLine2 = ToolInterfaceStringLibrarySegments.segmentTextViewModeLoopsLine2()
        let loopsConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                        iconPack: wobbleTextIconPackable,
                                                                                        orientation: orientation,
                                                                                        nameLabelLine1: loopsLine1,
                                                                                        nameLabelLine2: loopsLine2)
        buttonConfigurations.append(loopsConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        
        let viewModelViewMode = MagicalSegmentedPickerViewModelViewMode(orientation: jiggleViewModel.orientation,
                                                                        segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentViewMode,
                              flex: flex,
                              magicalViewModel: viewModelViewMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelViewMode.refresh()
        return result
    }
}
