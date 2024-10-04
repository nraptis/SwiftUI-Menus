//
//  ToolInterfaceViewModel+AnimationMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 5/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
   @MainActor func getAnimationModeSegmentToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        var buttonConfigurations = [ToolInterfaceElementSegmentedPickerButtonConfiguration]()
        
        
        let bounceTextIconPackable = FramedConvertibleIconLibrary.jiggles
        let bounceLine1 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeBounceLine1()
        let bounceLine2 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeBounceLine2()
        let bounceConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 0,
                                                                                         iconPack: bounceTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: bounceLine1,
                                                                                         nameLabelLine2: bounceLine2)
        buttonConfigurations.append(bounceConfiguration)
        
        let wobbleTextIconPackable = FramedConvertibleIconLibrary.jiggles
        let wobbleLine1 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeWobbleLine1()
        let wobbleLine2 = ToolInterfaceStringLibrarySegments.segmentTextAnimationModeWobbleLine2()
        let wobbleConfiguration = ToolInterfaceElementSegmentedPickerButtonConfiguration(id: 1,
                                                                                         iconPack: wobbleTextIconPackable,
                                                                                         orientation: orientation,
                                                                                         nameLabelLine1: wobbleLine1,
                                                                                         nameLabelLine2: wobbleLine2)
        buttonConfigurations.append(wobbleConfiguration)
        
        let twistTextIconPackable = FramedConvertibleIconLibrary.jiggles
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
        
        let viewModelAnimationMode = MagicalSegmentedPickerViewModelAnimationMode(orientation: jiggleViewModel.orientation,
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
