//
//  MagicalSexyButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyButton: View {
    
    @Environment(MagicalSexyButtonViewModel.self) var magicalSexyButtonViewModel: MagicalSexyButtonViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSexyButtonViewModel.layoutWidth),
               height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalSexyButtonViewModel.layoutX),
                y: CGFloat(magicalSexyButtonViewModel.layoutY))
        .disabled(!magicalSexyButtonViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalSexyButtonViewModel.orientation
        let configuration = magicalSexyButtonViewModel.sexyButtonConfiguration
        let layoutSchemeFlavor = magicalSexyButtonViewModel.getLayoutSchemeFlavor()
        
        let isEnabled = magicalSexyButtonViewModel.isEnabled
        
        let universalPaddingLeft = magicalSexyButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSexyButtonViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let isDarkMode = magicalSexyButtonViewModel.isDarkModeEnabled
        
        let universalPaddingTop = SexyButtonLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        let universalPaddingBottom = SexyButtonLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        
        let layoutWidth = magicalSexyButtonViewModel.layoutWidth
        
        return HStack(spacing: 0.0) {
            
            ZStack {
                MagicalSexyButtonButton(orientation: orientation,
                                            layoutSchemeFlavor: layoutSchemeFlavor,
                                            isDarkMode: isDarkMode,
                                            isEnabled: isEnabled,
                                            universalPaddingLeft: universalPaddingLeft,
                                            universalPaddingRight: universalPaddingRight,
                                            universalPaddingTop: universalPaddingTop,
                                            universalPaddingBottom: universalPaddingBottom,
                                            layoutWidth: layoutWidth)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
        }
        
        .frame(width: CGFloat(magicalSexyButtonViewModel.layoutWidth),
               height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
    }
}
