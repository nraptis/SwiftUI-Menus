//
//  DialogBoxBackgroundView.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/22/24.
//

import SwiftUI

struct DialogBoxBackgroundView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
            }
            Spacer()
        }
        .background(Rectangle()
            .foregroundStyle(.regularMaterial)
            .colorScheme(.dark))
        .ignoresSafeArea(.all)
    }
}
