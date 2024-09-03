//
//  MagicalFavoringOneLineLabelContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalFavoringOneLineLabelContent: View {
    @Environment(MagicalFavoringOneLineLabelViewModel.self) var magicalFavoringOneLineLabelViewModel: MagicalFavoringOneLineLabelViewModel
    
    let orientation: Orientation
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        
        let configuration = magicalFavoringOneLineLabelViewModel.favoringOneLineLabelConfiguration
        
        
        let line1: String?
        let line2: String?
        let numberOfLines: Int
        let nameLabelTextWidth: Int
        if magicalFavoringOneLineLabelViewModel.isTwoLine {
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
        
        let contentHeight = magicalFavoringOneLineLabelViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let color = Color.white
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            ZStack {
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
                         color: color)
            }
            .frame(height: CGFloat(contentHeight))
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalFavoringOneLineLabelViewModel.layoutHeight))
        
    }
}
