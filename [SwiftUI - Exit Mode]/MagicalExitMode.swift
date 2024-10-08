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
