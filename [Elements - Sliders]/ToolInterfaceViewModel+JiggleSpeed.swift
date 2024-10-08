//
//  ToolInterfaceViewModel+JiggleSpeed.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 6/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor func getJiggleSpeedSliderToolNode(widthCategory: ToolInterfaceElementSliderWidthCategory,
                                      neighborTypeLeft: ToolInterfaceElementType?,
                                      neighborTypeRight: ToolInterfaceElementType?) -> ToolNode {
        let orientation = jiggleViewModel.orientation
        let textLine1 = ToolInterfaceStringLibrarySliders.sliderTextJiggleSpeedLine1()
        let textLine2 = ToolInterfaceStringLibrarySliders.sliderTextJiggleSpeedLine2()
        
        var friendLabel1Line1 = ToolInterfaceStringLibrarySliders.sliderTextJigglePowerLine1()
        var friendLabel1Line2 = ToolInterfaceStringLibrarySliders.sliderTextJigglePowerLine2()
        
        var friendLabel2Line1: String?; var friendLabel2Line2: String?
        var friendLabel3Line1: String?; var friendLabel3Line2: String?
        var friendLabel4Line1: String?; var friendLabel4Line2: String?
        /*
        if widthCategory == .fullWidth {
            friendLabel1Line1 = ToolInterfaceStringLibrarySliders.sliderTextBounceSpeedLine1()
            friendLabel1Line2 = ToolInterfaceStringLibrarySliders.sliderTextBounceSpeedLine2()
        }
        */
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
                                                                    minimumValue: Jiggle.jiggleSpeedAmountMin,
                                                                    maximumValue: Jiggle.jiggleSpeedAmountMax,
                                                                    valueWholeNumberCount: 2,
                                                                    valueDecimalCount: 1,
                                                                    widthCategory: widthCategory)
        
        let flex = Self.getSliderFlex(orientation: orientation,
                                      configuration: configuration,
                                      neighborTypeLeft: neighborTypeLeft,
                                      neighborTypeRight: neighborTypeRight)
        let viewModelJiggleSpeed = MagicalSliderViewModelJiggleSpeed(orientation: jiggleViewModel.orientation,
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
}
