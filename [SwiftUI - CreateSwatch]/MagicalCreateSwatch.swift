//
//  MagicalCreateSwatch.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

struct MagicalCreateSwatch: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalCreateSwatchViewModel.layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.62, opacity: 0.85),
                                    Color(red: 0.65, green: 0.55, blue: 0.51, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.78, green: 0.48, blue: 0.45, opacity: 0.15),
                                    Color(red: 0.45, green: 0.65, blue: 0.58, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalCreateSwatchViewModel.layoutX),
                y: CGFloat(magicalCreateSwatchViewModel.layoutY))
        //.disabled(!magicalCreateSwatchViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalCreateSwatchViewModel.orientation
        let layoutSchemeFlavor = magicalCreateSwatchViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalCreateSwatchViewModel.universalPaddingLeft
        let universalPaddingRight = magicalCreateSwatchViewModel.universalPaddingRight
        
        let layoutWidth = magicalCreateSwatchViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
        return HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 0.65, green: 0.45, blue: 0.85, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            
            ZStack {
                
                MagicalCreateSwatchGuts(orientation: orientation,
                                                  layoutSchemeFlavor: layoutSchemeFlavor,
                                                  layoutWidth: layoutWidth)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 0.5, green: 1.0, blue: 0.65, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
        }
    }
}
