//
//  MagicalSegmentedPickerSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/24/24.
//

import SwiftUI

struct MagicalSegmentedPickerSegmentButton: View {
    
    @Environment(MagicalSegmentedPickerViewModel.self) var magicalViewModel
    @Environment(MagicalSegmentedPickerButtonViewModel.self) var magicalButtonViewModel
    let index: Int
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let position: SegmentedPickerPosition
    let isSelected: Bool
    
    var body: some View {
        ZStack {
            Button {
                
                magicalViewModel.handleSelectedIndex(index)
                
            } label: {
                HStack(spacing: 0.0) {
                    
                }
                .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
                       height: CGFloat(magicalViewModel.layoutHeight))
            }
            .buttonStyle(MagicalSegmentedPickerSegmentButtonButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                                        outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                                        outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                                        position: position,
                                                                        isSelected: isSelected))
        }
        .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
        
    }
    
}
