//
//  User.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import Foundation

// MARK: - User
struct User: Codable {
    // properties
    var name: String = "Alex"
    var id: Int = 0
    var photoAvatar: String = "Alex"
    var email: String = ""
    var password: String = ""
}
