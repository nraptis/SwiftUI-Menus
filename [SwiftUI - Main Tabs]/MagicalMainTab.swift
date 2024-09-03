//
//  MagicalMainTab.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTab: View {
    
    @Environment(MagicalMainTabViewModel.self) var magicalMainTabViewModel: MagicalMainTabViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalMainTabViewModel.layoutWidth),
               height: CGFloat(magicalMainTabViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.45, green: 0.96, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.55, green: 0.65, blue: 0.31, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.48, green: 0.78, blue: 0.55, opacity: 0.15),
                                    Color(red: 0.65, green: 0.45, blue: 0.78, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalMainTabViewModel.layoutX),
                y: CGFloat(magicalMainTabViewModel.layoutY))
        //.disabled(!magicalMainTabViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalMainTabViewModel.orientation
        let layoutSchemeFlavor = magicalMainTabViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalMainTabViewModel.universalPaddingLeft
        let universalPaddingRight = magicalMainTabViewModel.universalPaddingRight
        
        let layoutWidth = magicalMainTabViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
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
                
                MagicalMainTabGuts(orientation: orientation,
                                                  layoutSchemeFlavor: layoutSchemeFlavor,
                                                  layoutWidth: layoutWidth)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalMainTabViewModel.layoutHeight))
            
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
