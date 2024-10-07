//
//  MagicalSliderGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/31/24.
//

import SwiftUI

struct MagicalSliderGuts: View {
    
    @Environment(MagicalSliderViewModel.self) var magicalViewModel: MagicalSliderViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.sliderConfiguration
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let nameLabelFont = SliderLayout.getNameLabelFont(orientation: orientation,
                                                          flavor: layoutSchemeFlavor)
        let heroPaddingLeft = magicalViewModel.heroPaddingLeft
        let heroPaddingRight = magicalViewModel.heroPaddingRight
        let nameLabelVerticalSpacing = SliderLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                flavor: layoutSchemeFlavor)
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let valueLabelFont = SliderLayout.getValueLabelFont(orientation: orientation, flavor: layoutSchemeFlavor)
        
        let slavePaddingLeft = magicalViewModel.slavePaddingLeft
        let slavePaddingRight = magicalViewModel.slavePaddingRight
        
        let realNameLabelTextWidth: Int
        let layoutNameLabelTextWidth: Int
        let valueLabelTextWidth: Int
        switch layoutSchemeFlavor {
        case .long, .stackedLarge:
            realNameLabelTextWidth = configuration.realNameLabelWidthLarge
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthLarge
            valueLabelTextWidth = configuration.valueLabelWidthLarge
        case .stackedMedium:
            realNameLabelTextWidth = configuration.realNameLabelWidthMedium
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthMedium
            valueLabelTextWidth = configuration.valueLabelWidthMedium
        case .stackedSmall:
            realNameLabelTextWidth = configuration.realNameLabelWidthSmall
            layoutNameLabelTextWidth = configuration.layoutNameLabelWidthSmall
            valueLabelTextWidth = configuration.valueLabelWidthSmall
        }
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = realNameLabelTextWidth + heroPaddingLeft + heroPaddingRight
        
        let valueLabelWidth = slavePaddingLeft + valueLabelTextWidth + slavePaddingRight
        
        let nameLabelSpace = layoutNameLabelTextWidth + heroPaddingLeft + heroPaddingRight
        
        var extraPaddingLeft = (layoutNameLabelTextWidth - realNameLabelTextWidth)
        if extraPaddingLeft < 0 {
            extraPaddingLeft = 0
        }
        
        let textColor: Color
        if magicalViewModel.isDarkModeEnabled {
            if magicalViewModel.isEnabled {
                textColor = ToolInterfaceTheme.primaryEnabledDark
            } else {
                textColor = ToolInterfaceTheme.primaryDisabledDark
            }
        } else {
            if magicalViewModel.isEnabled {
                textColor = ToolInterfaceTheme.primaryEnabledLight
            } else {
                textColor = ToolInterfaceTheme.primaryDisabledLight
            }
        }
        
        return HStack(spacing: 0.0) {
            
            HStack {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(extraPaddingLeft), height: 33)
                    .background(Color.yellow.opacity(0.5))
#else
                Spacer()
                    .frame(width: CGFloat(extraPaddingLeft))
#endif
                
                LabelBoxRightAligned(line1: line1,
                         line2: line2,
                         numberOfLines: numberOfLines,
                         width: nameLabelWidth,
                         paddingLeft: heroPaddingLeft,
                         paddingRight: heroPaddingRight,
                         paddingBottom: 0,
                         lineHeight: lineHeight,
                         spacingVertical: nameLabelVerticalSpacing,
                         font: nameLabelFont,
                         color: textColor)
            }
            .frame(width: CGFloat(nameLabelSpace), height: CGFloat(layoutHeight))
#if INTERFACE_HINTS
            .background(Color.pink.opacity(0.5))
#endif
            
            MagicalSliderBar()
#if INTERFACE_HINTS
                .overlay(RoundedRectangle(cornerRadius: 2.0).stroke().foregroundStyle(Color.red.opacity(0.85)))
#endif
            
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(slavePaddingLeft), height: 12.0)
                    .background(Color(red: 0.98, green: 0.65, blue: 0.125, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(slavePaddingLeft))
#endif
                
                
                Text(magicalViewModel.getValueString())
                        .font(Font(valueLabelFont))
                        .fixedSize(horizontal: true, vertical: false)
                        .foregroundColor(textColor)
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(height: 12.0)
                    .background(Color(red: 0.98, green: 1.0, blue: 0.98, opacity: 0.5))
#else
                Spacer(minLength: 0.0)
#endif
                
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(slavePaddingRight), height: 12.0)
                    .background(Color(red: 0.98, green: 0.65, blue: 0.125, opacity: 0.5))
#else
                Spacer()
                    .frame(width: CGFloat(slavePaddingRight))
#endif
                
            }
            .frame(width: CGFloat(valueLabelWidth))
        }
    }
}
