//
//  HeroSlab.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 10/4/24.
//

import SwiftUI

struct HeroSlab: View {
    
    let orientation: Orientation
    let layoutWidth: Int
    let layoutHeight: Int
    let isLong: Bool
    let isPressed: Bool
    let textIcon: any TextIconable
    let heroPaddingLeft: Int
    let heroPaddingRight: Int
    let heroPaddingTopStacked: Int
    let heroPaddingBottomStacked: Int
    let heroSpacingLong: Int
    let line1: String?
    let line2: String?
    let numberOfLines: Int
    let nameLabelVerticalSpacing: Int
    let nameLabelFont: UIFont
    let nameLabelWidth: Int
    let lineHeight: Int
    let nameLabelColor: Color
    var body: some View {
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let heroWidth: Int
        if isLong {
            heroWidth = nameLabelWidth + iconWidth + heroSpacingLong
        } else {
            let textAndIconWidth = max(iconWidth, nameLabelWidth)
            heroWidth = textAndIconWidth
        }
        
        return HStack(spacing: 0.0) {
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(heroPaddingLeft), height: 24.0)
                .background(Color(red: 0.75, green: 0.45, blue: 0.62, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(heroPaddingLeft))
#endif
            
            if isLong {
                HStack(spacing: 0.0) {
                    
                    
                    IconBoxMainTab(icon: textIcon,
                                   iconWidth: iconWidth,
                                   iconHeight: iconHeight,
                                   iconPaddingLeft: 0,
                                   iconPaddingRight: 0,
                                   iconPaddingTop: 0)
                    .opacity(isPressed ? 0.75 : 1.0)
                    
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(heroSpacingLong), height: 24.0)
                        .background(Color(red: 0.75, green: 0.45, blue: 0.62, opacity: 0.40))
#else
                    Spacer()
                        .frame(width: CGFloat(heroSpacingLong))
#endif
                    
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
                .frame(width: CGFloat(heroWidth),
                       height: CGFloat(layoutHeight))
            } else {
                ZStack {
                    VStack(spacing: 0.0) {
                        IconBoxMainTab(icon: textIcon,
                                       iconWidth: iconWidth,
                                       iconHeight: iconHeight,
                                       iconPaddingLeft: 0,
                                       iconPaddingRight: 0,
                                       iconPaddingTop: heroPaddingTopStacked)
                        .opacity(isPressed ? 0.75 : 1.0)
                        Spacer(minLength: 0.0)
                    }
                    VStack(spacing: 0.0) {
                        Spacer(minLength: 0.0)
                        LabelBox(line1: line1,
                                 line2: line2,
                                 numberOfLines: numberOfLines,
                                 width: nameLabelWidth,
                                 paddingLeft: 0,
                                 paddingRight: 0,
                                 paddingBottom: heroPaddingBottomStacked,
                                 lineHeight: lineHeight,
                                 spacingVertical: nameLabelVerticalSpacing,
                                 font: nameLabelFont,
                                 color: nameLabelColor)
                    }
                }
                .frame(width: CGFloat(heroWidth),
                       height: CGFloat(layoutHeight))
            }
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(heroPaddingRight), height: 24.0)
                .background(Color(red: 0.75, green: 0.45, blue: 0.62, opacity: 0.70))
#else
            Spacer()
                .frame(width: CGFloat(heroPaddingRight))
#endif

             
            Spacer(minLength: 0.0)
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(layoutHeight))
//#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 1.0, green: 0.15, blue: 0.75, opacity: 0.85),
                                    Color(red: 1.0, green: 0.32, blue: 0.55, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(RoundedRectangle(cornerRadius: 12.0).foregroundStyle(Color.orange.opacity(0.25)))
        //#endif
        
    }
}
