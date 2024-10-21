//
//  MagicalButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalButtonViewModel.self) var magicalViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            
            if configuration.isPressed {
                getBox()
            }
            bodyContent(isPressed: configuration.isPressed)
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func getBox() -> some View {
        
        let boxWidth = magicalViewModel.layoutWidth - magicalViewModel.outsideBoxPaddingLeft - magicalViewModel.outsideBoxPaddingRight
        let boxHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        let contextCornerRadius = ButtonLayout.getCornerRadius(orientation: magicalViewModel.orientation)
        let contextColor: Color
        if magicalViewModel.isDarkModeEnabled {
            contextColor = ToolInterfaceTheme.contextUnderlayEnabledDark
        } else {
            contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
        }
        
        return HStack(spacing: 0.0) {
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
            
            VStack(spacing: 0.0) {
                
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingTop))
                
                RoundedRectangle(cornerRadius: CGFloat(contextCornerRadius))
                    .frame(width: CGFloat(boxWidth),
                           height: CGFloat(boxHeight))
                    .foregroundStyle(contextColor)
                
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
                
                
            }
            
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
        }
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        
        let contentLayoutWidth = magicalViewModel.layoutWidth - magicalViewModel.outsideBoxPaddingLeft - magicalViewModel.outsideBoxPaddingRight
        let contentLayoutHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        return HStack(spacing: 0.0) {
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft), height: 24.0)
                .background(Color(red: 0.58, green: 0.26, blue: 0.56, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingLeft))
#endif
            
            VStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingTop))
                    .background(Color(red: 0.43, green: 0.78, blue: 0.61, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingTop))
#endif
                
                MagicalButtonContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                         isPressed: isPressed,
                                         layoutWidth: contentLayoutWidth,
                                         layoutHeight: contentLayoutHeight)
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: 24.0, height: CGFloat(outsideBoxPaddingBottom))
                    .background(Color(red: 0.78, green: 0.31, blue: 0.92, opacity: 0.40))
#else
                Spacer()
                    .frame(height: CGFloat(outsideBoxPaddingBottom))
#endif
                
            }
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight), height: 24.0)
                .background(Color(red: 0.81, green: 0.96, blue: 0.57, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(magicalViewModel.outsideBoxPaddingRight))
#endif
        }
    }
}
