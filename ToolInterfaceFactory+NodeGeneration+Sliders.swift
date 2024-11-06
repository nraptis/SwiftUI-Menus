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
        case .timeLineFrameOffset:
            return getTimeLineFrameOffsetSliderToolNode(orientation: orientation,
                                                   widthCategory: inr.widthCategory,
                                                   neighborTypeLeft: neighborTypeLeft,
                                                   neighborTypeRight: neighborTypeRight)
            
        case .continuousAngle:
            return getContinuousAngleSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousDuration:
            return getContinuousDurationSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousPower:
            return getContinuousPowerSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousSwoop:
            return getContinuousSwoopSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousFrameOffset:
            return getContinuousFrameOffsetSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
            
        case .continuousStartScale:
            return getContinuousStartScaleSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousEndScale:
            return getContinuousEndScaleSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousStartRotation:
            return getContinuousStartRotationSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
        case .continuousEndRotation:
            return getContinuousEndRotationSliderToolNode(orientation: orientation,
                                                    widthCategory: inr.widthCategory,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight)
            
        }
    }
}
