//
//  MagicallFavoringOneLineLabel.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalFavoringOneLineLabel: View {
    
    @Environment(MagicalFavoringOneLineLabelViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalViewModel.layoutX),
                y: CGFloat(magicalViewModel.layoutY))
        .disabled(!magicalViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let outsideBoxPaddingLeft = magicalViewModel.outsideBoxPaddingLeft
        let outsideBoxPaddingRight = magicalViewModel.outsideBoxPaddingRight
        
        let outsideBoxPaddingTop = FavoringOneLineLabelLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        let outsideBoxPaddingBottom = FavoringOneLineLabelLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        
        let contentLayoutWidth = magicalViewModel.layoutWidth - outsideBoxPaddingLeft - outsideBoxPaddingRight
        let contentLayoutHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        return VStack(spacing: 0.0) {
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                .background(Color(red: 0.86, green: 0.65, blue: 0.98, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
            HStack(spacing: 0.0) {
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(outsideBoxPaddingLeft), height: 24.0)
                    .background(Color(red: 0.73, green: 0.91, blue: 0.97, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(outsideBoxPaddingLeft))
#endif
                
                MagicalFavoringOneLineLabelContent(layoutWidth: contentLayoutWidth,
                                                   layoutHeight: contentLayoutHeight)
                
#if INTERFACE_HINTS
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(outsideBoxPaddingRight), height: 24.0)
                    .background(Color(red: 0.92, green: 0.55, blue: 0.75, opacity: 0.40))
#else
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(outsideBoxPaddingRight))
#endif
            }
            
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                .background(Color(red: 0.88, green: 0.88, blue: 0.61, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
            
        }
        
    }
    
}
