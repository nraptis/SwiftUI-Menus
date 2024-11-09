//
//  GENERIC_LAYOUT.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

class HORIZONTAL_LAYOUT {
    
    var __iconSecondaryWidth = 0
    var __iconTertiaryWidth = 0
    
    var __computedWidth = 0
    var __extraLeftForAllEqual = 0
    var __extraRightForAllEqual = 0
    
    var outsideBoxPaddingLeft = 0
    var outsideBoxPaddingRight = 0
    
    var valuePaddingLeft = 0
    var valuePaddingRight = 0
    
    var accentPaddingLeft = 0
    var accentPaddingRight = 0
    
    var slavePaddingLeft = 0
    var slavePaddingRight = 0
    
    var heroPaddingLeft = 0
    var heroPaddingRight = 0
    
    var extraGrowingElementWidth = 0
    
    func expandChannelOnce(consumed: inout Int,
                           layoutWidth: Int,
                           channel1: inout Int,
                           ceiling1: Int,
                           channel2: inout Int,
                           ceiling2: Int) -> Bool {
        var result = false
        if (consumed < layoutWidth) && (channel1 < ceiling1) {
            result = true
            channel1 += 1
            consumed += 1
        }
        if (consumed < layoutWidth) && (channel2 < ceiling2) {
            result = true
            channel2 += 1
            consumed += 1
        }
        return result
    }
    
    func expandChannelFilling(consumed: inout Int,
                              layoutWidth: Int,
                              channel1: inout Int,
                              ceiling1: Int) -> Bool {
        let availableWidth = layoutWidth - consumed
        let remainingSpace = (ceiling1 - channel1)
        if (remainingSpace > 0) && (availableWidth > 0) {
            let growAmount = min(remainingSpace, availableWidth)
            consumed += growAmount
            channel1 += growAmount
            return true
        } else {
            return false
        }
    }
    
    func expandChannelOnce(consumed: inout Int,
                           layoutWidth: Int,
                           channel1: inout Int,
                           ceiling1: Int) -> Bool {
        if (consumed < layoutWidth) && (channel1 < ceiling1) {
            channel1 += 1
            consumed += 1
            return true
        } else {
            return false
        }
    }
    
    func expandChannelFilling(consumed: inout Int,
                              layoutWidth: Int,
                              channel1: inout Int,
                              ceiling1: Int,
                              channel2: inout Int,
                              ceiling2: Int) -> Bool {
        var result = false
        var fudge = 0
        while fudge < 256 {
            if expandChannelOnce(consumed: &consumed,
                                 layoutWidth: layoutWidth,
                                 channel1: &channel1,
                                 ceiling1: ceiling1,
                                 channel2: &channel2,
                                 ceiling2: ceiling2) {
                result = true
            } else {
                break
            }
            fudge += 1
        }
        return result
    }
    
