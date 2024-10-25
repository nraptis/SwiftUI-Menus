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
            Spacer(minLength: 0.0)
            HStack {
                Spacer(minLength: 0.0)
            }
            Spacer(minLength: 0.0)
        }
        .background(Rectangle()
            .foregroundStyle(.regularMaterial)
            .colorScheme(.dark))
        .ignoresSafeArea(.all)
    }
}
