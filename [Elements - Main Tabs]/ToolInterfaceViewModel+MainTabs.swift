//
//  ToolInterfaceViewModel+MainTabs.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//


import Foundation

extension ToolInterfaceViewModel {
    
    static func getMainTabFlex(orientation: Orientation,
                               configuration: ToolInterfaceElementMainTabConfiguration,
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
                                              scheme: MainTabLayout.self,
                                              neighborTypeLeft: neighborTypeLeft,
                                              neighborTypeRight: neighborTypeRight,
                                              attemptEqualWidthsForAllButtons: true,
                                              infoList: infoList)
        return .mainTab(flexLongData)
    }
}
