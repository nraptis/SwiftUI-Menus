//
//  MagicalEnterMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import SwiftUI

struct MagicalEnterMode: View {
    
    @Environment(MagicalModeChangeViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.45, green: 0.75, blue: 0.31, opacity: 0.76),
                                    Color(red: 0.73, green: 0.54, blue: 0.48, opacity: 0.76)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.41, green: 0.48, blue: 0.81, opacity: 0.31),
                                    Color(red: 0.61, green: 0.64, blue: 0.23, opacity: 0.31)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalViewModel.layoutX),
                y: CGFloat(magicalViewModel.layoutY))
        .disabled(!magicalViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        let layoutSchemeFlavor = magicalViewModel.getLayoutSchemeFlavor()
        let outsideBoxPaddingTop = EnterModeLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        let outsideBoxPaddingBottom = EnterModeLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        return MagicalEnterModeButton(layoutSchemeFlavor: layoutSchemeFlavor,
                                         outsideBoxPaddingTop: outsideBoxPaddingTop,
                                         outsideBoxPaddingBottom: outsideBoxPaddingBottom)
    }
    
}

/*
struct MagicalEnterMode: View {
    
    @Environment(MagicalModeChangeViewModel.self) var magicalEnterModeViewModel: MagicalModeChangeViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalEnterModeViewModel.layoutWidth),
               height: CGFloat(magicalEnterModeViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalEnterModeViewModel.layoutX),
                y: CGFloat(magicalEnterModeViewModel.layoutY))
        .disabled(!magicalEnterModeViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalEnterModeViewModel.orientation
        let configuration = magicalEnterModeViewModel.modeChangeConfiguration
        let layoutSchemeFlavor = magicalEnterModeViewModel.getLayoutSchemeFlavor()
        
        let isEnabled = magicalEnterModeViewModel.isEnabled
        
        let universalPaddingLeft = magicalEnterModeViewModel.universalPaddingLeft
        let universalPaddingRight = magicalEnterModeViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let isDarkMode = magicalEnterModeViewModel.isDarkModeEnabled
        
        let universalPaddingTop = EnterModeLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        let universalPaddingBottom = EnterModeLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        
        let layoutWidth = magicalEnterModeViewModel.layoutWidth
        
        return HStack(spacing: 0.0) {
            

            
            ZStack {
                MagicalEnterModeButton(orientation: orientation,
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
                   height: CGFloat(magicalEnterModeViewModel.layoutHeight))
        }
        
        .frame(width: CGFloat(magicalEnterModeViewModel.layoutWidth),
               height: CGFloat(magicalEnterModeViewModel.layoutHeight))
    }
}
*/
