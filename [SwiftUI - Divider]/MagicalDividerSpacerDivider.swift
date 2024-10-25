//
//  MagicalDividerSpacerDivider.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 3/29/24.
//

import SwiftUI

struct MagicalDividerSpacerDivider: View {
    
    @Environment(MagicalViewModel.self) var magicalViewModel: MagicalViewModel
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.96, green: 0.45, blue: 0.45, opacity: 0.85),
                                    Color(red: 0.45, green: 0.98, blue: 0.45, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.25, green: 0.98, blue: 0.25, opacity: 0.15),
                                    Color(red: 0.45, green: 0.45, blue: 0.98, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalViewModel.layoutX),
                y: CGFloat(magicalViewModel.layoutY))
    }
    
    func bodyContent() -> some View {
        
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        let orientation = magicalViewModel.orientation
        let twoDividersThreshold = DividerLayout.getMinimumLengthForSpacerDividerSpacerToHaveTwoDividers(orientation: orientation)
        let isShowingTwoDividers: Bool
        if magicalViewModel.layoutWidth >= twoDividersThreshold {
            isShowingTwoDividers = true
        } else {
            isShowingTwoDividers = false
        }
        
        let universalPaddingLeft = DividerHugeLayout.getUniversalPaddingLeft(orientation: orientation,
                                                                             flavor: .long,
                                                                             squeeze: .standard,
                                                                             neighborTypeLeft: nil,
                                                                             neighborTypeRight: nil)
        let universalPaddingRight = DividerHugeLayout.getUniversalPaddingRight(orientation: orientation,
                                                                               flavor: .long,
                                                                               squeeze: .standard,
                                                                               neighborTypeLeft: nil,
                                                                               neighborTypeRight: nil)
        
        return HStack(spacing: 0.0) {
            if isShowingTwoDividers {
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(universalPaddingLeft))
                DividerHuge(orientation: orientation, isDarkMode: isDarkMode)
                Spacer(minLength: 0.0)
                DividerHuge(orientation: orientation, isDarkMode: isDarkMode)
                Spacer(minLength: 0.0)
                    .frame(width: CGFloat(universalPaddingRight))
            } else {
                Spacer(minLength: 0.0)
                DividerHuge(orientation: orientation, isDarkMode: isDarkMode)
                Spacer(minLength: 0.0)
            }
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
    }
}
