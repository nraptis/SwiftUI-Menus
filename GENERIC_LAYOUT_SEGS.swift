//
//  GENERIC_LAYOUT_SEGS.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

struct SEGMENT_FLEX_INFO_CONVERTIBLE {
    
    let iconPackMain: (any TextIconPackable)
    let iconPackSecondary: (any TextIconPackable)?
    let iconPackTertiary: (any TextIconPackable)?
    
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    let numberOfLines: Int
    
    init(iconPackMain: (any TextIconPackable),
         iconPackSecondary: (any TextIconPackable)?,
         iconPackTertiary: (any TextIconPackable)?,
         nameLabelWidthLong: Int,
         nameLabelWidthStackedLarge: Int,
         nameLabelWidthStackedMedium: Int,
         nameLabelWidthStackedSmall: Int,
         numberOfLines: Int) {
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        self.iconPackTertiary = iconPackTertiary
        self.nameLabelWidthLong = nameLabelWidthLong
        self.nameLabelWidthStackedLarge = nameLabelWidthStackedLarge
        self.nameLabelWidthStackedMedium = nameLabelWidthStackedMedium
        self.nameLabelWidthStackedSmall = nameLabelWidthStackedSmall
        self.numberOfLines = numberOfLines
    }
}

struct SEGMENT_FLEX_INFO_LONG {
    let iconPackMain: (any TextIconPackable)
    let iconPackSecondary: (any TextIconPackable)?
    let iconPackTertiary: (any TextIconPackable)?
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    let numberOfLines: Int
    
    init(iconPackMain: (any TextIconPackable),
         iconPackSecondary: (any TextIconPackable)?,
         iconPackTertiary: (any TextIconPackable)?,
         nameLabelWidthLarge: Int,
         nameLabelWidthMedium: Int,
         nameLabelWidthSmall: Int,
         numberOfLines: Int) {
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        self.iconPackTertiary = iconPackTertiary
        self.nameLabelWidthLarge = nameLabelWidthLarge
        self.nameLabelWidthMedium = nameLabelWidthMedium
        self.nameLabelWidthSmall = nameLabelWidthSmall
        self.numberOfLines = numberOfLines
    }
}

struct SEGMENT_LAYOUT_INFO {
    let iconPackMain: (any TextIconPackable)
    let iconPackSecondary: (any TextIconPackable)?
    let iconPackTertiary: (any TextIconPackable)?
    let nameLabelWidth: Int
    let numberOfLines: Int
    init(iconPackMain: (any TextIconPackable),
         iconPackSecondary: (any TextIconPackable)?,
         iconPackTertiary: (any TextIconPackable)?,
         nameLabelWidth: Int,
         numberOfLines: Int) {
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        self.iconPackTertiary = iconPackTertiary
        self.nameLabelWidth = nameLabelWidth
        self.numberOfLines = numberOfLines
    }
}

struct GENERIC_SEGMENT_LAYOUT {

    struct LongResponse {
        let globalLayout: HORIZONTAL_LAYOUT
        let buttonLayouts: [HORIZONTAL_LAYOUT_LONG]
    }
    
    struct StackedResponse {
        let globalLayout: HORIZONTAL_LAYOUT
        let buttonLayouts: [HORIZONTAL_LAYOUT_STACKED]
    }
    
