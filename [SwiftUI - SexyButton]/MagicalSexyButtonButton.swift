//
//  MagicalSexyButtonButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyButtonButton: View {
    
    @Environment(MagicalSexyButtonViewModel.self) var magicalSexyButtonViewModel: MagicalSexyButtonViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isDarkMode: Bool
    let isEnabled: Bool
    let universalPaddingLeft: Int
    let universalPaddingRight: Int
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalSexyButtonViewModel.handleClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
        }
        .buttonStyle(MagicalSexyButtonButtonStyle(orientation: orientation,
                                                      layoutSchemeFlavor: layoutSchemeFlavor,
                                                      isDarkMode: isDarkMode,
                                                      isEnabled: isEnabled,
                                                      universalPaddingLeft: universalPaddingLeft,
                                                      universalPaddingRight: universalPaddingRight,
                                                      universalPaddingTop: universalPaddingTop,
                                                      universalPaddingBottom: universalPaddingBottom,
                                                      layoutWidth: layoutWidth))
    }
}
