//
//  ToolInterfaceViewModel+SegmentedPickers.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSegmentFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementSegmentedPickerConfiguration,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let infoList = configuration.buttonConfigurations.map {
            SEGMENT_FLEX_INFO_CONVERTIBLE(iconPackMain: $0.iconPack,
                                          iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
                                          iconPackTertiary: FramedLongIconLibrary.testArrowRight,
                                          nameLabelWidthLong: $0.nameLabelWidthLong,
                                          nameLabelWidthStackedLarge: $0.nameLabelWidthStackedLarge,
                                          nameLabelWidthStackedMedium: $0.nameLabelWidthStackedMedium,
                                          nameLabelWidthStackedSmall: $0.nameLabelWidthStackedSmall,
                                          numberOfLines: $0.nameLabelNumberOfLines)
        }
        
        let flexConvertibleData = getConvertibleSegmentFlex(orientation: orientation,
                                                            scheme: SegmentedPickerLayout.self,
                                                            neighborTypeLeft: neighborTypeLeft,
                                                            neighborTypeRight: neighborTypeRight,
                                                            attemptEqualWidthsForAllButtons: true,
                                                            infoList: infoList)
        return .segment(flexConvertibleData)
    }
}
