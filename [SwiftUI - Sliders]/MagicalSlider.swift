//
//  MagicalSlider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/30/24.
//

import SwiftUI

struct MagicalSlider: View {
    
    @Environment(MagicalSliderViewModel.self) var magicalViewModel
    
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
        
        let outsideBoxPaddingTop = SliderLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingBottom = SliderLayout.getOutsideBoxPaddingBottom(orientation: orientation)
        let boxWidth = magicalViewModel.layoutWidth - magicalViewModel.outsideBoxPaddingLeft - magicalViewModel.outsideBoxPaddingRight
        let boxHeight = magicalViewModel.layoutHeight - outsideBoxPaddingTop - outsideBoxPaddingBottom
        
        let contextCornerRadius = SliderLayout.getContextCornerRadius(orientation: orientation)
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
        let outsideBoxPaddingTop = SliderLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingBottom = SliderLayout.getOutsideBoxPaddingBottom(orientation: orientation)
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
                
                MagicalSliderGuts(layoutSchemeFlavor: layoutSchemeFlavor,
                                  layoutWidth: contentLayoutWidth,
                                  layoutHeight: contentLayoutHeight)
                
                /*
                MagicalSexyButtonContent(layoutSchemeFlavor: layoutSchemeFlavor,
                                                isPressed: isPressed,
                                                layoutWidth: contentLayoutWidth,
                                                layoutHeight: contentLayoutHeight)
                */
                
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


/*
struct MagicalSlider: View {
    @Environment(MagicalSliderViewModel.self) var magicalSliderViewModel: MagicalSliderViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSliderViewModel.layoutWidth),
               height: CGFloat(magicalSliderViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalSliderViewModel.layoutX),
                y: CGFloat(magicalSliderViewModel.layoutY))
        .disabled(!magicalSliderViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalSliderViewModel.orientation
        let configuration = magicalSliderViewModel.sliderConfiguration
        let layoutSchemeFlavor = magicalSliderViewModel.getLayoutSchemeFlavor()
        
        let line1 = configuration.nameLabelLine1
        let line2 = configuration.nameLabelLine2
        
        let numberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: line1, line2: line2)
        
        let universalPaddingLeft = magicalSliderViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSliderViewModel.universalPaddingRight
        let universalPaddingTop = SliderLayout.getUniversalPaddingTop(orientation: orientation,
                                                                      flavor: layoutSchemeFlavor,
                                                                      numberOfLines: numberOfLines)
        let universalPaddingBottom = SliderLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                            flavor: layoutSchemeFlavor,
                                                                            numberOfLines: numberOfLines)
        
        let contextPaddingTop = SliderLayout.getContextPaddingTop(orientation: orientation)
        let contextPaddingBottom = SliderLayout.getContextPaddingBottom(orientation: orientation)
        let contextCornerRadius = SliderLayout.getContextCornerRadius(orientation: orientation)
        
        let contextColor: Color
        
        if magicalSliderViewModel.isDarkModeEnabled {
            if magicalSliderViewModel.isEnabled {
                contextColor = ToolInterfaceTheme.contextUnderlayEnabledDark
            } else {
                contextColor = ToolInterfaceTheme.contextUnderlayDisabledDark
            }
        } else {
            if magicalSliderViewModel.isEnabled {
                contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
            } else {
                contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
            }
        }
        
        let layoutWidth = magicalSliderViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        let layoutHeight = magicalSliderViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return VStack(spacing: 0.0) {
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingTop))
                .background(Color(red: 0.85, green: 0.65, blue: 0.55, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingTop))
#endif
            
            HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                    .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft))
#endif
                
                ZStack {
                    VStack(spacing: 0.0) {
                        Spacer()
                            .frame(height: CGFloat(contextPaddingTop))
                        RoundedRectangle(cornerRadius: CGFloat(contextCornerRadius))
                            .foregroundStyle(contextColor)
                        Spacer()
                            .frame(height: CGFloat(contextPaddingBottom))
                    }
                    MagicalSliderGuts(orientation: orientation,
                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                      line1: line1,
                                      line2: line2,
                                      numberOfLines: numberOfLines,
                                      layoutWidth: layoutWidth,
                                      layoutHeight: layoutHeight)
                }
                
                .frame(width: CGFloat(layoutWidth),
                       height: CGFloat(layoutHeight))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                    .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight))
#endif
                
            }
#if INTERFACE_HINTS
            Spacer()
                .frame(width: 24.0, height: CGFloat(universalPaddingBottom))
                .background(Color(red: 0.65, green: 0.85, blue: 0.75, opacity: 0.40))
#else
            Spacer()
                .frame(height: CGFloat(universalPaddingBottom))
#endif
        }
    }
}
*/
