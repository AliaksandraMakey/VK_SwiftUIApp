//
//  Group.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI
import RealmSwift


// MARK: - GetGroupResponse
struct GetGroupResponse: Codable {
    let response: GroupResponse
}

// MARK: - GroupResponse
struct GroupResponse: Codable {
    let count: Int
    let items: [Group]
}
// MARK: - Group
class Group: Object, Codable, Identifiable {
    @objc dynamic var id: Int = 0
    @objc dynamic var type: String = ""
    @objc dynamic var photo50: String = ""
    @objc dynamic var photo100: String = ""
    @objc dynamic var name: String = ""
    // MARK: - CodingKeys
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case name
    }
    // primaryKey
    override static func primaryKey() -> String? {
        return "id"
    }
}
