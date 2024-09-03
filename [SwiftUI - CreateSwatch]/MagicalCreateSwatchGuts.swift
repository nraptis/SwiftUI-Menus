//
//  MagicalCreateSwatchGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/2/24.
//

import SwiftUI

struct MagicalCreateSwatchGuts: View {
    
    @Environment(MagicalCreateSwatchViewModel.self) var magicalCreateSwatchViewModel: MagicalCreateSwatchViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        
        let layoutSchemeFlavor = magicalCreateSwatchViewModel.getLayoutSchemeFlavor()
        let buttonCount = magicalCreateSwatchViewModel.createSwatchConfiguration.buttonConfigurations.count
        let buttonCount1 = (buttonCount - 1)
        
        var greatestNumberOfLines = 0
        for buttonConfiguration in magicalCreateSwatchViewModel.createSwatchConfiguration.buttonConfigurations {
            let line1 = buttonConfiguration.nameLabelLine1
            let line2 = buttonConfiguration.nameLabelLine2
            let _numberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: line1, line2: line2)
            greatestNumberOfLines = max(greatestNumberOfLines, _numberOfLines)
        }
        
        let universalPaddingTop = CreateSwatchLayout.getUniversalPaddingTop(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               numberOfLines: greatestNumberOfLines)
        let universalPaddingBottom = CreateSwatchLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     numberOfLines: greatestNumberOfLines)
        
        let isDarkMode = magicalCreateSwatchViewModel.isDarkModeEnabled
        let isEnabled = magicalCreateSwatchViewModel.isEnabled
        return GeometryReader { _ in
            ForEach(magicalCreateSwatchViewModel.createSwatchConfiguration.buttonConfigurations) { buttonConfiguration in
                let index = Int(buttonConfiguration.id)
                let buttonViewModel = magicalCreateSwatchViewModel.buttonViewModels[index]
                let segmentedPickerPosition = getPosition(index: index, count1: buttonCount1)
                let isSelected = magicalCreateSwatchViewModel.selectedSegmentIndex == index
                MagicalCreateSwatchSegmentButton(index: index,
                                                           isSelected: isSelected,
                                                           isDarkMode: isDarkMode,
                                                           isEnabled: isEnabled,
                                                           orientation: orientation,
                                                           layoutSchemeFlavor: layoutSchemeFlavor,
                                                           segmentedPickerPosition: segmentedPickerPosition,
                                                           universalPaddingTop: universalPaddingTop,
                                                           universalPaddingBottom: universalPaddingBottom)
                .environment(buttonViewModel)
            }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalCreateSwatchViewModel.layoutHeight))
    }
    
    func getPosition(index: Int, count1: Int) -> SegmentedPickerPosition {
        if index == 0 {
            return .bookendLeft
        } else if index == count1 {
            return .bookendRight
        } else {
            return .middle
        }
    }
}
