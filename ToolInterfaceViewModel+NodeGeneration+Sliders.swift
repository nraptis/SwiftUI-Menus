//
//  ToolInterfaceViewModel+NodeGeneration+Sliders.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func generateNode_Slider(_ inr: INR_Slider.Slider_Data,
                                        neighborTypeLeft: ToolInterfaceElementType?,
                                        neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr.slider {
        case .jiggleOpacity:
            return ToolInterfaceFactory.getJiggleOpacitySliderToolNode(orientation: orientation,
                                                                       widthCategory: inr.widthCategory,
                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                       neighborTypeRight: neighborTypeRight)
        case .jigglePower:
            return ToolInterfaceFactory.getJigglePowerSliderToolNode(orientation: orientation,
                                                                     widthCategory: inr.widthCategory,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        case .jiggleSpeed:
            return ToolInterfaceFactory.getJiggleSpeedSliderToolNode(orientation: orientation,
                                                                     widthCategory: inr.widthCategory,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        case .jiggleDampen:
            return ToolInterfaceFactory.getJiggleDampenSliderToolNode(orientation: orientation,
                                                                      widthCategory: inr.widthCategory,
                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                      neighborTypeRight: neighborTypeRight)
        case .zoomAmount:
            return ToolInterfaceFactory.getZoomAmountSliderToolNode(orientation: orientation,
                                                                    widthCategory: inr.widthCategory,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        case .timeLineDuration:
            return ToolInterfaceFactory.getTimeLineDurationSliderToolNode(orientation: orientation,
                                                                          widthCategory: inr.widthCategory,
                                                                          neighborTypeLeft: neighborTypeLeft,
                                                                          neighborTypeRight: neighborTypeRight)
        case .timeLineOffset:
            return ToolInterfaceFactory.getTimeLineOffsetSliderToolNode(orientation: orientation,
                                                                        widthCategory: inr.widthCategory,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        }
    }
}
