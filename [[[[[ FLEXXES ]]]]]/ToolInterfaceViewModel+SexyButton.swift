//
//  ToolInterfaceViewModel+Button.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getButtonFlex(orientation: Orientation,
                                  configuration: ToolInterfaceElementButtonConfiguration,
                                  neighborTypeLeft: ToolInterfaceElementType?,
                                  neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let iconPackTertiary = ApplicationController.isPurchased ? FramedLongIconLibrary.uncoloredLock : nil
        
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: ButtonLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: nil,
                                                     iconPackTertiary: iconPackTertiary,
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
        return ToolInterfaceElementFlex.button(flexConvertibleData)
    }
}


