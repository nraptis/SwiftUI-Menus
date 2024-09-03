//
//  MagicallFavoringOneLineLabel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalFavoringOneLineLabel: View {
    
    @Environment(MagicalFavoringOneLineLabelViewModel.self) var magicalFavoringOneLineLabelViewModel: MagicalFavoringOneLineLabelViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalFavoringOneLineLabelViewModel.layoutWidth),
               height: CGFloat(magicalFavoringOneLineLabelViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalFavoringOneLineLabelViewModel.layoutX),
                y: CGFloat(magicalFavoringOneLineLabelViewModel.layoutY))
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalFavoringOneLineLabelViewModel.orientation
        let layoutSchemeFlavor = magicalFavoringOneLineLabelViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalFavoringOneLineLabelViewModel.universalPaddingLeft
        let universalPaddingRight = magicalFavoringOneLineLabelViewModel.universalPaddingRight
        
        let universalPaddingTop = FavoringOneLineLabelLayout.getUniversalPaddingTop(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: 0)
        let universalPaddingBottom = FavoringOneLineLabelLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                 flavor: layoutSchemeFlavor,
                                                                                 numberOfLines: 0)
        
        let layoutWidth = magicalFavoringOneLineLabelViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
        return HStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 0.25, green: 0.95, blue: 0.45, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            ZStack {
                
                MagicalFavoringOneLineLabelContent(orientation: orientation,
                                                   universalPaddingTop: universalPaddingTop,
                                                   universalPaddingBottom: universalPaddingBottom,
                                                   layoutWidth: layoutWidth)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalFavoringOneLineLabelViewModel.layoutHeight))
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 0.7, green: 0.55, blue: 0.65, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
        }
        .frame(width: CGFloat(magicalFavoringOneLineLabelViewModel.layoutWidth),
               height: CGFloat(magicalFavoringOneLineLabelViewModel.layoutHeight))
    }
}
