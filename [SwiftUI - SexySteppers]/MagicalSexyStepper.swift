//
//  MagicalSexyStepper.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 9/13/24.
//

import SwiftUI

struct MagicalSexyStepper: View {
    
    @Environment(MagicalSexyStepperViewModel.self) var magicalSexyStepperViewModel: MagicalSexyStepperViewModel
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalSexyStepperViewModel.layoutWidth),
               height: CGFloat(magicalSexyStepperViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalSexyStepperViewModel.layoutX),
                y: CGFloat(magicalSexyStepperViewModel.layoutY))
        .disabled(!magicalSexyStepperViewModel.isEnabled)
        .transaction { transaction in
            transaction.animation = nil
        }
    }
    
    func bodyContent() -> some View {
        
        let orientation = magicalSexyStepperViewModel.orientation
        let configuration = magicalSexyStepperViewModel.sexyStepperConfiguration
        let layoutSchemeFlavor = magicalSexyStepperViewModel.getLayoutSchemeFlavor()
        
        let isEnabled = magicalSexyStepperViewModel.isEnabled
        let isIncrementEnabled = magicalSexyStepperViewModel.isIncrementEnabled
        let isDecrementEnabled = magicalSexyStepperViewModel.isDecrementEnabled
        
        let universalPaddingLeft = magicalSexyStepperViewModel.universalPaddingLeft
        let universalPaddingRight = magicalSexyStepperViewModel.universalPaddingRight
        
        let numberOfLines = configuration.nameLabelNumberOfLines
        
        let isDarkMode = magicalSexyStepperViewModel.isDarkModeEnabled
        
        let universalPaddingTop = SexyStepperLayout.getUniversalPaddingTop(orientation: orientation,
                                                                              flavor: layoutSchemeFlavor,
                                                                              numberOfLines: numberOfLines)
        let universalPaddingBottom = SexyStepperLayout.getUniversalPaddingBottom(orientation: orientation,
                                                                                    flavor: layoutSchemeFlavor,
                                                                                    numberOfLines: numberOfLines)
        
        let layoutWidth = magicalSexyStepperViewModel.layoutWidth
        let valueString = magicalSexyStepperViewModel.valueString
        
        return HStack(spacing: 0.0) {
            ZStack {
                MagicalSexyStepperGuts(orientation: orientation,
                                       layoutSchemeFlavor: layoutSchemeFlavor,
                                       isDarkMode: isDarkMode,
                                       isEnabled: isEnabled,
                                       isIncrementEnabled: isIncrementEnabled,
                                       isDecrementEnabled: isDecrementEnabled,
                                       universalPaddingLeft: universalPaddingLeft,
                                       universalPaddingRight: universalPaddingRight,
                                       universalPaddingTop: universalPaddingTop,
                                       universalPaddingBottom: universalPaddingBottom, 
                                       layoutWidth: layoutWidth,
                                       valueString: valueString)
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalSexyStepperViewModel.layoutHeight))
        }
        
        .frame(width: CGFloat(magicalSexyStepperViewModel.layoutWidth),
               height: CGFloat(magicalSexyStepperViewModel.layoutHeight))
    }
}
