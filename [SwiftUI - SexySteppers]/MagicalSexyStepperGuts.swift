//
//  MagicalSexyStepperGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

struct MagicalSexyStepperGuts: View {
    
    @Environment(MagicalSexyStepperViewModel.self) var magicalSexyStepperViewModel: MagicalSexyStepperViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isDarkMode: Bool
    let isEnabled: Bool
    
    let isIncrementEnabled: Bool
    let isDecrementEnabled: Bool
    
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    let valueString: String
    var body: some View {
        
        return ZStack {
            bodyContent()
                .transaction { transaction in
                    transaction.animation = nil
                }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyStepperViewModel.layoutHeight))
        
    }
    
    func bodyContent() -> some View {
        let buttonUniversalPaddingLeft = magicalSexyStepperViewModel.buttonUniversalPaddingLeft
        let buttonUniversalPaddingRight = magicalSexyStepperViewModel.buttonUniversalPaddingRight
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
                .background(getStrokeRect())
                .background(getFillRect())
                
#if INTERFACE_HINTS
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                    .background(Color(red: 0.65, green: 0.45, blue: 0.55, opacity: 0.40))
#else
                Spacer()
                    .frame(width: CGFloat(universalPaddingRight))
                
#endif
            }
            
            MagicalSexyStepperContent(orientation: orientation, 
                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                      isDarkMode: isDarkMode,
                                      isEnabled: isEnabled,
                                      isIncrementEnabled: isIncrementEnabled,
                                      isDecrementEnabled: isDecrementEnabled,
                                      universalPaddingLeft: universalPaddingLeft,
                                      universalPaddingRight: universalPaddingRight,
                                      universalPaddingTop: universalPaddingTop,
                                      universalPaddingBottom: universalPaddingBottom,
                                      layoutWidth: layoutWidth,
                                      valueString: valueString)
            
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyStepperViewModel.layoutHeight))
        
    }
    
    func getStrokeRect() -> some View {
        
        let cornerRadius = OLDOLDCheckBoxLayout.getCornerRadius(orientation: orientation)
        let lineThickness = OLDOLDCheckBoxLayout.getLineThickness(orientation: orientation)
        
        let color: Color
        
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
        
        let height = magicalSexyStepperViewModel.layoutHeight - (universalPaddingTop + universalPaddingBottom)
        
        return HStack(spacing: 0.0) {
            RoundedRectangle(cornerRadius: CGFloat(cornerRadius))
                .stroke(style: StrokeStyle(lineWidth: CGFloat(lineThickness)))
        }
        .frame(width: CGFloat(layoutWidth - universalPaddingLeft - universalPaddingRight),
               height: CGFloat(height))
        .foregroundStyle(color)
        
    }
    
    func getFillRect() -> some View {
        
        let cornerRadius = OLDOLDCheckBoxLayout.getCornerRadius(orientation: orientation)
        var height = magicalSexyStepperViewModel.layoutHeight
        height -= universalPaddingTop
        height -= universalPaddingBottom
        
        let color: Color
        if isDarkMode {
            if isEnabled {
                color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledDark
            } else {
                color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledDark
            }
        } else {
            if isEnabled {
                color = ToolInterfaceTheme.contextUnderlayHighlightedEnabledLight
            } else {
                color = ToolInterfaceTheme.contextUnderlayHighlightedDisabledLight
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

