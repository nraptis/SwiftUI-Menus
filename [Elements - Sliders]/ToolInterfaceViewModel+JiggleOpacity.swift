//
//  ToolInterfaceViewModel+JiggleOpacity.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/21/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getJiggleOpacitySliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextJiggleOpacityLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextJiggleOpacityLine2()
        
        var friendLabel1Line1: String?; var friendLabel1Line2: String?
        var friendLabel2Line1: String?; var friendLabel2Line2: String?
        var friendLabel3Line1: String?; var friendLabel3Line2: String?
        var friendLabel4Line1: String?; var friendLabel4Line2: String?
        
        let configuration = ToolInterfaceElementSliderConfiguration(orientation: orientation,
                                                                    nameLabelLine1: textLine1,
                                                                    nameLabelLine2: textLine2,
                                                                    friend_1_nameLabelLine1: friendLabel1Line1,
                                                                    friend_1_nameLabelLine2: friendLabel1Line2,
                                                                    friend_2_nameLabelLine1: friendLabel2Line1,
                                                                    friend_2_nameLabelLine2: friendLabel2Line2,
                                                                    friend_3_nameLabelLine1: friendLabel3Line1,
                                                                    friend_3_nameLabelLine2: friendLabel3Line2,
                                                                    friend_4_nameLabelLine1: friendLabel4Line1,
                                                                    friend_4_nameLabelLine2: friendLabel4Line2,
                                                                    minimumValue: ApplicationController.jiggleOpacityMin,
                                                                    maximumValue: ApplicationController.jiggleOpacityMax,
                                                                    valueWholeNumberCount: 3,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJiggleOpacity = MagicalSliderViewModelJiggleOpacity(orientation: jiggleViewModel.orientation,
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
}
