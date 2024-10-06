//
//  MagicalExitMode.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/28/24.
//

import SwiftUI

struct MagicalExitMode: View {
    
    @Environment(MagicalModeChangeViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.31, green: 0.75, blue: 0.45, opacity: 0.76),
                                    Color(red: 0.54, green: 0.73, blue: 0.48, opacity: 0.76)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.41, green: 0.81, blue: 0.48, opacity: 0.31),
                                    Color(red: 0.64, green: 0.23, blue: 0.61, opacity: 0.31)], startPoint: .leading, endPoint: .trailing)))
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
        let outsideBoxPaddingTop = ExitModeLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        let outsideBoxPaddingBottom = ExitModeLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        return MagicalExitModeButton(layoutSchemeFlavor: layoutSchemeFlavor,
                                         outsideBoxPaddingTop: outsideBoxPaddingTop,
                                         outsideBoxPaddingBottom: outsideBoxPaddingBottom)
    }
    
}
/*
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
*/
