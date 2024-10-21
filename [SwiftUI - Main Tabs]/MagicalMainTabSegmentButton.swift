//
//  MagicalMainTabSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabSegmentButton: View {
    @Environment(MagicalMainTabViewModel.self) var magicalViewModel
    @Environment(MagicalMainTabButtonViewModel.self) var magicalButtonViewModel
    let index: Int
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let position: SegmentedPickerPosition
    let isSelected: Bool
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
            .buttonStyle(MagicalMainTabSegmentButtonButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                                outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                                outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                                position: position,
                                                                isSelected: isSelected,
                                                                isEnabled: isEnabled))
            .disabled(!isEnabled)
        }
        .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
    }
}
