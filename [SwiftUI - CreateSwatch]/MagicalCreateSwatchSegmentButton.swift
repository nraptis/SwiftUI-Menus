//
//  MagicalCreateSwatchSegmentButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//


import SwiftUI

struct MagicalCreateSwatchSegmentButton: View {
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    @Environment(MagicalCreateSwatchButtonViewModel.self) var magicalButtonViewModel
    let index: Int
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    let position: SegmentedPickerPosition
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
            .buttonStyle(MagicalCreateSwatchSegmentButtonButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                                        outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                                        outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                                        position: position))
        }
        .frame(width: CGFloat(magicalButtonViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
    }
}

/*
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
                                                                 isDarkMode: isDarkMode,
                                                                 isEnabled: isEnabled,
                                                                 orientation: orientation,
                                                                 layoutSchemeFlavor: layoutSchemeFlavor,
                                                                 segmentedPickerPosition: segmentedPickerPosition,
                                                                 universalPaddingTop: universalPaddingTop,
                                                                 universalPaddingBottom: universalPaddingBottom))
        .disabled(!isEnabled)
        
    }
}

*/