    static func computeStacked(layoutSchemeType: LayoutScheme.Type,
                            layoutWidth: Int,
                            orientation: Orientation,
                            infoList: [SEGMENT_LAYOUT_INFO],
                               attemptEqualWidthsForAllButtons: Bool,
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?) -> StackedResponse {
        
        let count = infoList.count
        
        let outsideBoxLeftSqueezed = layoutSchemeType.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                   squeeze: .squeezed,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = layoutSchemeType.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                   squeeze: .standard,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = layoutSchemeType.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                  squeeze: .relaxed,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = layoutSchemeType.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                     squeeze: .squeezed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let outsideBoxRightStandard = layoutSchemeType.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                     squeeze: .standard,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let outsideBoxRightRelaxed = layoutSchemeType.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                    squeeze: .relaxed,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        
        let heroLeftSqueezed = layoutSchemeType.getHeroPaddingLeftLong(orientation: orientation,
                                                                       squeeze: .squeezed)
        let heroLeftStandard = layoutSchemeType.getHeroPaddingLeftLong(orientation: orientation,
                                                                       squeeze: .standard)
        let heroLeftRelaxed = layoutSchemeType.getHeroPaddingLeftLong(orientation: orientation,
                                                                      squeeze: .relaxed)
        
        
        let heroRightSqueezed = layoutSchemeType.getHeroPaddingRightLong(orientation: orientation,
                                                                         squeeze: .squeezed)
        let heroRightStandard = layoutSchemeType.getHeroPaddingRightLong(orientation: orientation,
                                                                         squeeze: .standard)
        let heroRightRelaxed = layoutSchemeType.getHeroPaddingRightLong(orientation: orientation,
                                                                        squeeze: .relaxed)
        
        
        let slaveLeftSqueezed = layoutSchemeType.getSlavePaddingLeft(orientation: orientation,
                                                                         squeeze: .squeezed)
        let slaveLeftStandard = layoutSchemeType.getSlavePaddingLeft(orientation: orientation,
                                                                         squeeze: .standard)
        let slaveLeftRelaxed = layoutSchemeType.getSlavePaddingLeft(orientation: orientation,
                                                                        squeeze: .relaxed)
        
        
        let slaveRightSqueezed = layoutSchemeType.getSlavePaddingRight(orientation: orientation,
                                                                           squeeze: .squeezed)
        let slaveRightStandard = layoutSchemeType.getSlavePaddingRight(orientation: orientation,
                                                                           squeeze: .standard)
        let slaveRightRelaxed = layoutSchemeType.getSlavePaddingRight(orientation: orientation,
                                                                          squeeze: .relaxed)
        
        
        let accentLeftSqueezed = layoutSchemeType.getAccentPaddingLeft(orientation: orientation,
                                                                                    squeeze: .squeezed)
                let accentLeftStandard = layoutSchemeType.getAccentPaddingLeft(orientation: orientation,
                                                                                    squeeze: .standard)
                let accentLeftRelaxed = layoutSchemeType.getAccentPaddingLeft(orientation: orientation,
                                                                                   squeeze: .relaxed)
                
                
                let accentRightSqueezed = layoutSchemeType.getAccentPaddingRight(orientation: orientation,
                                                                                      squeeze: .squeezed)
                let accentRightStandard = layoutSchemeType.getAccentPaddingRight(orientation: orientation,
                                                                                      squeeze: .standard)
                let accentRightRelaxed = layoutSchemeType.getAccentPaddingRight(orientation: orientation,
                                                                                     squeeze: .relaxed)
        
        let buttonLayouts = infoList.map { _ in
            HORIZONTAL_LAYOUT_STACKED()
        }
        
        var consumed = 0
        var largestButtonWidth = 0
        for index in 0..<count {
            let buttonLayout = buttonLayouts[index]
            let info = infoList[index]
            
            let nameLabelWidth = info.nameLabelWidth
            let numberOfLines = info.numberOfLines
            let iconMain = info.iconPackMain.getTextIcon(orientation: orientation,
                                                         layoutSchemeFlavor: .stackedLarge,
                                                             numberOfLines: numberOfLines,
                                                             isDarkMode: false,
                                                             isEnabled: true)
            let iconMainWidth = iconMain.width
            
            let iconSecondaryWidth: Int
            if let iconPackSecondary = info.iconPackSecondary {
                let iconSecondary = iconPackSecondary.getTextIcon(orientation: orientation,
                                                                  layoutSchemeFlavor: .long,
                                                                  numberOfLines: 0,
                                                                  isDarkMode: false,
                                                                  isEnabled: true)
                iconSecondaryWidth = iconSecondary.width
            } else {
                iconSecondaryWidth = 0
            }
            
            let iconTertiaryWidth: Int
            if let iconPackTertiary = info.iconPackTertiary {
                        let iconTertiary = iconPackTertiary.getTextIcon(orientation: orientation,
                                                                layoutSchemeFlavor: .long,
                                                                numberOfLines: 0,
                                                                isDarkMode: false,
                                                                isEnabled: true)
                        iconTertiaryWidth = iconTertiary.width
                    } else {
                        iconTertiaryWidth = 0
                    }
            
            let heroWidth = max(nameLabelWidth, iconMainWidth)
            let buttonWidth = heroWidth + iconSecondaryWidth + iconTertiaryWidth
            consumed += buttonWidth
            
            buttonLayout.__computedWidth = buttonWidth
            largestButtonWidth = max(largestButtonWidth, buttonWidth)
        }
        
        for index in 0..<count {
            let buttonLayout = buttonLayouts[index]
            let __extraWidthForAllEqual = (largestButtonWidth - buttonLayout.__computedWidth)
            buttonLayout.__extraLeftForAllEqual = (__extraWidthForAllEqual >> 1)
            buttonLayout.__extraRightForAllEqual = (__extraWidthForAllEqual - buttonLayout.__extraRightForAllEqual)
        }
        
        
        let globalLayout = HORIZONTAL_LAYOUT()
        
        _ = globalLayout.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
        for index in 0..<count {
            let buttonLayout = buttonLayouts[index]
            _ = buttonLayout.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: heroLeftSqueezed, right: heroRightSqueezed)
            _ = buttonLayout.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftSqueezed, right: slaveRightSqueezed)
            _ = buttonLayout.expandAccentFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: accentLeftSqueezed, right: accentRightSqueezed)
            
        }
        
        var isLooping = true
        
        while isLooping {
            isLooping = false
            if globalLayout.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                              left: outsideBoxLeftStandard, right: outsideBoxRightStandard) {
                isLooping = true
            }
            for index in 0..<count {
                let buttonLayout = buttonLayouts[index]
                if buttonLayout.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                            left: heroLeftStandard, right: heroRightStandard) {
                    isLooping = true
                }
                if buttonLayout.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                             left: slaveLeftStandard, right: slaveRightStandard) {
                    isLooping = true
                }
                if buttonLayout.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                             left: accentLeftStandard, right: accentRightStandard) {
                    isLooping = true
                }
            }
        }
        
        isLooping = true
        
        while isLooping {
            isLooping = false
            if globalLayout.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftRelaxed, right: outsideBoxRightRelaxed) {
                isLooping = true
            }
            
            for index in 0..<count {
                let buttonLayout = buttonLayouts[index]
                
                if buttonLayout.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: heroLeftRelaxed, right: heroRightRelaxed) {
                    isLooping = true
                }
                if buttonLayout.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftRelaxed, right: slaveRightRelaxed) {
                    isLooping = true
                }
                if buttonLayout.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                                 left: accentLeftRelaxed, right: accentRightRelaxed) {
                    isLooping = true
                }
            }
        }
        
        if attemptEqualWidthsForAllButtons {
            isLooping = true
            while isLooping {
                isLooping = false
                for index in 0..<count {
                    let buttonLayout = buttonLayouts[index]
                    if buttonLayout.expandHeroOnce(consumed: &consumed,
                                                   layoutWidth: layoutWidth,
                                                   left: heroLeftRelaxed + buttonLayout.__extraLeftForAllEqual,
                                                   right: heroRightRelaxed + buttonLayout.__extraRightForAllEqual) {
                        isLooping = true
                    }
                }
            }
        }
        
        return StackedResponse(globalLayout: globalLayout, buttonLayouts: buttonLayouts)
    }
    
    static func computeLong(layoutSchemeType: LayoutScheme.Type,
                            layoutWidth: Int,
                            orientation: Orientation,
                            infoList: [SEGMENT_LAYOUT_INFO],
                            attemptEqualWidthsForAllButtons: Bool,
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?) -> LongResponse {
        
        let count = infoList.count
        
        let heroSpacingSqueezed = layoutSchemeType.getHeroSpacingLong(orientation: orientation,
                                                                      squeeze: .squeezed)
        let heroSpacingStandard = layoutSchemeType.getHeroSpacingLong(orientation: orientation,
                                                                      squeeze: .standard)
        let heroSpacingRelaxed = layoutSchemeType.getHeroSpacingLong(orientation: orientation,
                                                                     squeeze: .relaxed)
        
        let outsideBoxLeftSqueezed = layoutSchemeType.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                   squeeze: .squeezed,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = layoutSchemeType.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                   squeeze: .standard,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = layoutSchemeType.getOutsideBoxPaddingLeftLong(orientation: orientation,
                                                                                  squeeze: .relaxed,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = layoutSchemeType.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                     squeeze: .squeezed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let outsideBoxRightStandard = layoutSchemeType.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                     squeeze: .standard,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let outsideBoxRightRelaxed = layoutSchemeType.getOutsideBoxPaddingRightLong(orientation: orientation,
                                                                                    squeeze: .relaxed,
                                                                                    neighborTypeLeft: neighborTypeLeft,
                                                                                    neighborTypeRight: neighborTypeRight)
        
        let heroLeftSqueezed = layoutSchemeType.getHeroPaddingLeftLong(orientation: orientation,
                                                                       squeeze: .squeezed)
        let heroLeftStandard = layoutSchemeType.getHeroPaddingLeftLong(orientation: orientation,
                                                                       squeeze: .standard)
        let heroLeftRelaxed = layoutSchemeType.getHeroPaddingLeftLong(orientation: orientation,
                                                                      squeeze: .relaxed)
        
        
        let heroRightSqueezed = layoutSchemeType.getHeroPaddingRightLong(orientation: orientation,
                                                                         squeeze: .squeezed)
        let heroRightStandard = layoutSchemeType.getHeroPaddingRightLong(orientation: orientation,
                                                                         squeeze: .standard)
        let heroRightRelaxed = layoutSchemeType.getHeroPaddingRightLong(orientation: orientation,
                                                                        squeeze: .relaxed)
        
        
        
        let slaveLeftSqueezed = layoutSchemeType.getSlavePaddingLeft(orientation: orientation,
                                                                         squeeze: .squeezed)
        let slaveLeftStandard = layoutSchemeType.getSlavePaddingLeft(orientation: orientation,
                                                                         squeeze: .standard)
        let slaveLeftRelaxed = layoutSchemeType.getSlavePaddingLeft(orientation: orientation,
                                                                        squeeze: .relaxed)
        
        
        let slaveRightSqueezed = layoutSchemeType.getSlavePaddingRight(orientation: orientation,
                                                                           squeeze: .squeezed)
        let slaveRightStandard = layoutSchemeType.getSlavePaddingRight(orientation: orientation,
                                                                           squeeze: .standard)
        let slaveRightRelaxed = layoutSchemeType.getSlavePaddingRight(orientation: orientation,
                                                                          squeeze: .relaxed)
        
        let accentLeftSqueezed = layoutSchemeType.getAccentPaddingLeft(orientation: orientation,
                                                                                    squeeze: .squeezed)
                let accentLeftStandard = layoutSchemeType.getAccentPaddingLeft(orientation: orientation,
                                                                                    squeeze: .standard)
                let accentLeftRelaxed = layoutSchemeType.getAccentPaddingLeft(orientation: orientation,
                                                                                   squeeze: .relaxed)
                
                
                let accentRightSqueezed = layoutSchemeType.getAccentPaddingRight(orientation: orientation,
                                                                                      squeeze: .squeezed)
                let accentRightStandard = layoutSchemeType.getAccentPaddingRight(orientation: orientation,
                                                                                      squeeze: .standard)
                let accentRightRelaxed = layoutSchemeType.getAccentPaddingRight(orientation: orientation,
                                                                                     squeeze: .relaxed)
        
        let buttonLayouts = infoList.map { _ in
            HORIZONTAL_LAYOUT_LONG()
        }
        
        
        var consumed = 0
        var largestButtonWidth = 0
        for index in 0..<count {
            let buttonLayout = buttonLayouts[index]
            let info = infoList[index]
            
            let nameLabelWidth = info.nameLabelWidth
            let numberOfLines = info.numberOfLines
            let iconMain = info.iconPackMain.getTextIcon(orientation: orientation,
                                                             layoutSchemeFlavor: .long,
                                                             numberOfLines: numberOfLines,
                                                             isDarkMode: false,
                                                             isEnabled: true)
            let iconMainWidth = iconMain.width
            
            let iconSecondaryWidth: Int
            if let iconPackSecondary = info.iconPackSecondary {
                let iconSecondary = iconPackSecondary.getTextIcon(orientation: orientation,
                                                                  layoutSchemeFlavor: .long,
                                                                  numberOfLines: numberOfLines,
                                                                  isDarkMode: false,
                                                                  isEnabled: true)
                iconSecondaryWidth = iconSecondary.width
            } else {
                iconSecondaryWidth = 0
            }
            
            let iconTertiaryWidth: Int
            if let iconPackTertiary = info.iconPackTertiary {
                        let iconTertiary = iconPackTertiary.getTextIcon(orientation: orientation,
                                                                layoutSchemeFlavor: .long,
                                                                numberOfLines: 0,
                                                                isDarkMode: false,
                                                                isEnabled: true)
                        iconTertiaryWidth = iconTertiary.width
                    } else {
                        iconTertiaryWidth = 0
                    }
            
            let heroWidth = nameLabelWidth + iconMainWidth
            let buttonWidth = heroWidth + iconSecondaryWidth + iconTertiaryWidth
            consumed += buttonWidth
            
            buttonLayout.__computedWidth = buttonWidth
            largestButtonWidth = max(largestButtonWidth, buttonWidth)
        }
        
        for index in 0..<count {
            let buttonLayout = buttonLayouts[index]
            let __extraWidthForAllEqual = (largestButtonWidth - buttonLayout.__computedWidth)
            buttonLayout.__extraLeftForAllEqual = (__extraWidthForAllEqual >> 1)
            buttonLayout.__extraRightForAllEqual = (__extraWidthForAllEqual - buttonLayout.__extraRightForAllEqual)
        }
        
        let globalLayout = HORIZONTAL_LAYOUT()
        
        _ = globalLayout.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
        for index in 0..<count {
            let buttonLayout = buttonLayouts[index]
            
            _ = buttonLayout.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: heroLeftSqueezed, right: heroRightSqueezed)
            _ = buttonLayout.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftSqueezed, right: slaveRightSqueezed)
            _ = buttonLayout.expandAccentFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: accentLeftSqueezed, right: accentRightSqueezed)
            _ = buttonLayout.expandHeroSpacingFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                                space: heroSpacingSqueezed)
        }
        
        var isLooping = true
        
        while isLooping {
            isLooping = false
            if globalLayout.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                              left: outsideBoxLeftStandard, right: outsideBoxRightStandard) {
                isLooping = true
            }
            for index in 0..<count {
                let buttonLayout = buttonLayouts[index]
                if buttonLayout.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                            left: heroLeftStandard, right: heroRightStandard) {
                    isLooping = true
                }
                if buttonLayout.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                             left: slaveLeftStandard, right: slaveRightStandard) {
                    isLooping = true
                }
                if buttonLayout.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                             left: accentLeftStandard, right: accentRightStandard) {
                    isLooping = true
                }
                if buttonLayout.expandHeroSpacingOnce(consumed: &consumed,
                                                      layoutWidth: layoutWidth,
                                                      space: heroSpacingStandard) {
                    isLooping = true
                }
            }
        }
        
        isLooping = true
        
        while isLooping {
            isLooping = false
            if globalLayout.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftRelaxed, right: outsideBoxRightRelaxed) {
                isLooping = true
            }
            
            for index in 0..<count {
                let buttonLayout = buttonLayouts[index]
                
                if buttonLayout.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: heroLeftRelaxed, right: heroRightRelaxed) {
                    isLooping = true
                }
                if buttonLayout.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftRelaxed, right: slaveRightRelaxed) {
                    isLooping = true
                }
                if buttonLayout.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                                 left: accentLeftRelaxed, right: accentRightRelaxed) {
                    isLooping = true
                }
                if buttonLayout.expandHeroSpacingOnce(consumed: &consumed,
                                                      layoutWidth: layoutWidth,
                                                      space: heroSpacingRelaxed) {
                    isLooping = true
                }
            }
        }
        
        if attemptEqualWidthsForAllButtons {
            isLooping = true
            while isLooping {
                isLooping = false
                for index in 0..<count {
                    let buttonLayout = buttonLayouts[index]
                    if buttonLayout.expandHeroOnce(consumed: &consumed,
                                                   layoutWidth: layoutWidth,
                                                   left: heroLeftRelaxed + buttonLayout.__extraLeftForAllEqual,
                                                   right: heroRightRelaxed + buttonLayout.__extraRightForAllEqual) {
                        isLooping = true
                    }
                }
            }
        }
        
        return LongResponse(globalLayout: globalLayout, buttonLayouts: buttonLayouts)
    }
    
}
