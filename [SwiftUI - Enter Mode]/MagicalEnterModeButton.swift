//
//  MagicalEnterModeButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/25/24.
//

import SwiftUI

struct MagicalEnterModeButton: View {
    
    @Environment(MagicalEnterModeViewModel.self) var magicalEnterModeViewModel: MagicalEnterModeViewModel
    
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
               height: CGFloat(magicalEnterModeViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalEnterModeViewModel.handleClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalEnterModeViewModel.layoutHeight))
        }
        .buttonStyle(MagicalEnterModeButtonStyle(orientation: orientation,
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
