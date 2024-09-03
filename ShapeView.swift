//
//  ShapeView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 8/20/24.
//

import SwiftUI

struct ShapeView: View {
    
    let width: CGFloat
    let height: CGFloat
    let path: Path
    let color: Color
    
    var body: some View {
        Canvas(opaque: false,
               colorMode: .linear,
               rendersAsynchronously: false) { context, size in
            
            context.fill(path, with: .color(color))
        }
        .frame(width: width, height: height)
    }
}
