//
//  ToolInterfaceViewModel+SexyCoinCount.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/7/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getCoinCountSexyStepperToolNode(neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let orientation = jiggleViewModel.orientation
        let textLine1 = "Coin Count"
        let textLine2: String? = nil
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
                                                                         maximumValue: 100)
        
        let flex = Self.getSexyStepperFlex(orientation: orientation,
                                           configuration: configuration,
                                           neighborTypeLeft: neighborTypeLeft,
                                           neighborTypeRight: neighborTypeRight)
        
        let viewModelCoinCount = MagicalSexyStepperViewModelCoinCount(orientation: orientation,
                                                                      sexyStepperConfiguration: configuration)
        
        let timelinePointCountToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .sexyStepperCoinCount,
                                                  flex: flex,
                                                  magicalViewModel: viewModelCoinCount,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelCoinCount.refresh()
        return timelinePointCountToolNode
    }
    
}
