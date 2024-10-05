//
//  MagicalCheckBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct MagicalCheckBox: View {
    @Environment(MagicalCheckBoxViewModel.self) var magicalCheckBoxViewModel: MagicalCheckBoxViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalCheckBoxViewModel.layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalCheckBoxViewModel.layoutX),
                y: CGFloat(magicalCheckBoxViewModel.layoutY))
        //.disabled(!magicalCheckBoxViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalCheckBoxViewModel.orientation
        let configuration = magicalCheckBoxViewModel.checkBoxConfiguration
        let layoutSchemeFlavor = magicalCheckBoxViewModel.getLayoutSchemeFlavor()
        
        let universalPaddingLeft = magicalCheckBoxViewModel.universalPaddingLeft
        let universalPaddingRight = magicalCheckBoxViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let universalPaddingTop = OLDOLDCheckBoxLayout.getUniversalPaddingTop(orientation: orientation,
                                                                        flavor: layoutSchemeFlavor,
                                                                        numberOfLines: numberOfLines)
        let universalPaddingBottom = OLDOLDCheckBoxLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        
        let isChecked = magicalCheckBoxViewModel.isChecked
        let isEnabled = magicalCheckBoxViewModel.isEnabled
        let isDarkMode = magicalCheckBoxViewModel.isDarkModeEnabled
        
        let layoutWidth = magicalCheckBoxViewModel.layoutWidth - (universalPaddingLeft + universalPaddingRight)
        
        return HStack(spacing: 0.0) {
                
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft), height: 28.0)
                .background(Color(red: 1.0, green: 1.0, blue: 0.5, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingLeft))
#endif
            
            ZStack {
                
                MagicalCheckBoxButton(orientation: orientation,
                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                      universalPaddingTop: universalPaddingTop,
                                      universalPaddingBottom: universalPaddingBottom,
                                      isChecked: isChecked,
                                      isEnabled: isEnabled,
                                      isDarkMode: isDarkMode,
                                      layoutWidth: layoutWidth)
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
            
            
#if INTERFACE_HINTS
            Spacer()
                .frame(width: CGFloat(universalPaddingRight), height: 28.0)
                .background(Color(red: 0.5, green: 0.25, blue: 1.0, opacity: 0.40))
#else
            Spacer()
                .frame(width: CGFloat(universalPaddingRight))
#endif
            
        }
        .frame(width: CGFloat(magicalCheckBoxViewModel.layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
    }
}
