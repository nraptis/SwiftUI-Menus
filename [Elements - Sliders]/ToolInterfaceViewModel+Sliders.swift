//
//  ToolInterfaceViewModel+TextIconSliders.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSliderFlex(orientation: Orientation,
                              configuration: ToolInterfaceElementSliderConfiguration,
                              neighborTypeLeft: ToolInterfaceElementType?,
                              neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let widthCategory = configuration.widthCategory
        
        let minimumWidthLarge = configuration.layoutNameLabelWidthLarge + configuration.valueLabelWidthLarge + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 0
        let standardWidthLarge = configuration.layoutNameLabelWidthLarge + configuration.valueLabelWidthLarge + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 24
        let maximumWidthLarge = configuration.layoutNameLabelWidthLarge + configuration.valueLabelWidthLarge + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 128
        
        let minimumWidthMedium = configuration.layoutNameLabelWidthMedium + configuration.valueLabelWidthMedium + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 0
        let standardWidthMedium = configuration.layoutNameLabelWidthMedium + configuration.valueLabelWidthMedium + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 24
        let maximumWidthMedium = configuration.layoutNameLabelWidthMedium + configuration.valueLabelWidthMedium + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 128
        
        let minimumWidthSmall = configuration.layoutNameLabelWidthSmall + configuration.valueLabelWidthSmall + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 0
        let standardWidthSmall = configuration.layoutNameLabelWidthSmall + configuration.valueLabelWidthSmall + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 24
        let maximumWidthSmall = configuration.layoutNameLabelWidthSmall + configuration.valueLabelWidthSmall + SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch) + 128
        
        let flexSliderData = FlexSliderData(widthCategory: widthCategory,
                                            minimumWidthLarge: minimumWidthLarge,
                                            standardWidthLarge: standardWidthLarge,
                                            maximumWidthLarge: maximumWidthLarge,
                                            minimumWidthMedium: minimumWidthMedium,
                                            standardWidthMedium: standardWidthMedium,
                                            maximumWidthMedium: maximumWidthMedium,
                                            minimumWidthSmall: minimumWidthSmall,
                                            standardWidthSmall: standardWidthSmall,
                                            maximumWidthSmall: maximumWidthSmall)
        
        return ToolInterfaceElementFlex.slider(flexSliderData)
        
    }
}
