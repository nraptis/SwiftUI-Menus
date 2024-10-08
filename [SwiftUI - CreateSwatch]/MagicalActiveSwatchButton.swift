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
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    
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
            .buttonStyle(MagicalCreateSwatchButtonStyle(activeButtonViewModel: activeButtonViewModel,
                                                        activeButtonConfiguration: activeButtonConfiguration,
                                                        firstButtonViewModel: firstButtonViewModel,
                                                        layoutSchemeFlavor: layoutSchemeFlavor,
                                                        outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                        outsideBoxPaddingBottom: outsideBoxPaddingBottom))
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
    }
}
