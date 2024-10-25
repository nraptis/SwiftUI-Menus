//
//  MagicalActiveSwatchButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/3/24.
//

import SwiftUI

struct MagicalActiveSwatchButton: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    let activeButtonViewModel: MagicalSegmentButtonViewModel
    let activeButtonConfiguration: ToolInterfaceElementCreateSwatchButtonConfiguration
    let firstButtonViewModel: MagicalSegmentButtonViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let isEnabled: Bool
    
    var body: some View {
        ZStack {
            Button {
                magicalViewModel.handleActiveSwatchClicked()
            } label: {
                HStack(spacing: 0.0) {
                    
                }
                .frame(width: CGFloat(magicalViewModel.layoutWidth),
                       height: CGFloat(magicalViewModel.layoutHeight))
            }
            .buttonStyle(MagicalActiveSwatchButtonStyle(activeButtonViewModel: activeButtonViewModel,
                                                        activeButtonConfiguration: activeButtonConfiguration,
                                                        firstButtonViewModel: firstButtonViewModel,
                                                        layoutSchemeFlavor: layoutSchemeFlavor,
                                                        layoutWidth: layoutWidth,
                                                        outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                        outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                        isEnabled: isEnabled))
            .disabled(!isEnabled)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
    }
}
