//
//  ToolInterfaceViewModel+CreateSwatch.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getCreateSwatchFlex(orientation: Orientation,
                                    configuration: ToolInterfaceElementCreateSwatchConfiguration,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let infoList = configuration.buttonConfigurations.map {
            SEGMENT_FLEX_INFO_LONG(iconPackMain: $0.iconPack,
                                   iconPackSecondary: nil,
                                   nameLabelWidthLarge: $0.nameLabelWidthLarge,
                                   nameLabelWidthMedium: $0.nameLabelWidthMedium,
                                   nameLabelWidthSmall: $0.nameLabelWidthSmall,
                                   numberOfLines: $0.nameLabelNumberOfLines)
        }
        
        let flexLongData = getLongSegmentFlex(orientation: orientation,
                                              scheme: CreateSwatchLayout.self,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight,
                                              attemptEqualWidthsForAllButtons: true,
                                              infoList: infoList)
        return .createSwatch(flexLongData)
    }
}
