//
//  MagicalSexyCheckBoxButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyCheckBoxButtonStyle: ButtonStyle {
    
    @Environment(MagicalSexyCheckBoxViewModel.self) var magicalSexyCheckBoxViewModel: MagicalSexyCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isDarkMode: Bool
    let isEnabled: Bool
    let isChecked: Bool
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    func makeBody(configuration: Configuration) -> some View {
        
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
                .transaction { transaction in
                    transaction.animation = nil
                }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        let buttonUniversalPaddingLeft = magicalSexyCheckBoxViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalSexyCheckBoxViewModel.buttonUniversalPaddingRight
        return ZStack() {
            
            HStack(spacing: 0.0) {
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                    .background(Color(red: 1.0, green: 0.85, blue: 0.95, opacity: 0.60))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingLeft))
                
#endif
                
                HStack(spacing: 0.0) {
                    
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingLeft), height: 28.0)
                        .background(Color(red: 1.0, green: 0.85, blue: 0.95, opacity: 0.60))
#else
                    Spacer()
                        .frame(width: CGFloat(universalPaddingLeft))
                    
#endif
                    
                    HStack {
                        Spacer()
                        VStack {
                            Spacer()
                        }
                    }
                    
#if INTERFACE_HINTS
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingRight), height: 28.0)
                        .background(Color(red: 0.3, green: 0.9, blue: 0.9, opacity: 0.60))
#else
                    Spacer()
                        .frame(width: CGFloat(buttonUniversalPaddingRight))
                    
#endif
                    
                }
                .background(getStrokeRect(isPressed: isPressed))
                .background(getFillRect(isPressed: isPressed))
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                    .background(Color(red: 0.65, green: 0.45, blue: 0.55, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight))
                
#endif
            }
            
            
            MagicalSexyCheckBoxContent(orientation: orientation,
                                       layoutSchemeFlavor: layoutSchemeFlavor,
                                       isPressed: isPressed,
                                       isDarkMode: isDarkMode,
                                       isEnabled: isEnabled,
                                       isChecked: isChecked,
                                       universalPaddingLeft: universalPaddingLeft,
                                       universalPaddingRight: universalPaddingRight,
                                       universalPaddingTop: universalPaddingTop,
                                       universalPaddingBottom: universalPaddingBottom,
                                       layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
        
    }
    
    func getStrokeRect(isPressed: Bool) -> some View {
        
        let cornerRadius = CheckBoxLayout.getCornerRadius(orientation: orientation)
        let lineThickness = CheckBoxLayout.getLineThickness(orientation: orientation)
        
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
        
        let height = magicalSexyCheckBoxViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(layoutWidth - universalPaddingLeft - universalPaddingRight),
               height: CGFloat(height))
        .foregroundStyle(color)
        /*
         return HStack(spacing: 0.0) {
         RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
         .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
         }
         .frame(width: CGFloat(layoutWidth),
         height: CGFloat(height))
         .foregroundStyle(color)
         */
    }
    
    func getFillRect(isPressed: Bool) -> some View {
        
        let cornerRadius = CheckBoxLayout.getCornerRadius(orientation: orientation)
        var height = magicalSexyCheckBoxViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledDark
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledDark
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledDark
                }
            }
        } else {
            if isEnabled {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownEnabledLight
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
                }
            } else {
                if isPressed {
                    color = ToolInterfaceTheme.contextUnderlayDownDisabledLight
                } else {
                    color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledLight
                }
            }
        }
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
        }
        .frame(width: CGFloat(layoutWidth - universalPaddingLeft - universalPaddingRight),
               height: CGFloat(height))
        .foregroundStyle(color)
        
    }
}
