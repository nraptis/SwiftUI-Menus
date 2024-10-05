//
//  MagicalSexyButtonButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalSexyButtonButton: View {
    @Environment(MagicalSexyButtonViewModel.self) var magicalViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    var body: some View {
        Button {
            magicalViewModel.handleClicked()
        } label: {
            ZStack {
                
            }
            .frame(width: CGFloat(magicalViewModel.layoutWidth),
                   height: CGFloat(magicalViewModel.layoutHeight))
        }
        .buttonStyle(MagicalSexyButtonButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                  outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                  outsideBoxPaddingBottom: outsideBoxPaddingBottom))
    }
}
