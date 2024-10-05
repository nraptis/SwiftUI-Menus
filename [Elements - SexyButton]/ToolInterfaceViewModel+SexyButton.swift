//
//  ToolInterfaceViewModel+SexyButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSexyButtonFlex(orientation: Orientation,
                                  configuration: ToolInterfaceElementButtonConfiguration,
                                  neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                    scheme: ButtonLayout.self,
                                                    neighborTypeLeft: neighborTypeLeft,
                                                    neighborTypeRight: neighborTypeRight,
                                                    iconPackMain: configuration.iconPack,
                                                    iconPackSecondary: nil,
                                                    nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                    nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                    nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                    nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                    numberOfLines: configuration.nameLabelNumberOfLines)
        return ToolInterfaceElementFlex.sexyButton(flexConvertibleData)
    }
}
