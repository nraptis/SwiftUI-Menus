//
//  MagicalIconButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalIconButton: View {
    
    @Environment(MagicalIconButtonViewModel.self) var magicalIconButtonViewModel: MagicalIconButtonViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalIconButtonViewModel.layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalIconButtonViewModel.layoutX),
                y: CGFloat(magicalIconButtonViewModel.layoutY))
        .disabled(!magicalIconButtonViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalIconButtonViewModel.orientation
        let configuration = magicalIconButtonViewModel.iconButtonConfiguration
        let layoutSchemeFlavor = magicalIconButtonViewModel.getLayoutSchemeFlavor()
        
        let isEnabled = magicalIconButtonViewModel.isEnabled
        
        let universalPaddingLeft = magicalIconButtonViewModel.universalPaddingLeft
        let universalPaddingRight = magicalIconButtonViewModel.universalPaddingRight
        
        let isDarkMode = magicalIconButtonViewModel.isDarkModeEnabled
        
        let universalPaddingTop = IconButtonLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: 0)
        let universalPaddingBottom = IconButtonLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: 0)
        
        let layoutWidth = magicalIconButtonViewModel.layoutWidth
        
        return HStack(spacing: 0.0) {
            

            
            ZStack {
                MagicalIconButtonButton(orientation: orientation,
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
                   height: CGFloat(magicalIconButtonViewModel.layoutHeight))
        }
        
        .frame(width: CGFloat(magicalIconButtonViewModel.layoutWidth),
               height: CGFloat(magicalIconButtonViewModel.layoutHeight))
    }
}
