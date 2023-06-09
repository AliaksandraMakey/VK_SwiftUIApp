//
//  Friend.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

// MARK: - GetFriendResponse
struct GetFriendResponse: Codable {
    let response: FriendResponse
}

// MARK: - FriendResponse
struct FriendResponse: Codable {
    let count: Int
    let items: [Friend]
}
// MARK: - Friend
class Friend: Codable, Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo100: String?
    let birthDay: String?
    
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case id
        case birthDay
        case lastName = "last_name"
        case photo100 = "photo_100"
    }
}


