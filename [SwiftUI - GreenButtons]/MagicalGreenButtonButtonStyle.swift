//
//  MagicalGreenButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import Foundation
//
//  MagicalGreenButtonButtonStyle.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 4/5/24.
//

import SwiftUI

struct MagicalGreenButtonButtonStyle: ButtonStyle {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalGreenButtonViewModel: MagicalGreenButtonViewModel
    
    let orientation: Orientation
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    func makeBody(configuration: Configuration) -> some View {
        return ZStack {
            bodyContent(isPressed: configuration.isPressed)
                .transaction { transaction in
                    transaction.animation = nil
                }
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
        
    }
    
    func bodyContent(isPressed: Bool) -> some View {
        return HStack(spacing: 0.0) {
            MagicalGreenButtonContent(orientation: orientation,
                                         isPressed: isPressed,
                                         universalPaddingTop: universalPaddingTop,
                                         universalPaddingBottom: universalPaddingBottom,
                                         layoutWidth: layoutWidth)
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
    }
}
