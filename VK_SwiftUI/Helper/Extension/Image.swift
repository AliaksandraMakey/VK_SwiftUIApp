//
//  Image.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

extension Image {
    func imageCornerModifier() -> some View {
        self
            .resizable()
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay {
                Circle().stroke(.black, lineWidth: 1)
            }
    }
}
