//
//  ToolInterfaceFactory+Segment.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getEditModeSegmentToolNode(orientation: Orientation,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        let jigglesTextIconPackable = FramedConvertibleIconLibrary.jiggleA
        let jigglesLine1 = ToolInterfaceStringLibrarySegments.segmentTextEditModeJigglesLine1()
        let jigglesLine2 = ToolInterfaceStringLibrarySegments.segmentTextEditModeJigglesLine2()
        let jigglesConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                          iconPack: jigglesTextIconPackable,
                                                                                          orientation: orientation,
                                                                                          nameLabelLine1: jigglesLine1,
                                                                                          nameLabelLine2: jigglesLine2)
        buttonConfigurations.append(jigglesConfiguration)
        
        let pointsTextIconPackable = FramedConvertibleIconLibrary.pointsA
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
        let viewModelEditMode = MagicalSegmentedPickerViewModelEditMode(orientation: orientation,
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
    
    static func getWeightModeSegmentToolNode(orientation: Orientation,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        let affineTextIconPackable = FramedConvertibleIconLibrary.wolfView
        let affineLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightModeAffineLine1()
        let affineLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightModeAffineLine2()
        let affineConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                         iconPack: affineTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: affineLine1,
                                                                                         nameLabelLine2: affineLine2)
        buttonConfigurations.append(affineConfiguration)
        
        let pointsTextIconPackable = FramedConvertibleIconLibrary.wolfView
        let pointsLine1 = ToolInterfaceStringLibrarySegments.segmentTextWeightModePointsLine1()
        let pointsLine2 = ToolInterfaceStringLibrarySegments.segmentTextWeightModePointsLine2()
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
        let viewModelWeightMode = MagicalSegmentedPickerViewModelWeightMode(orientation: orientation,
                                                                            segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentWeightMode,
                              flex: flex,
                              magicalViewModel: viewModelWeightMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelWeightMode.refresh()
        return result
    }
    
    static func getAnimationModeSegmentToolNode(orientation: Orientation,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let bounceTextIconPackable = FramedConvertibleIconLibrary.jiggleA
        let bounceLine1 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeBounceLine1()
        let bounceLine2 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeBounceLine2()
        let bounceConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                         iconPack: bounceTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: bounceLine1,
                                                                                         nameLabelLine2: bounceLine2)
        buttonConfigurations.append(bounceConfiguration)
        
        let wobbleTextIconPackable = FramedConvertibleIconLibrary.makeGuide
        let wobbleLine1 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeWobbleLine1()
        let wobbleLine2 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeWobbleLine2()
        let wobbleConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                         iconPack: wobbleTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: wobbleLine1,
                                                                                         nameLabelLine2: wobbleLine2)
        buttonConfigurations.append(wobbleConfiguration)
        
        let twistTextIconPackable = FramedConvertibleIconLibrary.drawJiggle
        let twistLine1 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeTwistLine1()
        let twistLine2 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeTwistLine2()
        let twistConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 2,
                                                                                        iconPack: twistTextIconPackable,
                                                                                        orientation: orientation,
                                                                                        nameLabelLine1: twistLine1,
                                                                                        nameLabelLine2: twistLine2)
        buttonConfigurations.append(twistConfiguration)
        
        let configuration = ToolInterfaceElementSegmentedPickerConfiguration(buttonConfigurations: buttonConfigurations)
        
        let flex = Self.getSegmentFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        
        let viewModelAnimationMode = MagicalSegmentedPickerViewModelAnimationMode(orientation: orientation,
                                                                                  segmentedPickerConfiguration: configuration)
        
        let result = ToolNode(id: getToolNodeID(),
                              element: .segmentAnimationMode,
                              flex: flex,
                              magicalViewModel: viewModelAnimationMode,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelAnimationMode.refresh()
        return result
    }
    
}
