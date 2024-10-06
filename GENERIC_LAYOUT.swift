//
//  GENERIC_LAYOUT.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

class HORIZONTAL_LAYOUT {
    
    var __computedWidth = 0
    var __extraLeftForAllEqual = 0
    var __extraRightForAllEqual = 0
    
    
    
    var outsideBoxPaddingLeft = 0
    var outsideBoxPaddingRight = 0
    
    var slavePaddingLeft = 0
    var slavePaddingRight = 0
    
    var heroPaddingLeft = 0
    var heroPaddingRight = 0
    
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
        var result = false
        var fudge = 0
        while fudge < 256 {
            if expandChannelOnce(consumed: &consumed,
                                 layoutWidth: layoutWidth,
                                 channel1: &channel1,
                                 ceiling1: ceiling1) {
                result = true
            } else {
                break
            }
            fudge += 1
        }
        return result
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
        result += "out[\(outsideBoxPaddingLeft)+\(outsideBoxPaddingRight)], hero[\(heroPaddingLeft)+\(heroPaddingRight)], slave[\(slavePaddingLeft)+\(slavePaddingRight)] spacing[\(heroSpacing)]"
        return result
    }
}

class HORIZONTAL_LAYOUT_STACKED: HORIZONTAL_LAYOUT, CustomStringConvertible {
    var description: String {
        var result = ""
        result += "out[\(outsideBoxPaddingLeft)+\(outsideBoxPaddingRight)], hero[\(heroPaddingLeft)+\(heroPaddingRight)], slave[\(slavePaddingLeft)+\(slavePaddingRight)]"
        return result
    }
}

struct GENERIC_LAYOUT {
    
    static func computeStacked(layoutSchemeType: LayoutScheme.Type,
                               layoutWidth: Int,
                               orientation: Orientation,
                               nameLabelWidth: Int,
                               numberOfLines: Int,
                               iconPackMain: (any TextIconPackable),
                               iconPackSecondary: (any TextIconPackable)?,
                               neighborTypeLeft: ToolInterfaceElementType?,
                               neighborTypeRight: ToolInterfaceElementType?) -> HORIZONTAL_LAYOUT_STACKED {
        let result = HORIZONTAL_LAYOUT_STACKED()
        
        let outsideBoxLeftSqueezed = layoutSchemeType.getOutsideBoxPaddingLeftStacked(orientation: orientation,
                                                                                      squeeze: .squeezed,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftStandard = layoutSchemeType.getOutsideBoxPaddingLeftStacked(orientation: orientation,                
                                                                                      squeeze: .standard,
                                                                                      neighborTypeLeft: neighborTypeLeft,
                                                                                      neighborTypeRight: neighborTypeRight)
        let outsideBoxLeftRelaxed = layoutSchemeType.getOutsideBoxPaddingLeftStacked(orientation: orientation,
                                                                                     squeeze: .relaxed,
                                                                                     neighborTypeLeft: neighborTypeLeft,
                                                                                     neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightSqueezed = layoutSchemeType.getOutsideBoxPaddingRightStacked(orientation: orientation,
                                                                                        squeeze: .squeezed,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightStandard = layoutSchemeType.getOutsideBoxPaddingRightStacked(orientation: orientation,
                                                                                        squeeze: .standard,
                                                                                        neighborTypeLeft: neighborTypeLeft,
                                                                                        neighborTypeRight: neighborTypeRight)
        
        let outsideBoxRightRelaxed = layoutSchemeType.getOutsideBoxPaddingRightStacked(orientation: orientation,
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
        
        
        
        let slaveLeftSqueezed = layoutSchemeType.getSlavePaddingLeftStacked(orientation: orientation,      
                                                                            squeeze: .squeezed)
        let slaveLeftStandard = layoutSchemeType.getSlavePaddingLeftStacked(orientation: orientation,      
                                                                            squeeze: .standard)
        let slaveLeftRelaxed = layoutSchemeType.getSlavePaddingLeftStacked(orientation: orientation,     
                                                                           squeeze: .relaxed)
        
        
        let slaveRightSqueezed = layoutSchemeType.getSlavePaddingRightStacked(orientation: orientation,        
                                                                              squeeze: .squeezed)
        let slaveRightStandard = layoutSchemeType.getSlavePaddingRightStacked(orientation: orientation,        
                                                                              squeeze: .standard)
        let slaveRightRelaxed = layoutSchemeType.getSlavePaddingRightStacked(orientation: orientation,       
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
        
        let heroWidth = max(nameLabelWidth, iconMainWidth)
        var consumed = (heroWidth + iconSecondaryWidth)
        
        _ = result.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
        _ = result.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftSqueezed, right: heroRightSqueezed)
        _ = result.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                      left: slaveLeftSqueezed, right: slaveRightSqueezed)
        
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
            if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: slaveLeftStandard, right: slaveRightStandard) {
                isLooping = true
            }
        }
        
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
            if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: slaveLeftRelaxed, right: slaveRightRelaxed) {
                isLooping = true
            }
        }
        
        return result
    }
    
    static func computeLong(layoutSchemeType: LayoutScheme.Type,
                            layoutWidth: Int,
                            orientation: Orientation,
                            nameLabelWidth: Int,
                            numberOfLines: Int,
                            iconPackMain: (any TextIconPackable),
                            iconPackSecondary: (any TextIconPackable)?,
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?) -> HORIZONTAL_LAYOUT_LONG {
        
        let result = HORIZONTAL_LAYOUT_LONG()
        
        let heroSpacingSqueezed = layoutSchemeType.getHeroSpacingLong(orientation: orientation,squeeze: .squeezed)
        let heroSpacingStandard = layoutSchemeType.getHeroSpacingLong(orientation: orientation,squeeze: .standard)
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
        
        let heroWidth = nameLabelWidth + iconMainWidth
        var consumed = (heroWidth + iconSecondaryWidth)
        
        _ = result.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                           left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
        _ = result.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                     left: heroLeftSqueezed, right: heroRightSqueezed)
        _ = result.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                      left: slaveLeftSqueezed, right: slaveRightSqueezed)
        _ = result.expandHeroSpacingFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                            space: heroSpacingSqueezed)
        
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
            if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: slaveLeftStandard, right: slaveRightStandard) {
                isLooping = true
            }
            if result.expandHeroSpacingOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                               space: heroSpacingStandard) {
                isLooping = true
            }
        }
        
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
            if result.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: slaveLeftRelaxed, right: slaveRightRelaxed) {
                isLooping = true
            }
            if result.expandHeroSpacingOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                               space: heroSpacingRelaxed) {
                isLooping = true
            }
        }
        return result
    }
    
      
    
    
}
