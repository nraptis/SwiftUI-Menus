//
//  ToolInterfaceViewModel+SexyAnim.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getTimelinePointCountSexyStepperToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibrarySteppers.swatchTextTimelinePointCountLine1()
        let textLine2 = ToolInterfaceStringLibrarySteppers.swatchTextTimelinePointCountLine2()
        let iconPack = FramedConvertibleIconLibrary.menuA
        let decrementPack = FramedLongIconLibrary.testArrowLeft
        let incrementPack = FramedLongIconLibrary.testArrowRight
        let configuration = ToolInterfaceElementSexyStepperConfiguration(iconPack: iconPack,
                                                                         incrementPack: incrementPack,
                                                                         decrementPack: decrementPack,
                                                                         orientation: orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2,
                                                                         minimumValue: TimeLine.minimumPointsPerChannel,
                                                                         maximumValue: TimeLine.maximumPointsPerChannel)
        
        let flex = Self.getSexyStepperFlex(orientation: orientation,
                                           configuration: configuration,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        
        let viewModelTimelinePointCount = MagicalSexyStepperViewModelTimelinePointCount(orientation: orientation,
                                                                                        sexyStepperConfiguration: configuration)
        
        let timelinePointCountToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .sexyStepperTimelinePointCount,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimelinePointCount,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimelinePointCount.refresh()
        return timelinePointCountToolNode
    }
    
}
