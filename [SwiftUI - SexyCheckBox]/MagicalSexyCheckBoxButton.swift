//
//  MagicalSexyCheckBoxButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyCheckBoxButton: View {
    
    @Environment(MagicalSexyCheckBoxViewModel.self) var magicalSexyCheckBoxViewModel: MagicalSexyCheckBoxViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let isDarkMode: Bool
    let isEnabled: Bool
    let isChecked: Bool
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
               height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalSexyCheckBoxViewModel.handleClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalSexyCheckBoxViewModel.layoutHeight))
        }
        .buttonStyle(MagicalSexyCheckBoxButtonStyle(orientation: orientation,
                                                    layoutSchemeFlavor: layoutSchemeFlavor,
                                                    isDarkMode: isDarkMode,
                                                    isEnabled: isEnabled,
                                                    isChecked: isChecked,
                                                    universalPaddingLeft: universalPaddingLeft,
                                                    universalPaddingRight: universalPaddingRight,
                                                    universalPaddingTop: universalPaddingTop,
                                                    universalPaddingBottom: universalPaddingBottom,
                                                    layoutWidth: layoutWidth))
    }
}
