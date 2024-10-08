//
//  ToolInterfaceViewModel+ConvertibleFlexData.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getFullSpaceHeroLong(heroWidth: Int,
                                     orientation: Orientation,
                                     squeeze: LayoutSchemeSqueeze,
                                     scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getHeroPaddingLeftLong(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getHeroPaddingRightLong(orientation: orientation, squeeze: squeeze)
        return heroWidth + paddingLeft + paddingRight
    }
    
    static func getFullSpaceHeroStacked(heroWidth: Int,
                                        orientation: Orientation,
                                        squeeze: LayoutSchemeSqueeze,
                                        scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getHeroPaddingLeftStacked(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getHeroPaddingRightStacked(orientation: orientation, squeeze: squeeze)
        return heroWidth + paddingLeft + paddingRight
    }
    
    
    static func getFullSpaceValue(valueLabelWidth: Int,
                                  orientation: Orientation,
                                  squeeze: LayoutSchemeSqueeze,
                                  scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getValuePaddingLeft(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getValuePaddingRight(orientation: orientation, squeeze: squeeze)
        return valueLabelWidth + paddingLeft + paddingRight
    }
    
    static func getFullSpaceSlave(slaveWidth: Int,
                                  orientation: Orientation,
                                  squeeze: LayoutSchemeSqueeze,
                                  scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getSlavePaddingLeft(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getSlavePaddingRight(orientation: orientation, squeeze: squeeze)
        return slaveWidth + paddingLeft + paddingRight
    }
    
    static func getFullSpaceAccent(accentWidth: Int,
                                   orientation: Orientation,
                                   squeeze: LayoutSchemeSqueeze,
                                   scheme: LayoutScheme.Type) -> Int {
            let paddingLeft = scheme.getAccentPaddingLeft(orientation: orientation, squeeze: squeeze)
            let paddingRight = scheme.getAccentPaddingRight(orientation: orientation, squeeze: squeeze)
            return accentWidth + paddingLeft + paddingRight
        }
    
    static func getFullSpaceOutsideBoxLong(orientation: Orientation,
                                           squeeze: LayoutSchemeSqueeze,
                                           scheme: LayoutScheme.Type,
                                           neighborTypeLeft: ToolInterfaceElementType?,
                                           neighborTypeRight: ToolInterfaceElementType?) -> Int {
        let paddingLeft = scheme.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                              squeeze: squeeze,
                                                              neighborTypeLeft: neighborTypeLeft,
                                                              neighborTypeRight: neighborTypeRight)
        let paddingRight = scheme.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                squeeze: squeeze,
                                                                neighborTypeLeft: neighborTypeLeft,
                                                                neighborTypeRight: neighborTypeRight)
        return paddingLeft + paddingRight
    }
    
    static func getFullSpaceOutsideBoxStacked(orientation: Orientation,
                                              squeeze: LayoutSchemeSqueeze,
                                              scheme: LayoutScheme.Type,
                                              neighborTypeLeft: ToolInterfaceElementType?,
                                              neighborTypeRight: ToolInterfaceElementType?) -> Int {
        let paddingLeft = scheme.getOutsideBoxPaddingLeftStacked(orientation: orientation,
                                                                 squeeze: squeeze,
                                                                 neighborTypeLeft: neighborTypeLeft,
                                                                 neighborTypeRight: neighborTypeRight)
        let paddingRight = scheme.getOutsideBoxPaddingRightStacked(orientation: orientation,
                                                                   squeeze: squeeze,
                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                   neighborTypeRight: neighborTypeRight)
        return paddingLeft + paddingRight
    }
    
    static func getHeroWidthLong(orientation: Orientation,
                                 nameLabelWidth: Int,
                                 iconPack: (any TextIconPackable)?) -> Int {
        if let iconPack {
            let icon = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .long,
                                            numberOfLines: 0,
                                            isDarkMode: false,
                                            isEnabled: true)
            return nameLabelWidth + icon.width
        } else {
            return 0
        }
    }
    
    static func getHeroWidthStacked(orientation: Orientation,
                                         nameLabelWidth: Int,
                                         numberOfLines: Int,
                                         iconPack: (any TextIconPackable)?) -> Int {
        if let iconPack {
            let icon = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .stackedLarge,
                                            numberOfLines: numberOfLines,
                                            isDarkMode: false,
                                            isEnabled: true)
            return max(nameLabelWidth, icon.width)
        } else {
            return 0
        }
    }
    
    static func getSlaveWidth(orientation: Orientation,
                              iconPack: (any TextIconPackable)?) -> Int {
        if let iconPack {
            let icon = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .long,
                                            numberOfLines: 0,
                                            isDarkMode: false,
                                            isEnabled: true)
            return icon.width
        } else {
            return 0
        }
    }
    
    static func getAccentWidth(orientation: Orientation,
                              iconPack: (any TextIconPackable)?) -> Int {
        if let iconPack {
            let icon = iconPack.getTextIcon(orientation: orientation,
                                            layoutSchemeFlavor: .long,
                                            numberOfLines: 0,
                                            isDarkMode: false,
                                            isEnabled: true)
            return icon.width
        } else {
            return 0
        }
    }
    
    static func getConvertibleFlex(orientation: Orientation,
                                   scheme: LayoutScheme.Type,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?,
                                   iconPackMain: (any TextIconPackable),
                                   iconPackSecondary: (any TextIconPackable)?,
                                   iconPackTertiary: (any TextIconPackable)?,
                                   nameLabelWidthLong: Int,
                                   nameLabelWidthStackedLarge: Int,
                                   nameLabelWidthStackedMedium: Int,
                                   nameLabelWidthStackedSmall: Int,
                                   numberOfLines: Int,
                                   valueLabelWidthLarge: Int,
                                   valueLabelWidthMedium: Int,
                                   valueLabelWidthSmall: Int,
                                   extraWidthSqueezed: Int,
                                   extraWidthStandard: Int,
                                   extraWidthRelaxed: Int) -> FlexConvertibleData {
        
        let fullSpaceOutsideBoxLongSqueezed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                         squeeze: .squeezed,
                                                                         scheme: scheme,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxLongStandard = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                         squeeze: .standard,
                                                                         scheme: scheme,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxLongRelaxed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                        squeeze: .relaxed,
                                                                        scheme: scheme,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        
        let fullSpaceOutsideBoxStackedSqueezed = getFullSpaceOutsideBoxStacked(orientation: orientation,
                                                                               squeeze: .squeezed,
                                                                               scheme: scheme,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxStackedStandard = getFullSpaceOutsideBoxStacked(orientation: orientation,
                                                                               squeeze: .standard,
                                                                               scheme: scheme,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxStackedRelaxed = getFullSpaceOutsideBoxStacked(orientation: orientation,
                                                                              squeeze: .relaxed,
                                                                              scheme: scheme,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        
        let heroWidthLong = getHeroWidthLong(orientation: orientation,
                                             nameLabelWidth: nameLabelWidthLong,
                                             iconPack: iconPackMain)
        let heroWidthStackedLarge = getHeroWidthStacked(orientation: orientation,
                                                             nameLabelWidth: nameLabelWidthStackedLarge,
                                                             numberOfLines: numberOfLines,
                                                             iconPack: iconPackMain)
        let heroWidthStackedMedium = getHeroWidthStacked(orientation: orientation,
                                                               nameLabelWidth: nameLabelWidthStackedMedium,
                                                               numberOfLines: numberOfLines,
                                                               iconPack: iconPackMain)
        let heroWidthStackedSmall = getHeroWidthStacked(orientation: orientation,
                                                             nameLabelWidth: nameLabelWidthStackedSmall,
                                                             numberOfLines: numberOfLines,
                                                             iconPack: iconPackMain)
        
        let fullSpaceHeroLongSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthLong, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroLongStandard = getFullSpaceHeroLong(heroWidth: heroWidthLong, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroLongRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthLong, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let fullSpaceHeroStackedLargeSqueezed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedLarge, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroStackedLargeStandard = getFullSpaceHeroStacked(heroWidth: heroWidthStackedLarge, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroStackedLargeRelaxed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedLarge, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let fullSpaceHeroStackedMediumSqueezed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedMedium, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroStackedMediumStandard = getFullSpaceHeroStacked(heroWidth: heroWidthStackedMedium, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroStackedMediumRelaxed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedMedium, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let fullSpaceHeroStackedSmallSqueezed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedSmall, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroStackedSmallStandard = getFullSpaceHeroStacked(heroWidth: heroWidthStackedSmall, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroStackedSmallRelaxed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedSmall, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        
        let fullSpaceValueLargeSqueezed = getFullSpaceValue(valueLabelWidth: valueLabelWidthLarge, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceValueLargeStandard = getFullSpaceValue(valueLabelWidth: valueLabelWidthLarge, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceValueLargeRelaxed = getFullSpaceValue(valueLabelWidth: valueLabelWidthLarge, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        
        let fullSpaceValueMediumSqueezed = getFullSpaceValue(valueLabelWidth: valueLabelWidthMedium, orientation: orientation, squeeze: .squeezed, scheme: scheme)
                let fullSpaceValueMediumStandard = getFullSpaceValue(valueLabelWidth: valueLabelWidthMedium, orientation: orientation, squeeze: .standard, scheme: scheme)
                let fullSpaceValueMediumRelaxed = getFullSpaceValue(valueLabelWidth: valueLabelWidthMedium, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        
        let fullSpaceValueSmallSqueezed = getFullSpaceValue(valueLabelWidth: valueLabelWidthSmall, orientation: orientation, squeeze: .squeezed, scheme: scheme)
                let fullSpaceValueSmallStandard = getFullSpaceValue(valueLabelWidth: valueLabelWidthSmall, orientation: orientation, squeeze: .standard, scheme: scheme)
                let fullSpaceValueSmallRelaxed = getFullSpaceValue(valueLabelWidth: valueLabelWidthSmall, orientation: orientation, squeeze: .relaxed, scheme: scheme)

        let slaveWidth = getSlaveWidth(orientation: orientation,
                                       iconPack: iconPackSecondary)

        let fullSpaceSlaveSqueezed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceSlaveStandard = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceSlaveRelaxed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let accentWidth = getAccentWidth(orientation: orientation,
                                       iconPack: iconPackTertiary)

        let fullSpaceAccentSqueezed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceAccentStandard = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceAccentRelaxed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let squeezedWidthLong = fullSpaceOutsideBoxLongSqueezed + fullSpaceHeroLongSqueezed + fullSpaceValueLargeSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
        let squeezedWidthStackedLarge = fullSpaceOutsideBoxStackedSqueezed + fullSpaceHeroStackedLargeSqueezed + fullSpaceValueLargeSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
        let squeezedWidthStackedMedium = fullSpaceOutsideBoxStackedSqueezed + fullSpaceHeroStackedMediumSqueezed + fullSpaceValueMediumSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
        let squeezedWidthStackedSmall = fullSpaceOutsideBoxStackedSqueezed + fullSpaceHeroStackedSmallSqueezed + fullSpaceValueSmallSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
        
        let standardWidthLong = fullSpaceOutsideBoxLongStandard + fullSpaceHeroLongStandard + fullSpaceValueLargeStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
        let standardWidthStackedLarge = fullSpaceOutsideBoxStackedStandard + fullSpaceHeroStackedLargeStandard + fullSpaceValueLargeStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
        let standardWidthStackedMedium = fullSpaceOutsideBoxStackedStandard + fullSpaceHeroStackedMediumStandard + fullSpaceValueMediumStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
        let standardWidthStackedSmall = fullSpaceOutsideBoxStackedStandard + fullSpaceHeroStackedSmallStandard + fullSpaceValueSmallStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
        
        let relaxedWidthLong = fullSpaceOutsideBoxLongRelaxed + fullSpaceHeroLongRelaxed + fullSpaceValueLargeRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
        let relaxedWidthStackedLarge = fullSpaceOutsideBoxStackedRelaxed + fullSpaceHeroStackedLargeRelaxed + fullSpaceValueLargeRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
        let relaxedWidthStackedMedium = fullSpaceOutsideBoxStackedRelaxed + fullSpaceHeroStackedMediumRelaxed + fullSpaceValueMediumRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
        let relaxedWidthStackedSmall = fullSpaceOutsideBoxStackedRelaxed + fullSpaceHeroStackedSmallRelaxed + fullSpaceValueSmallRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
        
        return FlexConvertibleData(squeezedWidthLong: squeezedWidthLong + extraWidthSqueezed,
                                   standardWidthLong: standardWidthLong + extraWidthStandard,
                                   relaxedWidthLong: relaxedWidthLong + extraWidthRelaxed,
                                   squeezedWidthStackedLarge: squeezedWidthStackedLarge + extraWidthSqueezed,
                                   standardWidthStackedLarge: standardWidthStackedLarge + extraWidthStandard,
                                   relaxedWidthStackedLarge: relaxedWidthStackedLarge + extraWidthRelaxed,
                                   squeezedWidthStackedMedium: squeezedWidthStackedMedium + extraWidthSqueezed,
                                   standardWidthStackedMedium: standardWidthStackedMedium + extraWidthStandard,
                                   relaxedWidthStackedMedium: relaxedWidthStackedMedium + extraWidthRelaxed,
                                   squeezedWidthStackedSmall: squeezedWidthStackedSmall + extraWidthSqueezed,
                                   standardWidthStackedSmall: standardWidthStackedSmall + extraWidthStandard,
                                   relaxedWidthStackedSmall: relaxedWidthStackedSmall + extraWidthRelaxed)
    
    }
    
    static func getLongFlex(orientation: Orientation,
                            scheme: LayoutScheme.Type,
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?,
                            iconPackMain: (any TextIconPackable),
                            iconPackSecondary: (any TextIconPackable)?,
                            iconPackTertiary: (any TextIconPackable)?,
                            nameLabelWidthLarge: Int,
                            nameLabelWidthMedium: Int,
                            nameLabelWidthSmall: Int,
                            numberOfLines: Int,
                            valueLabelWidthLarge: Int,
                            valueLabelWidthMedium: Int,
                            valueLabelWidthSmall: Int,
                            extraWidthSqueezed: Int,
                            extraWidthStandard: Int,
                            extraWidthRelaxed: Int) -> FlexLongData {
        
        let fullSpaceOutsideBoxSqueezed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                     squeeze: .squeezed,
                                                                     scheme: scheme,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxStandard = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                     squeeze: .standard,
                                                                     scheme: scheme,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxRelaxed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                    squeeze: .relaxed,
                                                                    scheme: scheme,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        
        
        let heroWidthLarge = getHeroWidthLong(orientation: orientation,
                                              nameLabelWidth: nameLabelWidthLarge,
                                              iconPack: iconPackMain)
        let heroWidthMedium = getHeroWidthLong(orientation: orientation,
                                               nameLabelWidth: nameLabelWidthMedium,
                                               iconPack: iconPackMain)
        let heroWidthSmall = getHeroWidthLong(orientation: orientation,
                                              nameLabelWidth: nameLabelWidthSmall,
                                              iconPack: iconPackMain)
        
        let fullSpaceHeroLargeSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthLarge, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroLargeStandard = getFullSpaceHeroLong(heroWidth: heroWidthLarge, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroLargeRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthLarge, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let fullSpaceHeroMediumSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthMedium, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroMediumStandard = getFullSpaceHeroLong(heroWidth: heroWidthMedium, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroMediumRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthMedium, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let fullSpaceHeroSmallSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthSmall, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceHeroSmallStandard = getFullSpaceHeroLong(heroWidth: heroWidthSmall, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceHeroSmallRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthSmall, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let slaveWidth = getSlaveWidth(orientation: orientation,
                                       iconPack: iconPackSecondary)

        let fullSpaceSlaveSqueezed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceSlaveStandard = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceSlaveRelaxed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let accentWidth = getAccentWidth(orientation: orientation,
                                       iconPack: iconPackTertiary)

        let fullSpaceAccentSqueezed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceAccentStandard = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceAccentRelaxed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        
        let squeezedWidthLarge = fullSpaceOutsideBoxSqueezed + fullSpaceHeroLargeSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
        
        let standardWidthLarge = fullSpaceOutsideBoxStandard + fullSpaceHeroLargeStandard + fullSpaceSlaveStandard + fullSpaceAccentSqueezed
        
        let relaxedWidthLarge = fullSpaceOutsideBoxRelaxed + fullSpaceHeroLargeRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentSqueezed
        
        
        let squeezedWidthMedium = fullSpaceOutsideBoxSqueezed + fullSpaceHeroMediumSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentStandard
        
        let standardWidthMedium = fullSpaceOutsideBoxStandard + fullSpaceHeroMediumStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
        
        let relaxedWidthMedium = fullSpaceOutsideBoxRelaxed + fullSpaceHeroMediumRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentStandard
        
        
        let squeezedWidthSmall = fullSpaceOutsideBoxSqueezed + fullSpaceHeroSmallSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentRelaxed
        
        let standardWidthSmall = fullSpaceOutsideBoxStandard + fullSpaceHeroSmallStandard + fullSpaceSlaveStandard + fullSpaceAccentRelaxed
        
        let relaxedWidthSmall = fullSpaceOutsideBoxRelaxed + fullSpaceHeroSmallRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
        
        return FlexLongData(squeezedWidthLarge: squeezedWidthLarge + extraWidthSqueezed,
                            standardWidthLarge: standardWidthLarge + extraWidthStandard,
                            relaxedWidthLarge: relaxedWidthLarge + extraWidthRelaxed,
                            squeezedWidthMedium: squeezedWidthMedium + extraWidthSqueezed,
                            standardWidthMedium: standardWidthMedium + extraWidthStandard,
                            relaxedWidthMedium: relaxedWidthMedium + extraWidthRelaxed,
                            squeezedWidthSmall: squeezedWidthSmall + extraWidthSqueezed,
                            standardWidthSmall: standardWidthSmall + extraWidthStandard,
                            relaxedWidthSmall: relaxedWidthSmall + extraWidthRelaxed)
    }
    
    static func getConvertibleSegmentFlex(orientation: Orientation,
                                          scheme: LayoutScheme.Type,
                                          neighborTypeLeft: ToolInterfaceElementType?,
                                          neighborTypeRight: ToolInterfaceElementType?,
                                          attemptEqualWidthsForAllButtons: Bool,
                                          infoList: [SEGMENT_FLEX_INFO_CONVERTIBLE]) -> FlexConvertibleData {
        
        let fullSpaceOutsideBoxLongSqueezed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                         squeeze: .squeezed,
                                                                         scheme: scheme,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxLongStandard = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                         squeeze: .standard,
                                                                         scheme: scheme,
                                                                         neighborTypeLeft: neighborTypeLeft,
                                                                         neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxLongRelaxed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                        squeeze: .relaxed,
                                                                        scheme: scheme,
                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                        neighborTypeRight: neighborTypeRight)
        
        let fullSpaceOutsideBoxStackedSqueezed = getFullSpaceOutsideBoxStacked(orientation: orientation,
                                                                               squeeze: .squeezed,
                                                                               scheme: scheme,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxStackedStandard = getFullSpaceOutsideBoxStacked(orientation: orientation,
                                                                               squeeze: .standard,
                                                                               scheme: scheme,
                                                                               neighborTypeLeft: neighborTypeLeft,
                                                                               neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxStackedRelaxed = getFullSpaceOutsideBoxStacked(orientation: orientation,
                                                                              squeeze: .relaxed,
                                                                              scheme: scheme,
                                                                              neighborTypeLeft: neighborTypeLeft,
                                                                              neighborTypeRight: neighborTypeRight)
        
        var infoWidthListLongSqueezed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedLargeSqueezed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedMediumSqueezed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedSmallSqueezed = [Int](repeating: 0, count: infoList.count)
        
        var infoWidthListLongStandard = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedLargeStandard = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedMediumStandard = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedSmallStandard = [Int](repeating: 0, count: infoList.count)
        
        var infoWidthListLongRelaxed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedLargeRelaxed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedMediumRelaxed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListStackedSmallRelaxed = [Int](repeating: 0, count: infoList.count)
        
        for infoIndex in infoList.indices {
            let info = infoList[infoIndex]
            
            let heroWidthLong = getHeroWidthLong(orientation: orientation,
                                                 nameLabelWidth: info.nameLabelWidthLong,
                                                 iconPack: info.iconPackMain)
            let heroWidthStackedLarge = getHeroWidthStacked(orientation: orientation,
                                                                 nameLabelWidth: info.nameLabelWidthStackedLarge,
                                                                 numberOfLines: info.numberOfLines,
                                                                 iconPack: info.iconPackMain)
            let heroWidthStackedMedium = getHeroWidthStacked(orientation: orientation,
                                                                   nameLabelWidth: info.nameLabelWidthStackedMedium,
                                                                   numberOfLines: info.numberOfLines,
                                                                   iconPack: info.iconPackMain)
            let heroWidthStackedSmall = getHeroWidthStacked(orientation: orientation,
                                                                 nameLabelWidth: info.nameLabelWidthStackedSmall,
                                                                 numberOfLines: info.numberOfLines,
                                                                 iconPack: info.iconPackMain) + 10 // TODO: Don't forget this
            
            let fullSpaceHeroLongSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthLong, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroLongStandard = getFullSpaceHeroLong(heroWidth: heroWidthLong, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroLongRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthLong, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let fullSpaceHeroStackedLargeSqueezed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedLarge, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroStackedLargeStandard = getFullSpaceHeroStacked(heroWidth: heroWidthStackedLarge, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroStackedLargeRelaxed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedLarge, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let fullSpaceHeroStackedMediumSqueezed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedMedium, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroStackedMediumStandard = getFullSpaceHeroStacked(heroWidth: heroWidthStackedMedium, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroStackedMediumRelaxed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedMedium, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let fullSpaceHeroStackedSmallSqueezed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedSmall, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroStackedSmallStandard = getFullSpaceHeroStacked(heroWidth: heroWidthStackedSmall, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroStackedSmallRelaxed = getFullSpaceHeroStacked(heroWidth: heroWidthStackedSmall, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let slaveWidth = getSlaveWidth(orientation: orientation,
                                           iconPack: info.iconPackSecondary)

            let fullSpaceSlaveSqueezed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceSlaveStandard = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceSlaveRelaxed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            
            let accentWidth = getAccentWidth(orientation: orientation,
                                           iconPack: info.iconPackTertiary)

            let fullSpaceAccentSqueezed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceAccentStandard = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceAccentRelaxed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            infoWidthListLongSqueezed[infoIndex] = fullSpaceHeroLongSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            infoWidthListStackedLargeSqueezed[infoIndex] = fullSpaceHeroStackedLargeSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            infoWidthListStackedMediumSqueezed[infoIndex] = fullSpaceHeroStackedMediumSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            infoWidthListStackedSmallSqueezed[infoIndex] = fullSpaceHeroStackedSmallSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            
            infoWidthListLongStandard[infoIndex] = fullSpaceHeroLongStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            infoWidthListStackedLargeStandard[infoIndex] = fullSpaceHeroStackedLargeStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            infoWidthListStackedMediumStandard[infoIndex] = fullSpaceHeroStackedMediumStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            infoWidthListStackedSmallStandard[infoIndex] = fullSpaceHeroStackedSmallStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            
            infoWidthListLongRelaxed[infoIndex] = fullSpaceHeroLongRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
            infoWidthListStackedLargeRelaxed[infoIndex] = fullSpaceHeroStackedLargeRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
            infoWidthListStackedMediumRelaxed[infoIndex] = fullSpaceHeroStackedMediumRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
            infoWidthListStackedSmallRelaxed[infoIndex] = fullSpaceHeroStackedSmallRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
            
        }
        
        var totalSqueezedWidthLong = fullSpaceOutsideBoxLongSqueezed
        var totalSqueezedWidthStackedLarge = fullSpaceOutsideBoxStackedSqueezed
        var totalSqueezedWidthStackedMedium = fullSpaceOutsideBoxStackedSqueezed
        var totalSqueezedWidthStackedSmall = fullSpaceOutsideBoxStackedSqueezed
        
        var totalStandardWidthLong = fullSpaceOutsideBoxLongStandard
        var totalStandardWidthStackedLarge = fullSpaceOutsideBoxStackedStandard
        var totalStandardWidthStackedMedium = fullSpaceOutsideBoxStackedStandard
        var totalStandardWidthStackedSmall = fullSpaceOutsideBoxStackedStandard
        
        var totalRelaxedWidthLong = fullSpaceOutsideBoxLongRelaxed
        var totalRelaxedWidthStackedLarge = fullSpaceOutsideBoxStackedRelaxed
        var totalRelaxedWidthStackedMedium = fullSpaceOutsideBoxStackedRelaxed
        var totalRelaxedWidthStackedSmall = fullSpaceOutsideBoxStackedRelaxed
        
        if attemptEqualWidthsForAllButtons {
            
            var largestRelaxedWidthLong = 0
            var largestRelaxedWidthStackedLarge = 0
            var largestRelaxedWidthStackedMedium = 0
            var largestRelaxedWidthStackedSmall = 0
            
            for infoIndex in infoList.indices {
                largestRelaxedWidthLong = max(infoWidthListLongRelaxed[infoIndex], largestRelaxedWidthLong)
                largestRelaxedWidthStackedLarge = max(infoWidthListStackedLargeRelaxed[infoIndex], largestRelaxedWidthStackedLarge)
                largestRelaxedWidthStackedMedium = max(infoWidthListStackedMediumRelaxed[infoIndex], largestRelaxedWidthStackedMedium)
                largestRelaxedWidthStackedSmall = max(infoWidthListStackedSmallRelaxed[infoIndex], largestRelaxedWidthStackedSmall)
                
            }
            
            for infoIndex in infoList.indices {
                totalSqueezedWidthLong += infoWidthListLongSqueezed[infoIndex]
                totalSqueezedWidthStackedLarge += infoWidthListStackedLargeSqueezed[infoIndex]
                totalSqueezedWidthStackedMedium += infoWidthListStackedMediumSqueezed[infoIndex]
                totalSqueezedWidthStackedSmall += infoWidthListStackedSmallSqueezed[infoIndex]
                
                totalStandardWidthLong += infoWidthListLongStandard[infoIndex]
                totalStandardWidthStackedLarge += infoWidthListStackedLargeStandard[infoIndex]
                totalStandardWidthStackedMedium += infoWidthListStackedMediumStandard[infoIndex]
                totalStandardWidthStackedSmall += infoWidthListStackedSmallStandard[infoIndex]
                
                totalRelaxedWidthLong += largestRelaxedWidthLong
                totalRelaxedWidthStackedLarge += largestRelaxedWidthStackedLarge
                totalRelaxedWidthStackedMedium += largestRelaxedWidthStackedMedium
                totalRelaxedWidthStackedSmall += largestRelaxedWidthStackedSmall
            }
            
        } else {
            for infoIndex in infoList.indices {
                totalSqueezedWidthLong += infoWidthListLongSqueezed[infoIndex]
                totalSqueezedWidthStackedLarge += infoWidthListStackedLargeSqueezed[infoIndex]
                totalSqueezedWidthStackedMedium += infoWidthListStackedMediumSqueezed[infoIndex]
                totalSqueezedWidthStackedSmall += infoWidthListStackedSmallSqueezed[infoIndex]
                
                totalStandardWidthLong += infoWidthListLongStandard[infoIndex]
                totalStandardWidthStackedLarge += infoWidthListStackedLargeStandard[infoIndex]
                totalStandardWidthStackedMedium += infoWidthListStackedMediumStandard[infoIndex]
                totalStandardWidthStackedSmall += infoWidthListStackedSmallStandard[infoIndex]
                
                totalRelaxedWidthLong += infoWidthListLongRelaxed[infoIndex]
                totalRelaxedWidthStackedLarge += infoWidthListStackedLargeRelaxed[infoIndex]
                totalRelaxedWidthStackedMedium += infoWidthListStackedMediumRelaxed[infoIndex]
                totalRelaxedWidthStackedSmall += infoWidthListStackedSmallRelaxed[infoIndex]
            }
        }
        
        return FlexConvertibleData(squeezedWidthLong: totalSqueezedWidthLong,
                                   standardWidthLong: totalStandardWidthLong,
                                   relaxedWidthLong: totalRelaxedWidthLong,
                                   squeezedWidthStackedLarge: totalSqueezedWidthStackedLarge,
                                   standardWidthStackedLarge: totalStandardWidthStackedLarge,
                                   relaxedWidthStackedLarge: totalRelaxedWidthStackedLarge,
                                   squeezedWidthStackedMedium: totalSqueezedWidthStackedMedium,
                                   standardWidthStackedMedium: totalStandardWidthStackedMedium,
                                   relaxedWidthStackedMedium: totalRelaxedWidthStackedMedium,
                                   squeezedWidthStackedSmall: totalSqueezedWidthStackedSmall,
                                   standardWidthStackedSmall: totalStandardWidthStackedSmall,
                                   relaxedWidthStackedSmall: totalRelaxedWidthStackedSmall)
    }
    
    static func getLongSegmentFlex(orientation: Orientation,
                                   scheme: LayoutScheme.Type,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?,
                                   attemptEqualWidthsForAllButtons: Bool,
                                   infoList: [SEGMENT_FLEX_INFO_LONG]) -> FlexLongData {
        
        let fullSpaceOutsideBoxSqueezed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                     squeeze: .squeezed,
                                                                     scheme: scheme,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxStandard = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                     squeeze: .standard,
                                                                     scheme: scheme,
                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                     neighborTypeRight: neighborTypeRight)
        let fullSpaceOutsideBoxRelaxed = getFullSpaceOutsideBoxLong(orientation: orientation,
                                                                    squeeze: .relaxed,
                                                                    scheme: scheme,
                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                    neighborTypeRight: neighborTypeRight)
        
        var infoWidthListLargeSqueezed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListMediumSqueezed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListSmallSqueezed = [Int](repeating: 0, count: infoList.count)
        
        var infoWidthListLargeStandard = [Int](repeating: 0, count: infoList.count)
        var infoWidthListMediumStandard = [Int](repeating: 0, count: infoList.count)
        var infoWidthListSmallStandard = [Int](repeating: 0, count: infoList.count)
        
        var infoWidthListLargeRelaxed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListMediumRelaxed = [Int](repeating: 0, count: infoList.count)
        var infoWidthListSmallRelaxed = [Int](repeating: 0, count: infoList.count)
        
        for infoIndex in infoList.indices {
            let info = infoList[infoIndex]
            
            let heroWidthLarge = getHeroWidthLong(orientation: orientation,
                                                  nameLabelWidth: info.nameLabelWidthLarge,
                                                  iconPack: info.iconPackMain)
            let heroWidthMedium = getHeroWidthLong(orientation: orientation,
                                                   nameLabelWidth: info.nameLabelWidthMedium,
                                                   iconPack: info.iconPackMain)
            let heroWidthSmall = getHeroWidthLong(orientation: orientation,
                                                  nameLabelWidth: info.nameLabelWidthSmall,
                                                  iconPack: info.iconPackMain)
            
            let fullSpaceHeroLargeSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthLarge, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroLargeStandard = getFullSpaceHeroLong(heroWidth: heroWidthLarge, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroLargeRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthLarge, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let fullSpaceHeroMediumSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthMedium, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroMediumStandard = getFullSpaceHeroLong(heroWidth: heroWidthMedium, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroMediumRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthMedium, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let fullSpaceHeroSmallSqueezed = getFullSpaceHeroLong(heroWidth: heroWidthSmall, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceHeroSmallStandard = getFullSpaceHeroLong(heroWidth: heroWidthSmall, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceHeroSmallRelaxed = getFullSpaceHeroLong(heroWidth: heroWidthSmall, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let slaveWidth = getSlaveWidth(orientation: orientation,
                                           iconPack: info.iconPackSecondary)

            let fullSpaceSlaveSqueezed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceSlaveStandard = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceSlaveRelaxed = getFullSpaceSlave(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let accentWidth = getAccentWidth(orientation: orientation,
                                           iconPack: info.iconPackTertiary)

            let fullSpaceAccentSqueezed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceAccentStandard = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceAccentRelaxed = getFullSpaceAccent(accentWidth: accentWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            infoWidthListLargeSqueezed[infoIndex] = fullSpaceHeroLargeSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            infoWidthListMediumSqueezed[infoIndex] = fullSpaceHeroMediumSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            infoWidthListSmallSqueezed[infoIndex] = fullSpaceHeroSmallSqueezed + fullSpaceSlaveSqueezed + fullSpaceAccentSqueezed
            
            infoWidthListLargeStandard[infoIndex] = fullSpaceHeroLargeStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            infoWidthListMediumStandard[infoIndex] = fullSpaceHeroMediumStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            infoWidthListSmallStandard[infoIndex] = fullSpaceHeroSmallStandard + fullSpaceSlaveStandard + fullSpaceAccentStandard
            
            infoWidthListLargeRelaxed[infoIndex] = fullSpaceHeroLargeRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
            infoWidthListMediumRelaxed[infoIndex] = fullSpaceHeroMediumRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
            infoWidthListSmallRelaxed[infoIndex] = fullSpaceHeroSmallRelaxed + fullSpaceSlaveRelaxed + fullSpaceAccentRelaxed
        }
        
        var totalSqueezedWidthLarge = fullSpaceOutsideBoxSqueezed
        var totalSqueezedWidthMedium = fullSpaceOutsideBoxSqueezed
        var totalSqueezedWidthSmall = fullSpaceOutsideBoxSqueezed
        
        var totalStandardWidthLarge = fullSpaceOutsideBoxStandard
        var totalStandardWidthMedium = fullSpaceOutsideBoxStandard
        var totalStandardWidthSmall = fullSpaceOutsideBoxStandard
        
        var totalRelaxedWidthLarge = fullSpaceOutsideBoxRelaxed
        var totalRelaxedWidthMedium = fullSpaceOutsideBoxRelaxed
        var totalRelaxedWidthSmall = fullSpaceOutsideBoxRelaxed
        
        if attemptEqualWidthsForAllButtons {
            
            var largestRelaxedWidthLarge = 0
            var largestRelaxedWidthMedium = 0
            var largestRelaxedWidthSmall = 0
            
            for infoIndex in infoList.indices {
                largestRelaxedWidthLarge = max(infoWidthListLargeRelaxed[infoIndex], largestRelaxedWidthLarge)
                largestRelaxedWidthMedium = max(infoWidthListMediumRelaxed[infoIndex], largestRelaxedWidthMedium)
                largestRelaxedWidthSmall = max(infoWidthListSmallRelaxed[infoIndex], largestRelaxedWidthSmall)
            }
            
            for infoIndex in infoList.indices {
                
                totalSqueezedWidthLarge += infoWidthListLargeSqueezed[infoIndex]
                totalSqueezedWidthMedium += infoWidthListMediumSqueezed[infoIndex]
                totalSqueezedWidthSmall += infoWidthListSmallSqueezed[infoIndex]
                
                totalStandardWidthLarge += infoWidthListLargeStandard[infoIndex]
                totalStandardWidthMedium += infoWidthListMediumStandard[infoIndex]
                totalStandardWidthSmall += infoWidthListSmallStandard[infoIndex]
                
                totalRelaxedWidthLarge += largestRelaxedWidthLarge
                totalRelaxedWidthMedium += largestRelaxedWidthMedium
                totalRelaxedWidthSmall += largestRelaxedWidthSmall
            }
            
        } else {
            for infoIndex in infoList.indices {
                totalSqueezedWidthLarge += infoWidthListLargeSqueezed[infoIndex]
                totalSqueezedWidthMedium += infoWidthListMediumSqueezed[infoIndex]
                totalSqueezedWidthSmall += infoWidthListSmallSqueezed[infoIndex]
                
                totalStandardWidthLarge += infoWidthListLargeStandard[infoIndex]
                totalStandardWidthMedium += infoWidthListMediumStandard[infoIndex]
                totalStandardWidthSmall += infoWidthListSmallStandard[infoIndex]
                
                totalRelaxedWidthLarge += infoWidthListLargeRelaxed[infoIndex]
                totalRelaxedWidthMedium += infoWidthListMediumRelaxed[infoIndex]
                totalRelaxedWidthSmall += infoWidthListSmallRelaxed[infoIndex]
            }
        }
        return FlexLongData(squeezedWidthLarge: totalSqueezedWidthLarge,
                            standardWidthLarge: totalStandardWidthLarge,
                            relaxedWidthLarge: totalRelaxedWidthLarge,
                            squeezedWidthMedium: totalSqueezedWidthMedium,
                            standardWidthMedium: totalStandardWidthMedium,
                            relaxedWidthMedium: totalRelaxedWidthMedium,
                            squeezedWidthSmall: totalSqueezedWidthSmall,
                            standardWidthSmall: totalStandardWidthSmall,
                            relaxedWidthSmall: totalRelaxedWidthSmall)
    }
    
}
