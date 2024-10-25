//
//  MagicalGreenButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalGreenButton: View {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.58, green: 0.21, blue: 0.45, opacity: 0.65),
                                    Color(red: 0.26, green: 0.68, blue: 0.97, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.91, green: 0.96, blue: 0.44, opacity: 0.15),
                                    Color(red: 0.92, green: 0.11, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalViewModel.layoutX),
                y: CGFloat(magicalViewModel.layoutY))
        .disabled(!magicalViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        let orientation = magicalViewModel.orientation
        let layoutSchemeFlavor = magicalViewModel.getLayoutSchemeFlavor()
        let outsideBoxPaddingTop = GreenButtonLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingBottom = GreenButtonLayout.getOutsideBoxPaddingTop(orientation: orientation)
        return MagicalGreenButtonButton(layoutSchemeFlavor: layoutSchemeFlavor,
                                        outsideBoxPaddingTop: outsideBoxPaddingTop,
                                        outsideBoxPaddingBottom: outsideBoxPaddingBottom)
    }
}
