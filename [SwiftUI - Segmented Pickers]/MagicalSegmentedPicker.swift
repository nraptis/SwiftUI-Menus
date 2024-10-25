//
//  MagicalSegmentedPicker.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/22/24.
//

import SwiftUI

struct MagicalSegmentedPicker: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.75, blue: 0.465, opacity: 0.85),
                                    Color(red: 0.75, green: 0.68, blue: 0.85, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.95, green: 0.88, blue: 0.65, opacity: 0.25),
                                    Color(red: 0.95, green: 0.75, blue: 0.68, opacity: 0.25)], startPoint: .leading, endPoint: .trailing)))
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
        let outsideBoxPaddingTop = SegmentedPickerLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingBottom = SegmentedPickerLayout.getOutsideBoxPaddingTop(orientation: orientation)
        let outsideBoxPaddingLeft = magicalViewModel.outsideBoxPaddingLeft
        let outsideBoxPaddingRight = magicalViewModel.outsideBoxPaddingRight
        let contentLayoutWidth = magicalViewModel.layoutWidth - outsideBoxPaddingLeft - outsideBoxPaddingRight
        return HStack(spacing: 0.0) {
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(outsideBoxPaddingLeft), height: 28.0)
                .background(Color(red: 0.45, green: 0.85, blue: 0.65, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(outsideBoxPaddingLeft))
#endif
            MagicalSegmentedPickerGuts(layoutSchemeFlavor: layoutSchemeFlavor,
                                       layoutWidth: contentLayoutWidth,
                                       outsideBoxPaddingTop: outsideBoxPaddingTop,
                                       outsideBoxPaddingBottom: outsideBoxPaddingBottom)
#if INTERFACE_HINTS
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(outsideBoxPaddingRight), height: 28.0)
                .background(Color(red: 1.0, green: 0.75, blue: 0.25, opacity: 0.40))
#else
            Spacer(minLength: 0.0)
                .frame(width: CGFloat(outsideBoxPaddingRight))
#endif
            
        }
    }
}
