//
//  ToolInterfaceFactory+Slider+Continuous.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/30/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getContinuousAngleSliderToolNode(orientation: Orientation,
                                                 widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousAngleLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousAngleLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousAngleMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousAngleMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousAngle = MagicalSliderViewModelContinuousAngle(orientation: orientation,
                                                                             sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousAngle,
                              flex: flex,
                              magicalViewModel: viewModelContinuousAngle,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousAngle.refresh()
        return result
    }
    
    static func getContinuousDurationSliderToolNode(orientation: Orientation,
                                                    widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousDurationLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousDurationLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousDurationMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousDurationMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousDuration = MagicalSliderViewModelContinuousDuration(orientation: orientation,
                                                                                   sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousDuration,
                              flex: flex,
                              magicalViewModel: viewModelContinuousDuration,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousDuration.refresh()
        return result
    }
    
    static func getContinuousPowerSliderToolNode(orientation: Orientation,
                                                 widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousPowerLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousPowerLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousPowerMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousPowerMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousPower = MagicalSliderViewModelContinuousPower(orientation: orientation,
                                                                             sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousPower,
                              flex: flex,
                              magicalViewModel: viewModelContinuousPower,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousPower.refresh()
        return result
    }
    
    static func getContinuousSwoopSliderToolNode(orientation: Orientation,
                                                 widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                 neighborTypeLeft: ToolInterfaceElementType?,
                                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousSwoopLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousSwoopLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousSwoopMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousSwoopMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousSwoop = MagicalSliderViewModelContinuousSwoop(orientation: orientation,
                                                                             sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousSwoop,
                              flex: flex,
                              magicalViewModel: viewModelContinuousSwoop,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousSwoop.refresh()
        return result
    }
    
    static func getContinuousFrameOffsetSliderToolNode(orientation: Orientation,
                                                       widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousFrameOffsetLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousFrameOffsetLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousFrameOffsetMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousFrameOffsetMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousFrameOffset = MagicalSliderViewModelContinuousFrameOffset(orientation: orientation,
                                                                                         sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousFrameOffset,
                              flex: flex,
                              magicalViewModel: viewModelContinuousFrameOffset,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousFrameOffset.refresh()
        return result
    }
    
    static func getContinuousStartScaleSliderToolNode(orientation: Orientation,
                                                      widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                      neighborTypeLeft: ToolInterfaceElementType?,
                                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousStartScaleLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousStartScaleLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousScaleMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousScaleMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousStartScale = MagicalSliderViewModelContinuousStartScale(orientation: orientation,
                                                                                       sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousStartScale,
                              flex: flex,
                              magicalViewModel: viewModelContinuousStartScale,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousStartScale.refresh()
        return result
    }
    
    static func getContinuousEndScaleSliderToolNode(orientation: Orientation,
                                                    widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                    neighborTypeLeft: ToolInterfaceElementType?,
                                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousEndScaleLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousEndScaleLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousScaleMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousScaleMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousEndScale = MagicalSliderViewModelContinuousEndScale(orientation: orientation,
                                                                                   sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousEndScale,
                              flex: flex,
                              magicalViewModel: viewModelContinuousEndScale,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousEndScale.refresh()
        return result
    }
    
    static func getContinuousStartRotationSliderToolNode(orientation: Orientation,
                                                         widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                         neighborTypeLeft: ToolInterfaceElementType?,
                                                         neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousStartRotationLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousStartRotationLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousRotationMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousRotationMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousStartRotation = MagicalSliderViewModelContinuousStartRotation(orientation: orientation,
                                                                                             sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousStartRotation,
                              flex: flex,
                              magicalViewModel: viewModelContinuousStartRotation,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousStartRotation.refresh()
        return result
    }
    
    static func getContinuousEndRotationSliderToolNode(orientation: Orientation,
                                                       widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                       neighborTypeLeft: ToolInterfaceElementType?,
                                                       neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextContinuousEndRotationLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextContinuousEndRotationLine2()
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: nil,
                                                                    friend_1_nameLabelLine2: nil,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: AnimationInstructionContinuous.userContinuousRotationMin,
                                                                    maximumValue: AnimationInstructionContinuous.userContinuousRotationMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelContinuousEndRotation = MagicalSliderViewModelContinuousEndRotation(orientation: orientation,
                                                                                         sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderContinuousEndRotation,
                              flex: flex,
                              magicalViewModel: viewModelContinuousEndRotation,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelContinuousEndRotation.refresh()
        return result
    }
    
}
