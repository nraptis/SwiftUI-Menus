//
//  ToolInterfaceViewModel+SexyStepper.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSexyStepperFlex(orientation: Orientation,
                                   configuration: ToolInterfaceElementSexyStepperConfiguration,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: SexyStepperLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: configuration.incrementPack,
                                                     iconPackTertiary: configuration.decrementPack,
                                                     nameLabelWidthLong: configuration.nameLabelWidthLong,
                                                     nameLabelWidthStackedLarge: configuration.nameLabelWidthStackedLarge,
                                                     nameLabelWidthStackedMedium: configuration.nameLabelWidthStackedMedium,
                                                     nameLabelWidthStackedSmall: configuration.nameLabelWidthStackedSmall,
                                                     numberOfLines: configuration.nameLabelNumberOfLines,
                                                     valueLabelWidthLarge: configuration.valueLabelWidthLarge,
                                                     valueLabelWidthMedium: configuration.valueLabelWidthMedium,
                                                     valueLabelWidthSmall: configuration.valueLabelWidthSmall,
                                                     extraWidthSqueezed: 0,
                                                     extraWidthStandard: 0,
                                                     extraWidthRelaxed: 0)
        return ToolInterfaceElementFlex.sexyStepper(flexConvertibleData)
    }
    
}

