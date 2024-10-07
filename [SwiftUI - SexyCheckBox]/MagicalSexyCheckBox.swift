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