    func expandOutsideBoxFilling(consumed: inout Int,
                                 layoutWidth: Int,
                                 left: Int,
                                 right: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &outsideBoxPaddingLeft,
                             ceiling1: left,
                             channel2: &outsideBoxPaddingRight,
                             ceiling2: right)
    }
    
    func expandOutsideBoxOnce(consumed: inout Int,
                              layoutWidth: Int,
                              left: Int,
                              right: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &outsideBoxPaddingLeft,
                          ceiling1: left,
                          channel2: &outsideBoxPaddingRight,
                          ceiling2: right)
    }
    
    func expandHeroFilling(consumed: inout Int,
                           layoutWidth: Int,
                           left: Int,
                           right: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &heroPaddingLeft,
                             ceiling1: left,
                             channel2: &heroPaddingRight,
                             ceiling2: right)
    }
    
    func expandHeroOnce(consumed: inout Int,
                        layoutWidth: Int,
                        left: Int,
                        right: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &heroPaddingLeft,
                          ceiling1: left,
                          channel2: &heroPaddingRight,
                          ceiling2: right)
    }
    
    func expandSlaveFilling(consumed: inout Int,
                            layoutWidth: Int,
                            left: Int,
                            right: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &slavePaddingLeft,
                             ceiling1: left,
                             channel2: &slavePaddingRight,
                             ceiling2: right)
    }
    
    func expandSlaveOnce(consumed: inout Int,
                         layoutWidth: Int,
                         left: Int,
                         right: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &slavePaddingLeft,
                          ceiling1: left,
                          channel2: &slavePaddingRight,
                          ceiling2: right)
    }
    
    func expandAccentFilling(consumed: inout Int,
                             layoutWidth: Int,
                             left: Int,
                             right: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &accentPaddingLeft,
                             ceiling1: left,
                             channel2: &accentPaddingRight,
                             ceiling2: right)
    }
    
    func expandAccentOnce(consumed: inout Int,
                          layoutWidth: Int,
                          left: Int,
                          right: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &accentPaddingLeft,
                          ceiling1: left,
                          channel2: &accentPaddingRight,
                          ceiling2: right)
    }
    
    func expandValueFilling(consumed: inout Int,
                            layoutWidth: Int,
                            left: Int,
                            right: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &valuePaddingLeft,
                             ceiling1: left,
                             channel2: &valuePaddingRight,
                             ceiling2: right)
    }
    
    func expandValueOnce(consumed: inout Int,
                         layoutWidth: Int,
                         left: Int,
                         right: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &valuePaddingLeft,
                          ceiling1: left,
                          channel2: &valuePaddingRight,
                          ceiling2: right)
    }
    
    func expandExtraGrowingElementFilling(consumed: inout Int,
                                          layoutWidth: Int,
                                          size: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &extraGrowingElementWidth,
                             ceiling1: size)
    }
    
    func expandExtraGrowingElementOnce(consumed: inout Int,
                                       layoutWidth: Int,
                                       size: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &extraGrowingElementWidth,
                          ceiling1: size)
    }
}

class HORIZONTAL_LAYOUT_LONG: HORIZONTAL_LAYOUT, CustomStringConvertible {
    var heroSpacing = 0
    
    func expandHeroSpacingFilling(consumed: inout Int,
                                  layoutWidth: Int,
                                  space: Int) -> Bool {
        expandChannelFilling(consumed: &consumed,
                             layoutWidth: layoutWidth,
                             channel1: &heroSpacing,
                             ceiling1: space)
    }
    
    func expandHeroSpacingOnce(consumed: inout Int,
                               layoutWidth: Int,
                               space: Int) -> Bool {
        expandChannelOnce(consumed: &consumed,
                          layoutWidth: layoutWidth,
                          channel1: &heroSpacing,
                          ceiling1: space)
    }
    
    var description: String {
        var result = ""
        result += "out[\(outsideBoxPaddingLeft)+\(outsideBoxPaddingRight)], hero[\(heroPaddingLeft)+\(heroPaddingRight)], slave[\(slavePaddingLeft)+\(slavePaddingRight)] accent[\(accentPaddingLeft)+\(accentPaddingRight)] spacing[\(heroSpacing)]"
        return result
    }
}

class HORIZONTAL_LAYOUT_STACKED: HORIZONTAL_LAYOUT, CustomStringConvertible {
    var description: String {
        var result = ""
        result += "out[\(outsideBoxPaddingLeft)+\(outsideBoxPaddingRight)], hero[\(heroPaddingLeft)+\(heroPaddingRight)], slave[\(slavePaddingLeft)+\(slavePaddingRight)] accent[\(accentPaddingLeft)+\(accentPaddingRight)]"
        return result
    }
}

struct GENERIC_LAYOUT {
    
