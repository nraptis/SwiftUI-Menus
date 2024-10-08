//
//  MagicalMainTabGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabGuts: View {
    @Environment(MagicalMainTabViewModel.self) var magicalViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    var body: some View {
        let buttonCount = magicalViewModel.segmentButtonViewModels.count
        let buttonCount1 = (buttonCount - 1)
        return GeometryReader { _ in
            ForEach(magicalViewModel.mainTabConfiguration.buttonConfigurations) { buttonConfiguration in
                let index = Int(buttonConfiguration.id)
                let buttonViewModel = magicalViewModel.segmentButtonViewModels[index]
                let position: SegmentedPickerPosition
                if index == 0 {
                    position = .bookendLeft
                } else if index == buttonCount1 {
                    position = .bookendRight
                } else {
                    position = .middle
                }
                let isSelected = magicalViewModel.selectedSegmentIndex == index
                return MagicalMainTabSegmentButton(index: index,
                                                   layoutSchemeFlavor: layoutSchemeFlavor,
                                                   outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                   outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                   position: position,
                                                   isSelected: isSelected)
                .environment(buttonViewModel as? MagicalMainTabButtonViewModel)
                .offset(x: CGFloat(buttonViewModel.layoutX))
            }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.66, green: 0.75, blue: 0.465, opacity: 0.75),
                                    Color(red: 0.65, green: 0.78, blue: 0.85, opacity: 0.75)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.65, green: 0.78, blue: 0.65, opacity: 0.25),
                                    Color(red: 0.65, green: 0.75, blue: 0.68, opacity: 0.25)], startPoint: .leading, endPoint: .trailing)))
#endif
    }
}
