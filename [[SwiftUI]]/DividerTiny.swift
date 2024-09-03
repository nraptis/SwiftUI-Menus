//
//  TinyDivider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/20/24.
//

import SwiftUI

struct DividerTiny: View {
    let orientation: Orientation
    let isDarkMode: Bool
    var body: some View {
        
        let width = DividerLayout.getPillWidthTiny(orientation: orientation)
        let height = DividerLayout.getPillHeightTiny(orientation: orientation)
        let color: Color
        if isDarkMode {
            color = ToolInterfaceTheme.dividerTinyDark
        } else {
            color = ToolInterfaceTheme.dividerTinyLight
        }
        return Capsule()
            .foregroundStyle(color)
            .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
