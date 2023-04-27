//
//  Photo.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import SwiftUI

struct GetPhotoResponse: Codable {
    let response: PhotoResponse
}

struct PhotoResponse: Codable {
    let count: Int
    let items: [Photo]
}

// MARK: - Item
struct Photo: Codable, Identifiable {
    let id, date, albumId, ownerId: Int
    let sizes: [Size]
    
    enum CodingKeys: String, CodingKey {
        case albumId = "album_id"
        case id, date, sizes
        case ownerId = "owner_id"
    }
}
struct Size: Codable {
    let width, height: Int
    let url: String
    let type: String
}
