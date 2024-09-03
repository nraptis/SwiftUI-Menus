//
//  MagicalMainTabGuts.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/24/24.
//

import SwiftUI

struct MagicalMainTabGuts: View {
    
    @Environment(MagicalMainTabViewModel.self) var magicalMainTabViewModel: MagicalMainTabViewModel
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let layoutWidth: Int
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalMainTabViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        
        let layoutSchemeFlavor = magicalMainTabViewModel.getLayoutSchemeFlavor()
        let buttonCount = magicalMainTabViewModel.mainTabConfiguration.buttonConfigurations.count
        let buttonCount1 = (buttonCount - 1)
        
        var greatestNumberOfLines = 0
        for buttonConfiguration in magicalMainTabViewModel.mainTabConfiguration.buttonConfigurations {
            let line1 = buttonConfiguration.nameLabelLine1
            let line2 = buttonConfiguration.nameLabelLine2
            let _numberOfLines = ToolInterfaceTheme.getNumberOfLines(line1: line1, line2: line2)
            greatestNumberOfLines = max(greatestNumberOfLines, _numberOfLines)
        }
        
        let universalPaddingTop = MainTabLayout.getUniversalPaddingTop(orientation: orientation,
                                                                               flavor: layoutSchemeFlavor,
                                                                               numberOfLines: greatestNumberOfLines)
        let universalPaddingBottom = MainTabLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                     flavor: layoutSchemeFlavor,
                                                                                     numberOfLines: greatestNumberOfLines)
        
        let isDarkMode = magicalMainTabViewModel.isDarkModeEnabled
        let isEnabled = magicalMainTabViewModel.isEnabled
        return GeometryReader { _ in
            ForEach(magicalMainTabViewModel.mainTabConfiguration.buttonConfigurations) { buttonConfiguration in
                let index = Int(buttonConfiguration.id)
                let buttonViewModel = magicalMainTabViewModel.buttonViewModels[index]
                let segmentedPickerPosition = getPosition(index: index, count1: buttonCount1)
                let isSelected = magicalMainTabViewModel.selectedSegmentIndex == index
                MagicalMainTabSegmentButton(index: index,
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
               height: CGFloat(magicalMainTabViewModel.layoutHeight))
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
