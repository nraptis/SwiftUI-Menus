//
//  HugeDivider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/20/24.
//

import SwiftUI

struct DividerHuge: View {
    let orientation: Orientation
    let isDarkMode: Bool
    var body: some View {
        let width = DividerLayout.getPillWidthHuge(orientation: orientation)
        let height = DividerLayout.getPillHeightHuge(orientation: orientation)
        let color: Color
        if isDarkMode {
            color = ToolInterfaceTheme.dividerHugeDark
        } else {
            color = ToolInterfaceTheme.dividerHugeLight
        }
        return Capsule()
            .foregroundStyle(color)
            .frame(width: CGFloat(width), height: CGFloat(height))
    }
}
