//
//  MagicalSexyCheckBox.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyCheckBox: View {
    
    @Environment(MagicalSexyCheckBoxViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
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
    
    func bodyContent() -> some View {
        let layoutSchemeFlavor = magicalViewModel.getLayoutSchemeFlavor()
        let outsideBoxPaddingTop = CheckBoxLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        let outsideBoxPaddingBottom = CheckBoxLayout.getOutsideBoxPaddingTop(orientation: magicalViewModel.orientation)
        return MagicalSexyCheckBoxButton(layoutSchemeFlavor: layoutSchemeFlavor,
                                         outsideBoxPaddingTop: outsideBoxPaddingTop,
                                         outsideBoxPaddingBottom: outsideBoxPaddingBottom)
    }
    
}

/*
struct MagicalSexyCheckBox: View {
    
    @Environment(MagicalSexyCheckBoxViewModel.self) var magicalSexyCheckBoxViewModel: MagicalSexyCheckBoxViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSexyCheckBoxViewModel.layoutWidth),
               height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalSexyCheckBoxViewModel.layoutX),
                y: CGFloat(magicalSexyCheckBoxViewModel.layoutY))
        .disabled(!magicalSexyCheckBoxViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalSexyCheckBoxViewModel.orientation
        let configuration = magicalSexyCheckBoxViewModel.sexyCheckBoxConfiguration
        let layoutSchemeFlavor = magicalSexyCheckBoxViewModel.getLayoutSchemeFlavor()
        
        let isEnabled = magicalSexyCheckBoxViewModel.isEnabled
        let isChecked = magicalSexyCheckBoxViewModel.isChecked
        
        let universalPaddingLeft = magicalSexyCheckBoxViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSexyCheckBoxViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let isDarkMode = magicalSexyCheckBoxViewModel.isDarkModeEnabled
        
        let universalPaddingTop = CheckBoxLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        let universalPaddingBottom = CheckBoxLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        
        let layoutWidth = magicalSexyCheckBoxViewModel.layoutWidth
        
        return HStack(spacing: 0.0) {
            

            
            ZStack {
                MagicalSexyCheckBoxButton(orientation: orientation,
                                            layoutSchemeFlavor: layoutSchemeFlavor,
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
        
        .frame(width: CGFloat(magicalSexyCheckBoxViewModel.layoutWidth),
               height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
    }
}
*/
