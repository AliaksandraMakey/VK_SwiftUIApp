//
//  Photo.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import SwiftUI

// MARK: - GetPhotoResponse
struct GetPhotoResponse: Codable {
    let response: PhotoResponse
}
// MARK: - PhotoResponse
struct PhotoResponse: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable, Identifiable {
    let id, date, albumId, ownerId: Int
    let sizes: [Size]
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case albumId = "album_id"
        case id, date, sizes
        case ownerId = "owner_id"
    }
}

// MARK: - PhotoResponse
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
