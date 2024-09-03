//
//  MagicalGreenButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalGreenButton: View {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalGreenButtonViewModel: MagicalGreenButtonViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalGreenButtonViewModel.layoutWidth),
               height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalGreenButtonViewModel.layoutX),
                y: CGFloat(magicalGreenButtonViewModel.layoutY))
        .disabled(!magicalGreenButtonViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalGreenButtonViewModel.orientation
        let configuration = magicalGreenButtonViewModel.greenButtonConfiguration
        let layoutSchemeFlavor = magicalGreenButtonViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalGreenButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalGreenButtonViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let universalPaddingTop = GreenButtonLayout.getUniversalPaddingTop(orientation: orientation,
                                                                           flavor: layoutSchemeFlavor,
                                                                           numberOfLines: numberOfLines)
        let universalPaddingBottom = GreenButtonLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                 flavor: layoutSchemeFlavor,
                                                                                 numberOfLines: numberOfLines)
        
        let layoutWidth = magicalGreenButtonViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
        return HStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            
            ZStack {
                
                MagicalGreenButtonButton(orientation: orientation,
                                         layoutSchemeFlavor: layoutSchemeFlavor,
                                         universalPaddingTop: universalPaddingTop,
                                         universalPaddingBottom: universalPaddingBottom,
                                         layoutWidth: layoutWidth)
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
            
            
        }
        .frame(width: CGFloat(magicalGreenButtonViewModel.layoutWidth),
               height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
    }
}
