//
//  ArrowViewUpDown.swift
//  Jiggle3
//
//  Created by Nicky Taylor on 7/26/24.
//

import SwiftUI

struct ArrowViewUpDown: View {
    var body: some View {
        HStack {
            Spacer(minLength: 0.0)
            VStack {
                Spacer(minLength: 0.0)
                Image(systemName: "arrow.up.and.down")
                    .font(.system(size: 28.0, weight: .thin))
                    .foregroundStyle(Color(uiColor: DialogTheme.dialogTextMessage))
                Spacer(minLength: 0.0)
            }
            Spacer(minLength: 0.0)
        }
    }
}
