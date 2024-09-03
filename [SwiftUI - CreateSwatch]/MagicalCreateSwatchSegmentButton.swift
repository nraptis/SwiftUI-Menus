//
//  MagicalCreateSwatchSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import Foundation
//
//  MagicalCreateSwatchSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalCreateSwatchSegmentButton: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalCreateSwatchButtonViewModel: MagicalCreateSwatchButtonViewModel
    let index: Int
    let isSelected: Bool
    let isDarkMode: Bool
    let isEnabled: Bool
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let segmentedPickerPosition: SegmentedPickerPosition
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
        .offset(x: CGFloat(magicalCreateSwatchButtonViewModel.x),
                y: CGFloat(magicalCreateSwatchButtonViewModel.y))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalCreateSwatchViewModel.handleSelectedIndex(index)
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(magicalCreateSwatchButtonViewModel.width),
                   height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
        }
        .buttonStyle(MagicalCreateSwatchSegmentButtonButtonStyle(index: index,
                                                            isSelected: isSelected,
                                                            isDarkMode: isDarkMode,
                                                            isEnabled: isEnabled,
                                                            orientation: orientation,
                                                            layoutSchemeFlavor: layoutSchemeFlavor,
                                                            segmentedPickerPosition: segmentedPickerPosition,
                                                            universalPaddingTop: universalPaddingTop,
                                                            universalPaddingBottom: universalPaddingBottom))
    }
}
