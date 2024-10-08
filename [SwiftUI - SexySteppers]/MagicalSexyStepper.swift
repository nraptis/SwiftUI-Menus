//
//  MagicalSexyStepper.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

struct MagicalSexyStepper: View {
    
    @Environment(MagicalSexyStepperViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
            getBox()
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
    
    func getBox() -> some View {
        
        let orientation = magicalViewModel.orientation
        
        let outsideBoxPaddingTop = SexyStepperLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingBottom = SexyStepperLayout.getOutsideBoxPaddingBottom(orientation: orientation)
        let boxWidth = magicalViewModel.layoutWidth - magicalViewModel.outsideBoxPaddingLeft - magicalViewModel.outsideBoxPaddingRight
        let boxHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        let contextCornerRadius = SexyStepperLayout.getContextCornerRadius(orientation: orientation)
        let contextColor: Color
        if magicalViewModel.isDarkModeEnabled {
            if magicalViewModel.isEnabled {
                contextColor = ToolInterfaceTheme.contextUnderlayEnabledDark
            } else {
                contextColor = ToolInterfaceTheme.contextUnderlayDisabledDark
            }
        } else {
            if magicalViewModel.isEnabled {
                contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
            } else {
                contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
            }
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
    
    func bodyContent() -> some View {
        
        let orientation = magicalViewModel.orientation
        let layoutSchemeFlavor = magicalViewModel.getLayoutSchemeFlavor()
        let outsideBoxPaddingTop = SexyStepperLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingBottom = SexyStepperLayout.getOutsideBoxPaddingBottom(orientation: orientation)
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
                
                
                MagicalSexyStepperContent(layoutSchemeFlavor: layoutSchemeFlavor,
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
