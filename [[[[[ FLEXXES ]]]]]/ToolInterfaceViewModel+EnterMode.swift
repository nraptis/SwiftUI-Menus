//
//  ToolInterfaceViewModel+EnterMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getEnterModeFlex(orientation: Orientation,
                                 configuration: ToolInterfaceElementChangeModeConfiguration,
                                 neighborTypeLeft: ToolInterfaceElementType?,
                                 neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: EnterModeLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: configuration.accentPack,
                                                     iconPackTertiary: nil,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: 0,
                                                     valueLabelWidthMedium: 0,
                                                     valueLabelWidthSmall: 0,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.enterMode(flexConvertibleData)
    }
}
