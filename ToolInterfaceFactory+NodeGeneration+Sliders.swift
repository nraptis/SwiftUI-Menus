//
//  ToolInterfaceViewModel+NodeGeneration+Sliders.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/17/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func generateNode_Slider(orientation: Orientation,
                                    inr: INR_Slider_Data,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        switch inr.slider {
        case .jiggleOpacity:
            return getJiggleOpacitySliderToolNode(orientation: orientation,
                                                  widthCategory: inr.widthCategory,
                                                  neighborTypeLeft: neighborTypeLeft,
                                                  neighborTypeRight: neighborTypeRight)
        case .jigglePower:
            return getJigglePowerSliderToolNode(orientation: orientation,
                                                widthCategory: inr.widthCategory,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        case .jiggleSpeed:
            return getJiggleSpeedSliderToolNode(orientation: orientation,
                                                widthCategory: inr.widthCategory,
                                                neighborTypeLeft: neighborTypeLeft,
                                                neighborTypeRight: neighborTypeRight)
        case .jiggleDampen:
            return getJiggleDampenSliderToolNode(orientation: orientation,
                                                 widthCategory: inr.widthCategory,
                                                 neighborTypeLeft: neighborTypeLeft,
                                                 neighborTypeRight: neighborTypeRight)
        case .zoomAmount:
            return getZoomAmountSliderToolNode(orientation: orientation,
                                               widthCategory: inr.widthCategory,
                                               neighborTypeLeft: neighborTypeLeft,
                                               neighborTypeRight: neighborTypeRight)
        case .timeLineDuration:
            return getTimeLineDurationSliderToolNode(orientation: orientation,
                                                     widthCategory: inr.widthCategory,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight)
        case .timeLineOffset:
            return getTimeLineOffsetSliderToolNode(orientation: orientation,
                                                   widthCategory: inr.widthCategory,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
        }
    }
}