    @MainActor static func computeStacked(layoutSchemeType: LayoutScheme.Type,
                               layoutWidth: Int,
                               orientation: Orientation,
                               nameLabelWidth: Int,
                               numberOfLines: Int,
                               valueLabelWidth: Int,
                               extraGrowingElementWidthSqueezed: Int,
                               extraGrowingElementWidthStandard: Int,
                               extraGrowingElementWidthRelaxed: Int,
                               iconPackMain: (any TextIconPackable),
                               iconPackSecondary: (any TextIconPackable)?,
                               iconPackTertiary: (any TextIconPackable)?,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> HORIZONTAL_LAYOUT_STACKED {
        let result = HORIZONTAL_LAYOUT_STACKED()
        
        let outsideBoxLeftSqueezed = layoutSchemeType.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = layoutSchemeType.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = layoutSchemeType.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                     squeeze: .relaxed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = layoutSchemeType.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightStandard = layoutSchemeType.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightRelaxed = layoutSchemeType.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                       squeeze: .relaxed,
                                                                                       neighborTypeLeft: neighborTypeLeft,
                                                                                       neighborTypeRight: neighborTypeRight)
        
        let heroLeftSqueezed = layoutSchemeType.getHeroPaddingLeftStacked(orientation: orientation,
                                                                          squeeze: .squeezed)
        let heroLeftStandard = layoutSchemeType.getHeroPaddingLeftStacked(orientation: orientation,
                                                                          squeeze: .standard)
        let heroLeftRelaxed = layoutSchemeType.getHeroPaddingLeftStacked(orientation: orientation,
                                                                         squeeze: .relaxed)
        
        
        let heroRightSqueezed = layoutSchemeType.getHeroPaddingRightStacked(orientation: orientation,
                                                                            squeeze: .squeezed)
        let heroRightStandard = layoutSchemeType.getHeroPaddingRightStacked(orientation: orientation,
                                                                            squeeze: .standard)
        let heroRightRelaxed = layoutSchemeType.getHeroPaddingRightStacked(orientation: orientation,
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
        
        
        let valueLeftSqueezed = layoutSchemeType.getValuePaddingLeft(orientation: orientation,
                                                                     squeeze: .squeezed)
        let valueLeftStandard = layoutSchemeType.getValuePaddingLeft(orientation: orientation,
                                                                     squeeze: .standard)
        let valueLeftRelaxed = layoutSchemeType.getValuePaddingLeft(orientation: orientation,
                                                                    squeeze: .relaxed)
        
        
        let valueRightSqueezed = layoutSchemeType.getValuePaddingRight(orientation: orientation,
                                                                       squeeze: .squeezed)
        let valueRightStandard = layoutSchemeType.getValuePaddingRight(orientation: orientation,
                                                                       squeeze: .standard)
        let valueRightRelaxed = layoutSchemeType.getValuePaddingRight(orientation: orientation,
                                                                      squeeze: .relaxed)
        
        let iconMain = iconPackMain.getTextIcon(orientation: orientation,
                                                layoutSchemeFlavor: .stackedLarge,
                                                numberOfLines: numberOfLines,
                                                isDarkMode: false,
                                                isEnabled: true)
        
        let iconMainWidth = iconMain.width
        let iconSecondaryWidth: Int
        if let iconPackSecondary {
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
        if let iconPackTertiary {
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
        var consumed = (heroWidth + valueLabelWidth + iconSecondaryWidth + iconTertiaryWidth)
        
        _ = result.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
        _ = result.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftSqueezed, right: heroRightSqueezed)
        if valueLabelWidth > 0 {
            _ = result.expandValueFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: valueLeftSqueezed, right: valueRightSqueezed)
        }
        if iconSecondaryWidth > 0 {
            _ = result.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftSqueezed, right: slaveRightSqueezed)
        }
        if iconTertiaryWidth > 0 {
            _ = result.expandAccentFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: accentLeftSqueezed, right: accentRightSqueezed)
        }
        _ = result.expandExtraGrowingElementFilling(consumed: &consumed,
                                                    layoutWidth: layoutWidth,
                                                    size: extraGrowingElementWidthSqueezed)
        
        var isLooping = true
        
