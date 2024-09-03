//
//  MagicalSexyButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyButtonButtonStyle: ButtonStyle {
    
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
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
                .transaction { transaction in
                    transaction.animation = nil
                }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalSexyButtonContent(orientation: orientation,
                                         layoutSchemeFlavor: layoutSchemeFlavor,
                                         isPressed: isPressed,
                                         isDarkMode: isDarkMode,
                                         isEnabled: isEnabled,
                                         universalPaddingLeft: universalPaddingLeft,
                                         universalPaddingRight: universalPaddingRight,
                                         universalPaddingTop: universalPaddingTop,
                                         universalPaddingBottom: universalPaddingBottom,
                                         layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalSexyButtonViewModel.layoutHeight))
    }
}
