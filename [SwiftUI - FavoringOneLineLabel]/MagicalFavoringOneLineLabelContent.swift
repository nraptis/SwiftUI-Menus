//
//  MagicalFavoringOneLineLabelContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalFavoringOneLineLabelContent: View {
    
    @Environment(MagicalFavoringOneLineLabelViewModel.self) var magicalViewModel
    
    let layoutWidth: Int
    let layoutHeight: Int
    
    var body: some View {
        
        let orientation = magicalViewModel.orientation
        let configuration = magicalViewModel.favoringOneLineLabelConfiguration
        
        let line1: String?
        let line2: String?
        let numberOfLines: Int
        let nameLabelTextWidth: Int
        if magicalViewModel.isTwoLine {
            numberOfLines = 2
            line1 = configuration.twoLineText1
            line2 = configuration.twoLineText2
            nameLabelTextWidth = configuration.twoLineWidth
        } else {
            numberOfLines = 1
            line1 = configuration.oneLineText
            line2 = nil
            nameLabelTextWidth = configuration.oneLineWidth
        }
        
        let nameLabelFont = FavoringOneLineLabelLayout.getNameLabelFont(orientation: orientation,
                                                                        flavor: .long)
        
        let nameLabelVerticalSpacing = FavoringOneLineLabelLayout.getNameLabelVerticalSpacing(orientation: orientation,
                                                                                              flavor: .long)
        
        let lineHeight = ToolInterfaceTheme.getLineHeight(font: nameLabelFont)
        let nameLabelWidth = nameLabelTextWidth
        
        let nameLabelColor: Color
        if magicalViewModel.isDarkModeEnabled {
            if magicalViewModel.isEnabled {
                nameLabelColor = ToolInterfaceTheme.primaryEnabledDark
            } else {
                nameLabelColor = ToolInterfaceTheme.primaryDisabledDark
            }
        } else {
            if magicalViewModel.isEnabled {
                nameLabelColor = ToolInterfaceTheme.primaryEnabledLight
            } else {
                nameLabelColor = ToolInterfaceTheme.primaryDisabledLight
            }
        }
        
        return ZStack {
            LabelBox(line1: line1,
                     line2: line2,
                     numberOfLines: numberOfLines,
                     width: nameLabelWidth,
                     paddingLeft: 0,
                     paddingRight: 0,
                     paddingBottom: 0,
                     lineHeight: lineHeight,
                     spacingVertical: nameLabelVerticalSpacing,
                     font: nameLabelFont,
                     color: nameLabelColor)
        }
        .frame(width: CGFloat(layoutWidth), height: CGFloat(layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.55, blue: 0.85, opacity: 0.85),
                                    Color(red: 0.75, green: 0.98, blue: 0.75, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Color(red: 0.96, green: 0.55, blue: 0.85, opacity: 0.45))
#endif
        
    }
}
