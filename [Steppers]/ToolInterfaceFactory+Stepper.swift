//
//  ToolInterfaceFactory+Stepper.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getTimelinePointCountStepperToolNode(orientation: Orientation,
                                                     neighborTypeLeft: ToolInterfaceElementType?,
                                                     neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySteppers.swatchTextTimelinePointCountLine1()
        let textLine2 = ToolInterfaceStringLibrarySteppers.swatchTextTimelinePointCountLine2()
        let iconPack = FramedConvertibleIconLibrary.menuC
        let decrementPack = FramedLongIconLibrary.lock
        let incrementPack = FramedLongIconLibrary.testArrowRight
        let configuration = ToolInterfaceElementStepperConfiguration(iconPack: iconPack,
                                                                     incrementPack: incrementPack,
                                                                     decrementPack: decrementPack,
                                                                     orientation: orientation,
                                                                     nameLabelLine1: textLine1,
                                                                     nameLabelLine2: textLine2,
                                                                     minimumValue: TimeLine.minimumPointsPerChannel,
                                                                     maximumValue: TimeLine.maximumPointsPerChannel)
        
        let flex = Self.getStepperFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        
        let viewModelTimelinePointCount = MagicalStepperViewModelTimelinePointCount(orientation: orientation,
                                                                                    stepperConfiguration: configuration)
        
        let timelinePointCountToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .stepperTimelinePointCount,
                                                  flex: flex,
                                                  magicalViewModel: viewModelTimelinePointCount,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelTimelinePointCount.refresh()
        return timelinePointCountToolNode
    }
    
    static func getCoinCountStepperToolNode(orientation: Orientation,
                                            neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = "Coin Count"
        let textLine2: String? = nil
        let iconPack = FramedConvertibleIconLibrary.menuC
        let decrementPack = FramedLongIconLibrary.lock
        let incrementPack = FramedLongIconLibrary.testArrowRight
        let configuration = ToolInterfaceElementStepperConfiguration(iconPack: iconPack,
                                                                     incrementPack: incrementPack,
                                                                     decrementPack: decrementPack,
                                                                     orientation: orientation,
                                                                     nameLabelLine1: textLine1,
                                                                     nameLabelLine2: textLine2,
                                                                     minimumValue: 0,
                                                                     maximumValue: 100)
        
        let flex = Self.getStepperFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        
        let viewModelCoinCount = MagicalStepperViewModelCoinCount(orientation: orientation,
                                                                  stepperConfiguration: configuration)
        
        let timelinePointCountToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .stepperCoinCount,
                                                  flex: flex,
                                                  magicalViewModel: viewModelCoinCount,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelCoinCount.refresh()
        return timelinePointCountToolNode
    }
    
    static func getGemCountStepperToolNode(orientation: Orientation,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = "GEM"
        let textLine2 = "COUNT"
        let iconPack = FramedConvertibleIconLibrary.menuC
        let decrementPack = FramedLongIconLibrary.lock
        let incrementPack = FramedLongIconLibrary.testArrowRight
        let configuration = ToolInterfaceElementStepperConfiguration(iconPack: iconPack,
                                                                     incrementPack: incrementPack,
                                                                     decrementPack: decrementPack,
                                                                     orientation: orientation,
                                                                     nameLabelLine1: textLine1,
                                                                     nameLabelLine2: textLine2,
                                                                     minimumValue: 0,
                                                                     maximumValue: 10000)
        
        let flex = Self.getStepperFlex(orientation: orientation,
                                       configuration: configuration,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight)
        
        let viewModelGemCount = MagicalStepperViewModelGemCount(orientation: orientation,
                                                                stepperConfiguration: configuration)
        
        let timelinePointCountToolNode = ToolNode(id: getToolNodeID(),
                                                  element: .stepperGemCount,
                                                  flex: flex,
                                                  magicalViewModel: viewModelGemCount,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        viewModelGemCount.refresh()
        return timelinePointCountToolNode
    }
}
