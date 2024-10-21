//
//  MagicalCreateSwatchGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

struct MagicalCreateSwatchGuts: View {
    @Environment(MagicalCreateSwatchViewModel.self) var magicalViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    var body: some View {
        let buttonCount = magicalViewModel.segmentButtonViewModels.count
        let buttonCount1 = (buttonCount - 1)
        
        let activeButtonViewModel = magicalViewModel.activeButtonViewModel
        
        return ZStack {
            if let activeButtonViewModel = activeButtonViewModel,
               let activeButtonConfiguration = magicalViewModel.getButtonConfiguration(buttonViewModel: activeButtonViewModel) {
                
                MagicalActiveSwatchButton(activeButtonViewModel: activeButtonViewModel,
                                          activeButtonConfiguration: activeButtonConfiguration,
                                          firstButtonViewModel: magicalViewModel.segmentButtonViewModels[0],
                                          layoutSchemeFlavor: layoutSchemeFlavor,
                                          outsideBoxPaddingTop: outsideBoxPaddingTop,
                                          outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                          isEnabled: magicalViewModel.isEnabled)
            } else {
                GeometryReader { _ in
                    ForEach(magicalViewModel.createSwatchConfiguration.buttonConfigurations) { buttonConfiguration in
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
                        let isEnabled = (buttonViewModel.isEnabled && magicalViewModel.isEnabled)
                        return MagicalCreateSwatchSegmentButton(index: index,
                                                                layoutSchemeFlavor: layoutSchemeFlavor,
                                                                outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                                outsideBoxPaddingBottom: outsideBoxPaddingBottom,
                                                                position: position,
                                                                isEnabled: isEnabled)
                        .environment(buttonViewModel as? MagicalCreateSwatchButtonViewModel)
                        .offset(x: CGFloat(buttonViewModel.layoutX))
                    }
                }
                .frame(width: CGFloat(layoutWidth),
                       height: CGFloat(magicalViewModel.layoutHeight))
            }
        }
    }
}
