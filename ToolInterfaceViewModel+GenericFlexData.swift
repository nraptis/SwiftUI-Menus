//
//  ToolInterfaceViewModel+ConvertibleFlexData.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

extension ToolInterfaceViewModel {
    
    static func getFullSpaceHeroLong(heroWidth: Int, orientation: Orientation, squeeze: LayoutSchemeSqueeze, scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getHeroPaddingLeftLong(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getHeroPaddingRightLong(orientation: orientation, squeeze: squeeze)
        return heroWidth + paddingLeft + paddingRight
    }
    
    static func getFullSpaceHeroStacked(heroWidth: Int, orientation: Orientation, squeeze: LayoutSchemeSqueeze, scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getHeroPaddingLeftStacked(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getHeroPaddingRightStacked(orientation: orientation, squeeze: squeeze)
        return heroWidth + paddingLeft + paddingRight
    }
    
    static func getFullSpaceSlaveLong(slaveWidth: Int, orientation: Orientation, squeeze: LayoutSchemeSqueeze, scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getSlavePaddingLeftLong(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getSlavePaddingRightLong(orientation: orientation, squeeze: squeeze)
        return slaveWidth + paddingLeft + paddingRight
    }
    
    static func getFullSpaceSlaveStacked(slaveWidth: Int, orientation: Orientation, squeeze: LayoutSchemeSqueeze, scheme: LayoutScheme.Type) -> Int {
        let paddingLeft = scheme.getSlavePaddingLeftStacked(orientation: orientation, squeeze: squeeze)
        let paddingRight = scheme.getSlavePaddingRightStacked(orientation: orientation, squeeze: squeeze)
        return slaveWidth + paddingLeft + paddingRight
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
    
    static func getConvertibleFlex(orientation: Orientation,
                                   scheme: LayoutScheme.Type,
                                   neighborTypeLeft: ToolInterfaceElementType?,
                                   neighborTypeRight: ToolInterfaceElementType?,
                                   iconPackMain: (any TextIconPackable),
                                   iconPackSecondary: (any TextIconPackable)?,
                                   nameLabelWidthLong: Int,
                                   nameLabelWidthStackedLarge: Int,
                                   nameLabelWidthStackedMedium: Int,
                                   nameLabelWidthStackedSmall: Int,
                                   numberOfLines: Int) -> FlexConvertibleData {
        
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
        
        let slaveWidth = getSlaveWidth(orientation: orientation,
                                       iconPack: iconPackSecondary)
        
        let fullSpaceSlaveLongSqueezed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceSlaveLongStandard = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceSlaveLongRelaxed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let fullSpaceSlaveStackedSqueezed = getFullSpaceSlaveStacked(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceSlaveStackedStandard = getFullSpaceSlaveStacked(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceSlaveStackedRelaxed = getFullSpaceSlaveStacked(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let squeezedWidthLong = fullSpaceOutsideBoxLongSqueezed + fullSpaceHeroLongSqueezed + fullSpaceSlaveLongSqueezed
        let squeezedWidthStackedLarge = fullSpaceOutsideBoxStackedSqueezed + fullSpaceHeroStackedLargeSqueezed + fullSpaceSlaveStackedSqueezed
        let squeezedWidthStackedMedium = fullSpaceOutsideBoxStackedSqueezed + fullSpaceHeroStackedMediumSqueezed + fullSpaceSlaveStackedSqueezed
        let squeezedWidthStackedSmall = fullSpaceOutsideBoxStackedSqueezed + fullSpaceHeroStackedSmallSqueezed + fullSpaceSlaveStackedSqueezed
        
        let standardWidthLong = fullSpaceOutsideBoxLongStandard + fullSpaceHeroLongStandard + fullSpaceSlaveLongStandard
        let standardWidthStackedLarge = fullSpaceOutsideBoxStackedStandard + fullSpaceHeroStackedLargeStandard + fullSpaceSlaveStackedStandard
        let standardWidthStackedMedium = fullSpaceOutsideBoxStackedStandard + fullSpaceHeroStackedMediumStandard + fullSpaceSlaveStackedStandard
        let standardWidthStackedSmall = fullSpaceOutsideBoxStackedStandard + fullSpaceHeroStackedSmallStandard + fullSpaceSlaveStackedStandard
        
        let relaxedWidthLong = fullSpaceOutsideBoxLongRelaxed + fullSpaceHeroLongRelaxed + fullSpaceSlaveLongRelaxed
        let relaxedWidthStackedLarge = fullSpaceOutsideBoxStackedRelaxed + fullSpaceHeroStackedLargeRelaxed + fullSpaceSlaveStackedRelaxed
        let relaxedWidthStackedMedium = fullSpaceOutsideBoxStackedRelaxed + fullSpaceHeroStackedMediumRelaxed + fullSpaceSlaveStackedRelaxed
        let relaxedWidthStackedSmall = fullSpaceOutsideBoxStackedRelaxed + fullSpaceHeroStackedSmallRelaxed + fullSpaceSlaveStackedRelaxed
        
        return FlexConvertibleData(squeezedWidthLong: squeezedWidthLong,
                                   standardWidthLong: standardWidthLong,
                                   relaxedWidthLong: relaxedWidthLong,
                                   squeezedWidthStackedLarge: squeezedWidthStackedLarge,
                                   standardWidthStackedLarge: standardWidthStackedLarge,
                                   relaxedWidthStackedLarge: relaxedWidthStackedLarge,
                                   squeezedWidthStackedMedium: squeezedWidthStackedMedium,
                                   standardWidthStackedMedium: standardWidthStackedMedium,
                                   relaxedWidthStackedMedium: relaxedWidthStackedMedium,
                                   squeezedWidthStackedSmall: squeezedWidthStackedSmall,
                                   standardWidthStackedSmall: standardWidthStackedSmall,
                                   relaxedWidthStackedSmall: relaxedWidthStackedSmall)
    
    }
    
    static func getLongFlex(orientation: Orientation,
                            scheme: LayoutScheme.Type,
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?,
                            iconPackMain: (any TextIconPackable),
                            iconPackSecondary: (any TextIconPackable)?,
                            nameLabelWidthLarge: Int,
                            nameLabelWidthMedium: Int,
                            nameLabelWidthSmall: Int,
                            numberOfLines: Int) -> FlexLongData {
        
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
        
        let fullSpaceSlaveSqueezed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
        let fullSpaceSlaveStandard = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
        let fullSpaceSlaveRelaxed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
        
        let squeezedWidthLarge = fullSpaceOutsideBoxSqueezed + fullSpaceHeroLargeSqueezed + fullSpaceSlaveSqueezed
        
        let standardWidthLarge = fullSpaceOutsideBoxStandard + fullSpaceHeroLargeStandard + fullSpaceSlaveStandard
        
        let relaxedWidthLarge = fullSpaceOutsideBoxRelaxed + fullSpaceHeroLargeRelaxed + fullSpaceSlaveRelaxed
        
        
        let squeezedWidthMedium = fullSpaceOutsideBoxSqueezed + fullSpaceHeroMediumSqueezed + fullSpaceSlaveSqueezed
        
        let standardWidthMedium = fullSpaceOutsideBoxStandard + fullSpaceHeroMediumStandard + fullSpaceSlaveStandard
        
        let relaxedWidthMedium = fullSpaceOutsideBoxRelaxed + fullSpaceHeroMediumRelaxed + fullSpaceSlaveRelaxed
        
        
        let squeezedWidthSmall = fullSpaceOutsideBoxSqueezed + fullSpaceHeroSmallSqueezed + fullSpaceSlaveSqueezed
        
        let standardWidthSmall = fullSpaceOutsideBoxStandard + fullSpaceHeroSmallStandard + fullSpaceSlaveStandard
        
        let relaxedWidthSmall = fullSpaceOutsideBoxRelaxed + fullSpaceHeroSmallRelaxed + fullSpaceSlaveRelaxed
        
        return FlexLongData(squeezedWidthLarge: squeezedWidthLarge,
                            standardWidthLarge: standardWidthLarge,
                            relaxedWidthLarge: relaxedWidthLarge,
                            squeezedWidthMedium: squeezedWidthMedium,
                            standardWidthMedium: standardWidthMedium,
                            relaxedWidthMedium: relaxedWidthMedium,
                            squeezedWidthSmall: squeezedWidthSmall,
                            standardWidthSmall: standardWidthSmall,
                            relaxedWidthSmall: relaxedWidthSmall)
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
            
            let fullSpaceSlaveLongSqueezed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceSlaveLongStandard = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceSlaveLongRelaxed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            let fullSpaceSlaveStackedSqueezed = getFullSpaceSlaveStacked(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceSlaveStackedStandard = getFullSpaceSlaveStacked(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceSlaveStackedRelaxed = getFullSpaceSlaveStacked(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            infoWidthListLongSqueezed[infoIndex] = fullSpaceHeroLongSqueezed + fullSpaceSlaveLongSqueezed
            infoWidthListStackedLargeSqueezed[infoIndex] = fullSpaceHeroStackedLargeSqueezed + fullSpaceSlaveStackedSqueezed
            infoWidthListStackedMediumSqueezed[infoIndex] = fullSpaceHeroStackedMediumSqueezed + fullSpaceSlaveStackedSqueezed
            infoWidthListStackedSmallSqueezed[infoIndex] = fullSpaceHeroStackedSmallSqueezed + fullSpaceSlaveStackedSqueezed
            
            infoWidthListLongStandard[infoIndex] = fullSpaceHeroLongStandard + fullSpaceSlaveLongStandard
            infoWidthListStackedLargeStandard[infoIndex] = fullSpaceHeroStackedLargeStandard + fullSpaceSlaveStackedStandard
            infoWidthListStackedMediumStandard[infoIndex] = fullSpaceHeroStackedMediumStandard + fullSpaceSlaveStackedStandard
            infoWidthListStackedSmallStandard[infoIndex] = fullSpaceHeroStackedSmallStandard + fullSpaceSlaveStackedStandard
            
            infoWidthListLongRelaxed[infoIndex] = fullSpaceHeroLongRelaxed + fullSpaceSlaveLongRelaxed
            infoWidthListStackedLargeRelaxed[infoIndex] = fullSpaceHeroStackedLargeRelaxed + fullSpaceSlaveStackedRelaxed
            infoWidthListStackedMediumRelaxed[infoIndex] = fullSpaceHeroStackedMediumRelaxed + fullSpaceSlaveStackedRelaxed
            infoWidthListStackedSmallRelaxed[infoIndex] = fullSpaceHeroStackedSmallRelaxed + fullSpaceSlaveStackedRelaxed
            
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
            
            let fullSpaceSlaveSqueezed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .squeezed, scheme: scheme)
            let fullSpaceSlaveStandard = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .standard, scheme: scheme)
            let fullSpaceSlaveRelaxed = getFullSpaceSlaveLong(slaveWidth: slaveWidth, orientation: orientation, squeeze: .relaxed, scheme: scheme)
            
            infoWidthListLargeSqueezed[infoIndex] = fullSpaceHeroLargeSqueezed + fullSpaceSlaveSqueezed
            infoWidthListMediumSqueezed[infoIndex] = fullSpaceHeroMediumSqueezed + fullSpaceSlaveSqueezed
            infoWidthListSmallSqueezed[infoIndex] = fullSpaceHeroSmallSqueezed + fullSpaceSlaveSqueezed
            
            infoWidthListLargeStandard[infoIndex] = fullSpaceHeroLargeStandard + fullSpaceSlaveStandard
            infoWidthListMediumStandard[infoIndex] = fullSpaceHeroMediumStandard + fullSpaceSlaveStandard
            infoWidthListSmallStandard[infoIndex] = fullSpaceHeroSmallStandard + fullSpaceSlaveStandard
            
            infoWidthListLargeRelaxed[infoIndex] = fullSpaceHeroLargeRelaxed + fullSpaceSlaveRelaxed
            infoWidthListMediumRelaxed[infoIndex] = fullSpaceHeroMediumRelaxed + fullSpaceSlaveRelaxed
            infoWidthListSmallRelaxed[infoIndex] = fullSpaceHeroSmallRelaxed + fullSpaceSlaveRelaxed
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
