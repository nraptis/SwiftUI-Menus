//
//  ToolInterfaceViewModel+CheckBoxes.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    @MainActor static func getCheckBoxFlex(orientation: Orientation,
                                configuration: ToolInterfaceElementCheckBoxConfiguration,
                                neighborTypeLeft: ToolInterfaceElementType?,
                                neighborTypeRight: ToolInterfaceElementType?) -> ToolInterfaceElementFlex {
        
        let iconPack = configuration.iconPack
        
        var minimumWidthLong = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLong,
                                                                                               nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                               iconPack: iconPack,
                                                                                               orientation: orientation,
                                                                                               flavor: .long,
                                                                                               squeeze: .squeezed,
                                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                                               neighborTypeRight: neighborTypeRight)
        
        var standardWidthLong = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthLong,
                                                                                                nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                iconPack: iconPack,
                                                                                                orientation: orientation,
                                                                                                flavor: .long,
                                                                                                squeeze: .standard,
                                                                                                neighborTypeLeft: neighborTypeLeft,
                                                                                                neighborTypeRight: neighborTypeRight)
        var minimumWidthStackedLarge = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedLarge,
                                                                                                       nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                       iconPack: iconPack,
                                                                                                       orientation: orientation,
                                                                                                       flavor: .stackedLarge,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        var standardWidthStackedLarge = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedLarge,
                                                                                                        nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                        iconPack: iconPack,
                                                                                                        orientation: orientation,
                                                                                                        flavor: .stackedLarge,
                                                                                                        squeeze: .standard,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        
        var minimumWidthStackedMedium = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedMedium,
                                                                                                        nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                        iconPack: iconPack,
                                                                                                        orientation: orientation,
                                                                                                        flavor: .stackedMedium,
                                                                                                        squeeze: .squeezed,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        var standardWidthStackedMedium = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedMedium,
                                                                                                         nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                         iconPack: iconPack,
                                                                                                         orientation: orientation,
                                                                                                         flavor: .stackedMedium,
                                                                                                         squeeze: .standard,
                                                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                                                         neighborTypeRight: neighborTypeRight)
        
        var minimumWidthStackedSmall = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedSmall,
                                                                                                       nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                       iconPack: iconPack,
                                                                                                       orientation: orientation,
                                                                                                       flavor: .stackedSmall,
                                                                                                       squeeze: .squeezed,
                                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                                       neighborTypeRight: neighborTypeRight)
        var standardWidthStackedSmall = OLDOLDCheckBoxLayout.getTextIconAndNameLabelWidthWithUniversalPadding(nameLabelWidth: configuration.nameLabelWidthStackedSmall,
                                                                                                        nameLabelNumberOfLines: configuration.nameLabelNumberOfLines,
                                                                                                        iconPack: iconPack,
                                                                                                        orientation: orientation,
                                                                                                        flavor: .stackedSmall,
                                                                                                        squeeze: .standard,
                                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                                        neighborTypeRight: neighborTypeRight)
        
        let checkBoxPaddingLeftLongSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .squeezed)
        let checkBoxPaddingLeftLongStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                    flavor: .long,
                                                                                    squeeze: .standard)
        
        let checkBoxPaddingRightLongSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .squeezed)
        let checkBoxPaddingRightLongStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                      flavor: .long,
                                                                                      squeeze: .standard)
        
        let checkBoxPaddingLeftStackedLargeSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedLarge,
                                                                                            squeeze: .squeezed)
        let checkBoxPaddingLeftStackedLargeStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedLarge,
                                                                                            squeeze: .standard)
        
        let checkBoxPaddingRightStackedLargeSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedLarge,
                                                                                              squeeze: .squeezed)
        let checkBoxPaddingRightStackedLargeStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedLarge,
                                                                                              squeeze: .standard)
        
        let checkBoxPaddingLeftStackedMediumSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedMedium,
                                                                                             squeeze: .squeezed)
        let checkBoxPaddingLeftStackedMediumStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                             flavor: .stackedMedium,
                                                                                             squeeze: .standard)
        
        let checkBoxPaddingRightStackedMediumSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedMedium,
                                                                                               squeeze: .squeezed)
        let checkBoxPaddingRightStackedMediumStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                               flavor: .stackedMedium,
                                                                                               squeeze: .standard)
        
        let checkBoxPaddingLeftStackedSmallSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedSmall,
                                                                                            squeeze: .squeezed)
        let checkBoxPaddingLeftStackedSmallStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingLeft(orientation: orientation,
                                                                                            flavor: .stackedSmall,
                                                                                            squeeze: .standard)
        
        let checkBoxPaddingRightStackedSmallSqueezed = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedSmall,
                                                                                              squeeze: .squeezed)
        let checkBoxPaddingRightStackedSmallStandard = OLDOLDCheckBoxLayout.getCheckBoxPaddingRight(orientation: orientation,
                                                                                              flavor: .stackedSmall,
                                                                                              squeeze: .standard)
        
        minimumWidthLong += checkBoxPaddingLeftLongSqueezed
        minimumWidthLong += checkBoxPaddingRightLongSqueezed
        standardWidthLong += checkBoxPaddingLeftLongStandard
        standardWidthLong += checkBoxPaddingRightLongStandard
        
        minimumWidthStackedLarge += checkBoxPaddingLeftStackedLargeSqueezed
        minimumWidthStackedLarge += checkBoxPaddingRightStackedLargeSqueezed
        standardWidthStackedLarge += checkBoxPaddingLeftStackedLargeStandard
        standardWidthStackedLarge += checkBoxPaddingRightStackedLargeStandard
        
        minimumWidthStackedMedium += checkBoxPaddingLeftStackedMediumSqueezed
        minimumWidthStackedMedium += checkBoxPaddingRightStackedMediumSqueezed
        standardWidthStackedMedium += checkBoxPaddingLeftStackedMediumStandard
        standardWidthStackedMedium += checkBoxPaddingRightStackedMediumStandard
        
        minimumWidthStackedSmall += checkBoxPaddingLeftStackedSmallSqueezed
        minimumWidthStackedSmall += checkBoxPaddingRightStackedSmallSqueezed
        standardWidthStackedSmall += checkBoxPaddingLeftStackedSmallStandard
        standardWidthStackedSmall += checkBoxPaddingRightStackedSmallStandard
        
        let checkBoxWidthLongSqueezed = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                        flavor: .long,
                                                                        squeeze: .squeezed)
        let checkBoxWidthLongStandard = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                        flavor: .long,
                                                                        squeeze: .standard)
        
        let checkBoxWidthStackedLargeSqueezed = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedLarge,
                                                                                squeeze: .squeezed)
        let checkBoxWidthStackedLargeStandard = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedLarge,
                                                                                squeeze: .standard)
        
        let checkBoxWidthStackedMediumSqueezed = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                 flavor: .stackedMedium,
                                                                                 squeeze: .squeezed)
        let checkBoxWidthStackedMediumStandard = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                 flavor: .stackedMedium,
                                                                                 squeeze: .standard)
        
        let checkBoxWidthStackedSmallSqueezed = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedSmall,
                                                                                squeeze: .squeezed)
        let checkBoxWidthStackedSmallStandard = OLDOLDCheckBoxLayout.getCheckBoxWidth(orientation: orientation,
                                                                                flavor: .stackedSmall,
                                                                                squeeze: .standard)
        
        minimumWidthLong += checkBoxWidthLongSqueezed
        standardWidthLong += checkBoxWidthLongStandard
        
        minimumWidthStackedLarge += checkBoxWidthStackedLargeSqueezed
        standardWidthStackedLarge += checkBoxWidthStackedLargeStandard
        
        minimumWidthStackedMedium += checkBoxWidthStackedMediumSqueezed
        standardWidthStackedMedium += checkBoxWidthStackedMediumStandard
        
        minimumWidthStackedSmall += checkBoxWidthStackedSmallSqueezed
        standardWidthStackedSmall += checkBoxWidthStackedSmallStandard
        
        let flexCheckBoxData = FlexCheckBoxData(minimumWidthLong: minimumWidthLong,
                                                standardWidthLong: standardWidthLong,
                                                relaxedWidthLong: standardWidthLong,
                                                minimumWidthStackedLarge: minimumWidthStackedLarge,
                                                standardWidthStackedLarge: standardWidthStackedLarge,
                                                relaxedWidthStackedLarge: standardWidthStackedLarge,
                                                minimumWidthStackedMedium: minimumWidthStackedMedium,
                                                standardWidthStackedMedium: standardWidthStackedMedium,
                                                relaxedWidthStackedMedium: standardWidthStackedMedium,
                                                minimumWidthStackedSmall: minimumWidthStackedSmall,
                                                standardWidthStackedSmall: standardWidthStackedSmall,
                                                relaxedWidthStackedSmall: standardWidthStackedSmall)
        
        return ToolInterfaceElementFlex.checkBox(flexCheckBoxData)
    }
}
