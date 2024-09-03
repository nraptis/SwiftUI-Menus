//
//  MagicalCheckBoxButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/3/24.
//

import SwiftUI

struct MagicalCheckBoxButton: View {
    @Environment(MagicalCheckBoxViewModel.self) var magicalCheckBoxViewModel: MagicalCheckBoxViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let isChecked: Bool
    let isEnabled: Bool
    let isDarkMode: Bool
    let layoutWidth: Int
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalCheckBoxViewModel.handleClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalCheckBoxViewModel.layoutHeight))
        }
        .buttonStyle(MagicalCheckBoxButtonStyle(orientation: orientation,
                                                layoutSchemeFlavor: layoutSchemeFlavor,
                                                universalPaddingTop: universalPaddingTop,
                                                universalPaddingBottom: universalPaddingBottom,
                                                isChecked: isChecked,
                                                isEnabled: isEnabled,
                                                isDarkMode: isDarkMode,
                                                layoutWidth: layoutWidth))
    }
}
