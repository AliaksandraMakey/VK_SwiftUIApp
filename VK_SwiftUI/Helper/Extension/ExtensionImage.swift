//
//  ExtensionImage.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import SwiftUI

// MARK: - extension for Image
extension Image {
    // sizeForNewsPhotos
    func sizeForNewsPhotos() -> some View {
        self
        // dimension setting
            .resizable()
            .frame(width: 140.0, height: 140.0)
    }
}
