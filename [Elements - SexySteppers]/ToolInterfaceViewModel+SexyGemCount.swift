//
//  ToolInterfaceViewModel+SexyGemCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getGemCountSexyStepperToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = "Gem"
        let textLine2 = "Count"
        let iconPack = FramedConvertibleIconLibrary.menuA
        let decrementPack = FramedLongIconLibrary.testArrowLeft
        let incrementPack = FramedLongIconLibrary.testArrowRight
        let configuration = ToolInterfaceElementSexyStepperConfiguration(iconPack: iconPack,
                                                                         incrementPack: incrementPack,
                                                                         decrementPack: decrementPack,
                                                                         orientation: orientation,
                                                                         nameLabelLine1: textLine1,
                                                                         nameLabelLine2: textLine2,
                                                                         minimumValue: 0,
                                                                         maximumValue: 10000)
        
        let flex = Self.getSexyStepperFlex(orientation: orientation,
                                           configuration: configuration,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        
        let viewModelGemCount = MagicalSexyStepperViewModelGemCount(orientation: orientation,
                                                                    sexyStepperConfiguration: configuration)
        
        let timelinePointCountToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .sexyStepperGemCount,
                                                  flex: flex,
                                                  magicalViewModel: viewModelGemCount,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelGemCount.refresh()
        return timelinePointCountToolNode
    }
    
}
