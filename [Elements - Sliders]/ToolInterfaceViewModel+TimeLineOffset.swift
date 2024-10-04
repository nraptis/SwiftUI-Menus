//
//  ToolInterfaceViewModel+TimeLineOffset.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getTimeLineOffsetSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
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
        let viewModelTimeLineOffset = MagicalSliderViewModelTimeLineOffset(orientation: jiggleViewModel.orientation,
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
