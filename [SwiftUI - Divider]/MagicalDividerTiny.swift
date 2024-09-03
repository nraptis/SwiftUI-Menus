//
//  MagicalDividerTiny.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/19/24.
//

import Foundation
import SwiftUI

struct MagicalDividerTiny: View {
    
    @Environment(MagicalViewModel.self) var magicalViewModel: MagicalViewModel
    
    var body: some View {
        let orientation = magicalViewModel.orientation
        let isDarkMode = magicalViewModel.isDarkModeEnabled
        
        return VStack(spacing: 0.0) {
            Spacer()
            DividerTiny(orientation: orientation, isDarkMode: isDarkMode)
            Spacer()
        }
        .frame(width: CGFloat(magicalViewModel.layoutWidth),
               height: CGFloat(magicalViewModel.layoutHeight))
#if INTERFACE_HINTS
        .overlay(Rectangle().stroke().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.36, green: 0.72, blue: 0.86, opacity: 0.85),
                                    Color(red: 0.64, green: 0.81, blue: 0.76, opacity: 0.85)], startPoint: .leading, endPoint: .trailing)))
        .background(Rectangle().foregroundStyle(
            LinearGradient(colors: [Color(red: 0.55, green: 0.67, blue: 0.37, opacity: 0.15),
                                    Color(red: 0.55, green: 0.76, blue: 0.65, opacity: 0.15)], startPoint: .leading, endPoint: .trailing)))
#endif
        .offset(x: CGFloat(magicalViewModel.layoutX),
                y: CGFloat(magicalViewModel.layoutY))
        
    }
}
