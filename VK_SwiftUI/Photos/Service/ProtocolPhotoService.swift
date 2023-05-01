//
//  ProtocolPhotoService.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import Foundation

// MARK: - PhotoService
protocol PhotoService {
    // getPhotos
    func getPhotos(userId: Int, completion: @escaping([Photo])->())
}
