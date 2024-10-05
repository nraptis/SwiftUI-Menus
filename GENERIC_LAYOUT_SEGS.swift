//
//  GENERIC_LAYOUT_SEGS.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import Foundation

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


struct GENERIC_SEGMENT_LAYOUT {
    
    
    //static func
    static func computeLong(layoutSchemeType: LayoutScheme.Type,
                            layoutWidth: Int,
                            orientation: Orientation,
                            nameLabelWidthArray: [Int],
                            numberOfLinesArray: [Int],
                            iconPackMainArray: [(any TextIconPackable)],
                            iconPackSecondaryArray: [(any TextIconPackable)?],
                            neighborTypeLeft: ToolInterfaceElementType?,
                            neighborTypeRight: ToolInterfaceElementType?) -> [HORIZONTAL_LAYOUT_LONG] {
        
        var chunks = [HORIZONTAL_LAYOUT_SEGMENT_CHUNK]()
        
        var count = nameLabelWidthArray.count
        if nameLabelWidthArray.count < count { count = nameLabelWidthArray.count }
        if numberOfLinesArray.count < count { count = numberOfLinesArray.count }
        if iconPackMainArray.count < count { count = iconPackMainArray.count }
        
        var index = 0
        while index < count {
            let nameLabelWidth = nameLabelWidthArray[index]
            let numberOfLines = numberOfLinesArray[index]
            let iconPackMain = iconPackMainArray[index]
            var iconPackSecondary: (any TextIconPackable)?
            if index < iconPackSecondaryArray.count {
                iconPackSecondary = iconPackSecondaryArray[index]
            }
            let chunk = HORIZONTAL_LAYOUT_SEGMENT_CHUNK(nameLabelWidth: nameLabelWidth,
                                                        numberOfLines: numberOfLines,
                                                        iconPackMain: iconPackMain,
                                                        iconPackSecondary: iconPackSecondary)
            chunks.append(chunk)
        }
        
        
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
        
        var consumed = 0
        
        for chunk in chunks {
            
            let nameLabelWidth = chunk.nameLabelWidth
            let numberOfLines = chunk.numberOfLines
            let iconMain = chunk.iconPackMain.getTextIcon(orientation: orientation,
                                                          layoutSchemeFlavor: .long,
                                                          numberOfLines: numberOfLines,
                                                          isDarkMode: false,
                                                          isEnabled: true)
            
            let iconMainWidth = iconMain.width
            let iconSecondaryWidth: Int
            if let iconPackSecondary = chunk.iconPackSecondary {
                let iconSecondary = iconPackSecondary.getTextIcon(orientation: orientation,
                                                                  layoutSchemeFlavor: .long,
                                                                  numberOfLines: numberOfLines,
                                                                  isDarkMode: false,
                                                                  isEnabled: true)
                iconSecondaryWidth = iconSecondary.width
            } else {
                iconSecondaryWidth = 0
            }
            
            consumed += nameLabelWidth
            consumed += iconMainWidth
            consumed += iconSecondaryWidth
        }
        
        for chunk in chunks {
            let layout = chunk.layout
            _ = layout.expandOutsideBoxFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                               left: outsideBoxLeftSqueezed, right: outsideBoxRightSqueezed)
            _ = layout.expandHeroFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                         left: heroLeftSqueezed, right: heroRightSqueezed)
            _ = layout.expandSlaveFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                          left: slaveLeftSqueezed, right: slaveRightSqueezed)
            _ = layout.expandHeroSpacingFilling(consumed: &consumed, layoutWidth: layoutWidth,
                                                space: heroSpacingSqueezed)
        }
        
        var isLooping = true
        
        while isLooping {
            isLooping = false
            for chunk in chunks {
                let layout = chunk.layout
                if layout.expandOutsideBoxOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                                  left: outsideBoxLeftStandard, right: outsideBoxRightStandard) {
                    isLooping = true
                }
                if layout.expandHeroOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                            left: heroLeftStandard, right: heroRightStandard) {
                    isLooping = true
                }
                if layout.expandSlaveOnce(consumed: &consumed, layoutWidth: layoutWidth,
                                             left: slaveLeftStandard, right: slaveRightStandard) {
                    isLooping = true
                }
            }
        }
        
        
        
        var result = [HORIZONTAL_LAYOUT_LONG]()
        for chunk in chunks {
            result.append(chunk.layout)
        }
        return result
    }
    
}
