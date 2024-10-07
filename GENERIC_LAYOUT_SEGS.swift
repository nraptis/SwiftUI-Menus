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
    let nameLabelWidthLong: Int
    let nameLabelWidthStackedLarge: Int
    let nameLabelWidthStackedMedium: Int
    let nameLabelWidthStackedSmall: Int
    let numberOfLines: Int
    
    init(iconPackMain: (any TextIconPackable),
         iconPackSecondary: (any TextIconPackable)?,
         nameLabelWidthLong: Int,
         nameLabelWidthStackedLarge: Int,
         nameLabelWidthStackedMedium: Int,
         nameLabelWidthStackedSmall: Int,
         numberOfLines: Int) {
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
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
    let nameLabelWidthLarge: Int
    let nameLabelWidthMedium: Int
    let nameLabelWidthSmall: Int
    let numberOfLines: Int
    
    init(iconPackMain: (any TextIconPackable),
         iconPackSecondary: (any TextIconPackable)?,
         nameLabelWidthLarge: Int,
         nameLabelWidthMedium: Int,
         nameLabelWidthSmall: Int,
         numberOfLines: Int) {
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        self.nameLabelWidthLarge = nameLabelWidthLarge
        self.nameLabelWidthMedium = nameLabelWidthMedium
        self.nameLabelWidthSmall = nameLabelWidthSmall
        self.numberOfLines = numberOfLines
    }
}

struct SEGMENT_LAYOUT_INFO {
    let iconPackMain: (any TextIconPackable)
    let iconPackSecondary: (any TextIconPackable)?
    let nameLabelWidth: Int
    let numberOfLines: Int
    init(iconPackMain: (any TextIconPackable),
         iconPackSecondary: (any TextIconPackable)?,
         nameLabelWidth: Int,
         numberOfLines: Int) {
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        self.nameLabelWidth = nameLabelWidth
        self.numberOfLines = numberOfLines
    }
}

/*
class HORIZONTAL_LAYOUT_SEGMENT_CHUNK {
    let nameLabelWidth: Int
    let numberOfLines: Int
    let iconPackMain: (any TextIconPackable)
    let iconPackSecondary: (any TextIconPackable)?
    let layout = HORIZONTAL_LAYOUT_LONG()
    
    init(nameLabelWidth: Int,
         numberOfLines: Int,
         iconPackMain: any TextIconPackable,
         iconPackSecondary: (any TextIconPackable)?) {
        
        self.nameLabelWidth = nameLabelWidth
        self.numberOfLines = numberOfLines
        self.iconPackMain = iconPackMain
        self.iconPackSecondary = iconPackSecondary
        
    }
}
*/

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
        
        
        
        let slaveLeftSqueezed = layoutSchemeType.getSlavePaddingLeftLong(orientation: orientation,
                                                                         squeeze: .squeezed)
        let slaveLeftStandard = layoutSchemeType.getSlavePaddingLeftLong(orientation: orientation,
                                                                         squeeze: .standard)
        let slaveLeftRelaxed = layoutSchemeType.getSlavePaddingLeftLong(orientation: orientation,
                                                                        squeeze: .relaxed)
        
        
        let slaveRightSqueezed = layoutSchemeType.getSlavePaddingRightLong(orientation: orientation,
                                                                           squeeze: .squeezed)
        let slaveRightStandard = layoutSchemeType.getSlavePaddingRightLong(orientation: orientation,
                                                                           squeeze: .standard)
        let slaveRightRelaxed = layoutSchemeType.getSlavePaddingRightLong(orientation: orientation,
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
            
            let heroWidth = max(nameLabelWidth, iconMainWidth)
            let buttonWidth = heroWidth + iconSecondaryWidth
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
        
        
        
        let slaveLeftSqueezed = layoutSchemeType.getSlavePaddingLeftLong(orientation: orientation,
                                                                         squeeze: .squeezed)
        let slaveLeftStandard = layoutSchemeType.getSlavePaddingLeftLong(orientation: orientation,
                                                                         squeeze: .standard)
        let slaveLeftRelaxed = layoutSchemeType.getSlavePaddingLeftLong(orientation: orientation,
                                                                        squeeze: .relaxed)
        
        
        let slaveRightSqueezed = layoutSchemeType.getSlavePaddingRightLong(orientation: orientation,
                                                                           squeeze: .squeezed)
        let slaveRightStandard = layoutSchemeType.getSlavePaddingRightLong(orientation: orientation,
                                                                           squeeze: .standard)
        let slaveRightRelaxed = layoutSchemeType.getSlavePaddingRightLong(orientation: orientation,
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
            
            let heroWidth = nameLabelWidth + iconMainWidth
            let buttonWidth = heroWidth + iconSecondaryWidth
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
