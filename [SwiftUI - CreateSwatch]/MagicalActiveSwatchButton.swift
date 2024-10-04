//
//  MagicalActiveSwatchButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalActiveSwatchButton: View {
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let buttonViewModel: MagicalCreateSwatchButtonViewModel
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let isEnabled: Bool
    let isDarkMode: Bool
    let layoutWidth: Int
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalCreateSwatchViewModel.handleActiveSwatchClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
        }
        .buttonStyle(MagicalActiveSwatchButtonStyle(orientation: orientation,
                                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                                    buttonViewModel: buttonViewModel,
                                                    universalPaddingTop: universalPaddingTop,
                                                    universalPaddingBottom: universalPaddingBottom,
                                                    isEnabled: isEnabled,
                                                    isDarkMode: isDarkMode,
                                                    layoutWidth: layoutWidth))
    }
}
