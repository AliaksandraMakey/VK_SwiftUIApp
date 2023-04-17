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
            .shadow(radius: 5)
            .overlay {
                Circle().stroke(.black, lineWidth: 1)
            }
    }
    func imageFrameForCellModifier() -> some View {
        self
            .imageCornerModifier()
        .frame(width: 60.0, height: 60.0)
    }
     
}
