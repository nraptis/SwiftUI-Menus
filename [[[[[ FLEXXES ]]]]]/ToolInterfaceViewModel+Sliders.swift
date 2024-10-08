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
        let extraWidthStandard = SliderLayout.getExtraWidthStandard(orientation: orientation)
        let extraWidthRelaxed = SliderLayout.getExtraWidthRelaxed(orientation: orientation)
        let widthCategory = configuration.widthCategory
        let preferredMinimumBarWidth = SliderLayout.getPreferredMinimumBarWidth(orientation: orientation, widthCategory: .stretch)
        let flexLongData = getLongFlex(orientation: orientation,
                                       scheme: SliderLayout.self,
                                       neighborTypeLeft: neighborTypeLeft,
                                       neighborTypeRight: neighborTypeRight,
                                       iconPackMain: ApplicationController.blankTextIconPack,
                                       iconPackSecondary: nil,
                                       iconPackTertiary: nil,
                                       nameLabelWidthLarge: configuration.layoutNameLabelWidthLarge,
                                       nameLabelWidthMedium: configuration.layoutNameLabelWidthMedium,
                                       nameLabelWidthSmall: configuration.layoutNameLabelWidthSmall,
                                       numberOfLines: configuration.nameLabelNumberOfLines,
                                       valueLabelWidthLarge: configuration.valueLabelWidthLarge,
                                       valueLabelWidthMedium: configuration.valueLabelWidthMedium,
                                       valueLabelWidthSmall: configuration.valueLabelWidthSmall,
                                       extraWidthSqueezed: preferredMinimumBarWidth,
                                       extraWidthStandard: preferredMinimumBarWidth + extraWidthStandard,
                                       extraWidthRelaxed: preferredMinimumBarWidth + extraWidthRelaxed)
        
        return ToolInterfaceElementFlex.slider(flexLongData, widthCategory)
    }
    
}
