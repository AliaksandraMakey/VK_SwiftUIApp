//
//  ImageBuilder.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import SwiftUI

// MARK: - ImageBuilder
struct ImageBuilder: View {
    // properties
    @State private var isScaled = false
    var content: Image
    // init
    init(@ViewBuilder content: () -> Image) {
        self.content = content()
    }

    var body: some View {
        content
        // dimension setting
            .resizable()
            .clipShape(Circle())
            .shadow(radius: 5)
            .overlay {
                Circle().stroke(.black, lineWidth: 1)
            }
            .frame(width: 85.0, height: 85.0)
        // animation
            .scaleEffect(isScaled ? 1.5 : 1.0)
            .onTapGesture {
                withAnimation(.spring(response: 0.55,
                                      dampingFraction: 0.8,
                                      blendDuration: 0.5)) {
                    self.isScaled.toggle()
                }
                self.isScaled.toggle()
            }
    }
}
