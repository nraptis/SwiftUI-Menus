//
//  ToolInterfaceViewModel+SexyCheckBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/25/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getSexyCheckBoxFlex(orientation: Orientation,
                                    configuration: ToolInterfaceElementSexyCheckBoxConfiguration,
                                    neighborTypeLeft: ToolInterfaceElementType?,
                                    neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        let flexConvertibleData = getConvertibleFlex(orientation: orientation,
                                                     scheme: CheckBoxLayout.self,
                                                     neighborTypeLeft: neighborTypeLeft,
                                                     neighborTypeRight: neighborTypeRight,
                                                     iconPackMain: configuration.iconPack,
                                                     iconPackSecondary: FramedLongIconLibrary.checkBoxSquare,
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
        return ToolInterfaceElementFlex.sexyCheckBox(flexConvertibleData)
    }
}
