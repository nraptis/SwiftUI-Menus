//
//  ToolInterfaceFactory+Stepper.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/20/24.
//

import Foundation

extension ToolInterfaceFactory {
    
    static func getJiggleOpacitySliderToolNode(orientation: Orientation,
                                               widthCategory: ToolInterfaceElementSliderWidthCategory,
                                               neighborTypeLeft: ToolInterfaceElementType?,
                                               neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextJiggleOpacityLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextJiggleOpacityLine2()
        
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
                                                                    minimumValue: ApplicationController.jiggleOpacityMin,
                                                                    maximumValue: ApplicationController.jiggleOpacityMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJiggleOpacity = MagicalSliderViewModelJiggleOpacity(orientation: orientation,
                                                                         sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderJiggleOpacity,
                              flex: flex,
                              magicalViewModel: viewModelJiggleOpacity,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelJiggleOpacity.refresh()
        return result
    }
    
    static func getJigglePowerSliderToolNode(orientation: Orientation,
                                             widthCategory: ToolInterfaceElementSliderWidthCategory,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextJigglePowerLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextJigglePowerLine2()
        
        let friendLabel1Line1: String?
        let friendLabel1Line2: String?
        if orientation.isLandscape || Device.isPad {
            friendLabel1Line1 = ToolInterfaceStringLibrarySliders.sliderTextJiggleSpeedLine1()
            friendLabel1Line2 = ToolInterfaceStringLibrarySliders.sliderTextJiggleSpeedLine2()
        } else {
            friendLabel1Line1 = nil
            friendLabel1Line2 = nil
        }
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: friendLabel1Line1,
                                                                    friend_1_nameLabelLine2: friendLabel1Line2,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: Jiggle.jigglePowerAmountMin,
                                                                    maximumValue: Jiggle.jigglePowerAmountMax,
                                                                    valueWholeNumberCount: 2,
                                                                    valueDecimalCount: 3,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJigglePower = MagicalSliderViewModelJigglePower(orientation: orientation,
                                                                     sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderJigglePower,
                              flex: flex,
                              magicalViewModel: viewModelJigglePower,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelJigglePower.refresh()
        return result
    }
    
    static func getJiggleSpeedSliderToolNode(orientation: Orientation,
                                             widthCategory: ToolInterfaceElementSliderWidthCategory,
                                             neighborTypeLeft: ToolInterfaceElementType?,
                                             neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextJiggleSpeedLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextJiggleSpeedLine2()
        
        let friendLabel1Line1: String?
        let friendLabel1Line2: String?
        if orientation.isLandscape || Device.isPad {
            friendLabel1Line1 = ToolInterfaceStringLibrarySliders.sliderTextJigglePowerLine1()
            friendLabel1Line2 = ToolInterfaceStringLibrarySliders.sliderTextJigglePowerLine2()
        } else {
            friendLabel1Line1 = nil
            friendLabel1Line2 = nil
        }
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: friendLabel1Line1,
                                                                    friend_1_nameLabelLine2: friendLabel1Line2,
                                                                    friend_2_nameLabelLine1: nil,
                                                                    friend_2_nameLabelLine2: nil,
                                                                    friend_3_nameLabelLine1: nil,
                                                                    friend_3_nameLabelLine2: nil,
                                                                    friend_4_nameLabelLine1: nil,
                                                                    friend_4_nameLabelLine2: nil,
                                                                    minimumValue: Jiggle.jiggleSpeedAmountMin,
                                                                    maximumValue: Jiggle.jiggleSpeedAmountMax,
                                                                    valueWholeNumberCount: 2,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJiggleSpeed = MagicalSliderViewModelJiggleSpeed(orientation: orientation,
                                                                     sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderJiggleSpeed,
                              flex: flex,
                              magicalViewModel: viewModelJiggleSpeed,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelJiggleSpeed.refresh()
        return result
    }
    
    static func getJiggleDampenSliderToolNode(orientation: Orientation,
                                              widthCategory: ToolInterfaceElementSliderWidthCategory,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextJiggleDampenLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextJiggleDampenLine2()
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
                                                                    minimumValue: Jiggle.jiggleDampenAmountMin,
                                                                    maximumValue: Jiggle.jiggleDampenAmountMax,
                                                                    valueWholeNumberCount: 2,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJiggleDampen = MagicalSliderViewModelJiggleDampen(orientation: orientation,
                                                                       sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderJiggleDampen,
                              flex: flex,
                              magicalViewModel: viewModelJiggleDampen,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelJiggleDampen.refresh()
        return result
    }
    
    static func getZoomAmountSliderToolNode(orientation: Orientation,
                                            widthCategory: ToolInterfaceElementSliderWidthCategory,
                                            neighborTypeLeft: ToolInterfaceElementType?,
                                            neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextZoomAmountLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextZoomAmountLine2()
        
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
                                                                    minimumValue: Jiggle.bouncePowerMin,
                                                                    maximumValue: Jiggle.bouncePowerMax,
                                                                    valueWholeNumberCount: 2,
                                                                    valueDecimalCount: 3,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelZoomAmount = MagicalSliderViewModelZoomAmount(orientation: orientation,
                                                                   sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderZoomAmount,
                              flex: flex,
                              magicalViewModel: viewModelZoomAmount,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelZoomAmount.refresh()
        return result
    }
    
    static func getTimeLineDurationSliderToolNode(orientation: Orientation,
                                                  widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                  neighborTypeLeft: ToolInterfaceElementType?,
                                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextTimeLineDurationLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextTimeLineDurationLine2()
        
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
                                                                    minimumValue: TimeLine.minAnimationDuration,
                                                                    maximumValue: TimeLine.maxAnimationDuration,
                                                                    valueWholeNumberCount: 1,
                                                                    valueDecimalCount: 2,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelTimeLineDuration = MagicalSliderViewModelTimeLineDuration(orientation: orientation,
                                                                               sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderTimeLineDuration,
                              flex: flex,
                              magicalViewModel: viewModelTimeLineDuration,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelTimeLineDuration.refresh()
        return result
    }
    
    static func getTimeLineOffsetSliderToolNode(orientation: Orientation,
                                                widthCategory: ToolInterfaceElementSliderWidthCategory,
                                                neighborTypeLeft: ToolInterfaceElementType?,
                                                neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextTimeLineOffsetLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextTimeLineOffsetLine2()
        
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
                                                                    minimumValue: 0.0,
                                                                    maximumValue: 1.0,
                                                                    valueWholeNumberCount: 1,
                                                                    valueDecimalCount: 2,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelTimeLineOffset = MagicalSliderViewModelTimeLineOffset(orientation: orientation,
                                                                           sliderConfiguration: configuration)
        let result = ToolNode(id: getToolNodeID(),
                              element: .sliderTimeLineOffset,
                              flex: flex,
                              magicalViewModel: viewModelTimeLineOffset,
                              neighborTypeLeft: neighborTypeLeft,
                              neighborTypeRight: neighborTypeRight)
        viewModelTimeLineOffset.refresh()
        return result
    }
}
