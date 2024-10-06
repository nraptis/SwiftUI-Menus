//
//  MagicalGreenButtonButton.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/2/24.
//

import SwiftUI

struct MagicalGreenButtonButton: View {
    @Environment(MagicalGreenButtonViewModel.self) var magicalViewModel
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let outsideBoxPaddingTop: Int
    let outsideBoxPaddingBottom: Int
    var body: some View {
        Button {
            magicalViewModel.handleClicked()
        } label: {
            ZStack {
                
            }
            .frame(width: CGFloat(magicalViewModel.layoutWidth),
                   height: CGFloat(magicalViewModel.layoutHeight))
        }
        .buttonStyle(MagicalGreenButtonButtonStyle(layoutSchemeFlavor: layoutSchemeFlavor,
                                                    outsideBoxPaddingTop: outsideBoxPaddingTop,
                                                    outsideBoxPaddingBottom: outsideBoxPaddingBottom))
        
    }
}

/*
import SwiftUI

struct MagicalGreenButtonButton: View {
    
    @Environment(MagicalGreenButtonViewModel.self) var magicalGreenButtonViewModel: MagicalGreenButtonViewModel
    
    let orientation: Orientation
    let layoutSchemeFlavor: LayoutSchemeFlavor
    let universalPaddingTop: Int
    let universalPaddingBottom: Int
    let layoutWidth: Int
    
    var body: some View {
        return ZStack {
            bodyContent()
        }
        .frame(width: CGFloat(layoutWidth),
               height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
    }
    
    func bodyContent() -> some View {
        Button {
            magicalGreenButtonViewModel.handleClicked()
        } label: {
            HStack(spacing: 0.0) {
                
            }
            .frame(width: CGFloat(layoutWidth),
                   height: CGFloat(magicalGreenButtonViewModel.layoutHeight))
        }
        .buttonStyle(MagicalGreenButtonButtonStyle(orientation: orientation,
                                                   universalPaddingTop: universalPaddingTop,
                                                   universalPaddingBottom: universalPaddingBottom,
                                                   layoutWidth: layoutWidth))
    }
}
*/
