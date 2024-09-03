//
//  MagicalExitMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/28/24.
//

import SwiftUI

struct MagicalExitMode: View {
    
    @Environment(MagicalExitModeViewModel.self) var magicalExitModeViewModel: MagicalExitModeViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalExitModeViewModel.layoutWidth),
               height: CGFloat(magicalExitModeViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalExitModeViewModel.layoutX),
                y: CGFloat(magicalExitModeViewModel.layoutY))
        .disabled(!magicalExitModeViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalExitModeViewModel.orientation
        let configuration = magicalExitModeViewModel.exitModeConfiguration
        let layoutSchemeFlavor = magicalExitModeViewModel.getLayoutSchemeFlavor()
        
        let isEnabled = magicalExitModeViewModel.isEnabled
        
        let universalPaddingLeft = magicalExitModeViewModel.universalPaddingLeft
        let universalPaddingRight = magicalExitModeViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let isDarkMode = magicalExitModeViewModel.isDarkModeEnabled
        
        let universalPaddingTop = ExitModeLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        let universalPaddingBottom = ExitModeLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        
        let layoutWidth = magicalExitModeViewModel.layoutWidth
        
        return HStack(spacing: 0.0) {
            

            
            ZStack {
                MagicalExitModeButton(orientation: orientation,
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
                   height: CGFloat(magicalExitModeViewModel.layoutHeight))
        }
        
        .frame(width: CGFloat(magicalExitModeViewModel.layoutWidth),
               height: CGFloat(magicalExitModeViewModel.layoutHeight))
    }
}
