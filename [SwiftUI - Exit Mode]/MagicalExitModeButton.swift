//
//  MagicalExitModeButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/28/24.
//

import SwiftUI

struct MagicalExitModeButton: View {
    @Environment(MagicalModeChangeViewModel.self) var magicalViewModel
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
        .buttonStyle(MagicalExitModeButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                    outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                    outsideBoxPaddingBottom: outsideBoxPaddingBottom))
        
    }
}

