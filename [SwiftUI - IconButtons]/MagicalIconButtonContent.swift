//
//  MagicalIconButtonContent.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalIconButtonContent: View {
    
    @Environment(MagicalIconButtonViewModel.self) var magicalIconButtonViewModel: MagicalIconButtonViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isPressed: Bool
    let isDarkMode: Bool
    let isEnabled: Bool
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        
        let configuration = magicalIconButtonViewModel.iconButtonConfiguration
        let isDarkMode = magicalIconButtonViewModel.isDarkModeEnabled
        let textIcon = configuration.getTextIcon(orientation: orientation,
                                                 isDarkMode: isDarkMode,
                                                 isEnabled: isEnabled)
        
        let iconWidth = textIcon.width
        let iconHeight = textIcon.height
        
        let iconPaddingLeft = magicalIconButtonViewModel.iconPaddingLeft
        let iconPaddingRight = magicalIconButtonViewModel.iconPaddingRight
        let iconPaddingTop = IconButtonLayout.getIconPaddingTop(orientation: orientation,
                                                                    flavor: layoutSchemeFlavor,
                                                                    numberOfLines: 0)
        
        let contentHeight = magicalIconButtonViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        let contextPaddingTop = IconButtonLayout.getContextPaddingTop(orientation: orientation)
        let contextPaddingBottom = IconButtonLayout.getContextPaddingBottom(orientation: orientation)
        let contextCornerRadius = IconButtonLayout.getContextCornerRadius(orientation: orientation)
        var contextPaddingLeft: Int
        var contextPaddingRight: Int
        if Device.isPad {
            contextPaddingLeft = 2
            contextPaddingRight = 2
        } else {
            contextPaddingLeft = 1
            contextPaddingRight = 1
        }
        
        let contextColor: Color
        if isDarkMode {
            contextColor = ToolInterfaceTheme.contextUnderlayEnabledDark
        } else {
            contextColor = ToolInterfaceTheme.contextUnderlayEnabledLight
        }
        
        let color: Color
        
        if isPressed {
            if isEnabled {
                color = ToolInterfaceTheme.primaryDownEnabled
            } else {
                color = ToolInterfaceTheme.primaryDownDisabled
            }
        } else {
            
            if isDarkMode {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledDark
                } else {
                    color = ToolInterfaceTheme.primaryDisabledDark
                }
            } else {
                if isEnabled {
                    color = ToolInterfaceTheme.primaryEnabledLight
                } else {
                    color = ToolInterfaceTheme.primaryDisabledLight
                }
            }
        }
        
        return ZStack {
            
            if isPressed {
                HStack(spacing: 0.0) {
                    Spacer()
                        .frame(width: CGFloat(contextPaddingLeft))
                    
                    VStack(spacing: 0.0) {
                        Spacer()
                            .frame(height: CGFloat(contextPaddingTop))
                        RoundedRectangle(cornerRadius: CGFloat(contextCornerRadius))
                            .foregroundColor(contextColor)
                        Spacer()
                            .frame(height: CGFloat(contextPaddingBottom))
                    }
                    Spacer()
                        .frame(width: CGFloat(contextPaddingRight))
                }
            }
            
            VStack(spacing: 0.0) {
                
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
                        IconBox(icon: textIcon,
                                iconWidth: iconWidth,
                                iconHeight: iconHeight,
                                iconPaddingLeft: iconPaddingLeft,
                                iconPaddingRight: iconPaddingRight,
                                iconPaddingTop: iconPaddingTop,
                                color: color)
                    }
                    .frame(height: CGFloat(contentHeight))
                    
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
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
    }
}

