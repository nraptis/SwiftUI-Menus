//
//  MagicalTextIconButtonButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalTextIconButtonButton: View {
    
    @Environment(MagicalTextIconButtonViewModel.self) var magicalTextIconButtonViewModel: MagicalTextIconButtonViewModel
    
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
               height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalTextIconButtonViewModel.handleClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalTextIconButtonViewModel.layoutHeight))
        }
        .buttonStyle(MagicalTextIconButtonButtonStyle(orientation: orientation,
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