        while isLooping {
            isLooping = false
            if result.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftStandard, right: outsideBoxRightStandard) {
                isLooping = true
            }
            if result.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftStandard, right: heroRightStandard) {
                isLooping = true
            }
            if valueLabelWidth > 0 {
                if result.expandValueOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: valueLeftStandard, right: valueRightStandard) {
                    isLooping = true
                }
            }
            if iconSecondaryWidth > 0 {
                if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftStandard, right: slaveRightStandard) {
                    isLooping = true
                }
            }
            if iconTertiaryWidth > 0 {
                if result.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: accentLeftStandard, right: accentRightStandard) {
                    isLooping = true
                }
            }
        }
        _ = result.expandExtraGrowingElementFilling(consumed: &consumed,
                                                    layoutWidth: layoutWidth,
                                                    size: extraGrowingElementWidthStandard)
        
        isLooping = true
        while isLooping {
            isLooping = false
            if result.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftRelaxed, right: outsideBoxRightRelaxed) {
                isLooping = true
            }
            if result.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftRelaxed, right: heroRightRelaxed) {
                isLooping = true
            }
            if valueLabelWidth > 0 {
                if result.expandValueOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: valueLeftRelaxed, right: valueRightRelaxed) {
                    isLooping = true
                }
            }
            if iconSecondaryWidth > 0 {
                if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftRelaxed, right: slaveRightRelaxed) {
                    isLooping = true
                }
            }
            if iconTertiaryWidth > 0 {
                if result.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: accentLeftRelaxed, right: accentRightRelaxed) {
                    isLooping = true
                }
            }
        }
        _ = result.expandExtraGrowingElementFilling(consumed: &consumed,
                                                    layoutWidth: layoutWidth,
                                                    size: extraGrowingElementWidthRelaxed)
        
        return result
    }
    
    @MainActor static func computeLong(layoutSchemeType: LayoutScheme.Type,
                            layoutWidth: Int,
                            orientation: Orientation,
                            nameLabelWidth: Int,
                            numberOfLines: Int,
                            valueLabelWidth: Int,
                            extraGrowingElementWidthSqueezed: Int,
                            extraGrowingElementWidthStandard: Int,
                            extraGrowingElementWidthRelaxed: Int,
                            iconPackMain: (any TextIconPackable),
                            iconPackSecondary: (any TextIconPackable)?,
                            iconPackTertiary: (any TextIconPackable)?,
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?) -> HORIZONTAL_LAYOUT_LONG {
        
        let result = HORIZONTAL_LAYOUT_LONG()
        
        let heroSpacingSqueezed = layoutSchemeType.getHeroSpacingLong(orientation: orientation,squeeze: .squeezed)
        let heroSpacingStandard = layoutSchemeType.getHeroSpacingLong(orientation: orientation,squeeze: .standard)
        let heroSpacingRelaxed = layoutSchemeType.getHeroSpacingLong(orientation: orientation,
                                                                     squeeze: .relaxed)
        
        let outsideBoxLeftSqueezed = layoutSchemeType.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                   squeeze: .squeezed,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = layoutSchemeType.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                   squeeze: .standard,
                                                                                   neighborTypeLeft: neighborTypeLeft,
                                                                                   neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = layoutSchemeType.getOutsideBoxPaddingLeft(orientation: orientation,
                                                                                  squeeze: .relaxed,
                                                                                  neighborTypeLeft: neighborTypeLeft,
                                                                                  neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = layoutSchemeType.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                     squeeze: .squeezed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let outsideBoxRightStandard = layoutSchemeType.getOutsideBoxPaddingRight(orientation: orientation,
                                                                                     squeeze: .standard,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        let outsideBoxRightRelaxed = layoutSchemeType.getOutsideBoxPaddingRight(orientation: orientation,
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
        
        let valueLeftSqueezed = layoutSchemeType.getValuePaddingLeft(orientation: orientation,
                                                                     squeeze: .squeezed)
        let valueLeftStandard = layoutSchemeType.getValuePaddingLeft(orientation: orientation,
                                                                     squeeze: .standard)
        let valueLeftRelaxed = layoutSchemeType.getValuePaddingLeft(orientation: orientation,
                                                                    squeeze: .relaxed)
        
        
        let valueRightSqueezed = layoutSchemeType.getValuePaddingRight(orientation: orientation,
                                                                       squeeze: .squeezed)
        let valueRightStandard = layoutSchemeType.getValuePaddingRight(orientation: orientation,
                                                                       squeeze: .standard)
        let valueRightRelaxed = layoutSchemeType.getValuePaddingRight(orientation: orientation,
                                                                      squeeze: .relaxed)
        
        
        let iconMain = iconPackMain.getTextIcon(orientation: orientation,
                                                layoutSchemeFlavor: .long,
                                                numberOfLines: numberOfLines,
                                                isDarkMode: false,
                                                isEnabled: true)
        
        let iconMainWidth = iconMain.width
        let iconSecondaryWidth: Int
        if let iconPackSecondary {
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
        if let iconPackTertiary {
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
        var consumed = (heroWidth + valueLabelWidth + iconSecondaryWidth + iconTertiaryWidth)
        
        _ = result.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
        _ = result.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftSqueezed, right: heroRightSqueezed)
        if valueLabelWidth > 0 {
            _ = result.expandValueFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: valueLeftSqueezed, right: valueRightSqueezed)
        }
        if iconSecondaryWidth > 0 {
            _ = result.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftSqueezed, right: slaveRightSqueezed)
        }
        if iconTertiaryWidth > 0 {
            _ = result.expandAccentFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: accentLeftSqueezed, right: accentRightSqueezed)
        }
        _ = result.expandHeroSpacingFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                            space: heroSpacingSqueezed)
        _ = result.expandExtraGrowingElementFilling(consumed: &consumed,
                                                    layoutWidth: layoutWidth,
                                                    size: extraGrowingElementWidthSqueezed)
        
        var isLooping = true
        
        while isLooping {
            isLooping = false
            if result.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftStandard, right: outsideBoxRightStandard) {
                isLooping = true
            }
            if result.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftStandard, right: heroRightStandard) {
                isLooping = true
            }
            if valueLabelWidth > 0 {
                if result.expandValueOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: valueLeftStandard, right: valueRightStandard) {
                    isLooping = true
                }
            }
            if iconSecondaryWidth > 0 {
                if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftStandard, right: slaveRightStandard) {
                    isLooping = true
                }
            }
            if iconTertiaryWidth > 0 {
                if result.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: accentLeftStandard, right: accentRightStandard) {
                    isLooping = true
                }
            }
            if result.expandHeroSpacingOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                            space: heroSpacingStandard) {
                isLooping = true
            }
        }
        _ = result.expandExtraGrowingElementFilling(consumed: &consumed,
                                                    layoutWidth: layoutWidth,
                                                    size: extraGrowingElementWidthStandard)
        
        isLooping = true
        while isLooping {
            isLooping = false
            if result.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftRelaxed, right: outsideBoxRightRelaxed) {
                isLooping = true
            }
            if result.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftRelaxed, right: heroRightRelaxed) {
                isLooping = true
            }
            if valueLabelWidth > 0 {
                if result.expandValueOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: valueLeftRelaxed, right: valueRightRelaxed) {
                    isLooping = true
                }
            }
            if iconSecondaryWidth > 0 {
                if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftRelaxed, right: slaveRightRelaxed) {
                    isLooping = true
                }
            }
            if iconTertiaryWidth > 0 {
                if result.expandAccentOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: accentLeftRelaxed, right: accentRightRelaxed) {
                    isLooping = true
                }
            }
            if result.expandHeroSpacingOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                            space: heroSpacingRelaxed) {
                isLooping = true
            }
        }
        
        _ = result.expandExtraGrowingElementFilling(consumed: &consumed,
                                                    layoutWidth: layoutWidth,
                                                    size: extraGrowingElementWidthRelaxed)
        
        return result
    }
    
}
