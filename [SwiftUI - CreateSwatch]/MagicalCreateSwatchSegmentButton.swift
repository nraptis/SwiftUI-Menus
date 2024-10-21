//
//  MagicalCreateSwatchSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//


import SwiftUI

struct MagicalCreateSwatchSegmentButton: View {
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalButtonViewModel
    let index: Int
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let position: SegmentedPickerPosition
    let isEnabled: Bool
    var body: some View {
        ZStack {
            Button {
                magicalViewModel.handleSelectedIndex(index)
            } label: {
                HStack(spacing: 0.0) {
                    
                }
                .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
                       height: CGFloat(magicalViewModel.layoutHeight))
            }
            .buttonStyle(MagicalCreateSwatchSegmentButtonButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                                     outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                                     outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                                     position: position,
                                                                     isEnabled: isEnabled))
            .disabled(!isEnabled)
        }
        .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
    }
}
