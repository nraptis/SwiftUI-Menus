//
//  MagicalMainTabSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabSegmentButton: View {
    
    @Environment(MagicalMainTabViewModel.self) var magicalMainTabViewModel: MagicalMainTabViewModel
    @Environment(MagicalMainTabButtonViewModel.self) var magicalMainTabButtonViewModel: MagicalMainTabButtonViewModel
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
        .frame(width: CGFloat(magicalMainTabButtonViewModel.width),
               height: CGFloat(magicalMainTabViewModel.layoutHeight))
        .offset(x: CGFloat(magicalMainTabButtonViewModel.x),
                y: CGFloat(magicalMainTabButtonViewModel.y))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalMainTabViewModel.handleSelectedIndex(index)
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(magicalMainTabButtonViewModel.width),
                   height: CGFloat(magicalMainTabViewModel.layoutHeight))
        }
        .buttonStyle(MagicalMainTabSegmentButtonButtonStyle(index: index,
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
