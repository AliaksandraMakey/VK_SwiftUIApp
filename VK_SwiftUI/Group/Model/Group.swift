//
//  Group.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI
import RealmSwift

//struct GroupModel: Identifiable {
//    var id = UUID()
//
//    let name: String
//    let date: String
//    let photoAvatar: String
//}

    // MARK: - GroupContainer
    struct GetGroupResponse: Decodable {
        let response: GroupResponse
    }

    // MARK: - Response
    struct GroupResponse: Decodable {
        let count: Int
        let items: [Group]
    }
//
//    // MARK: - Item
//    struct Group: Decodable, Identifiable {
//        let id: Int
//        let name: String
//        let photo50: String
//
//        enum GroupeItemKeys: String, CodingKey {
//                case id, name
//                case photo50 = "photo_50"
//        }
//        public init(from decoder: Decoder) throws {
//            let value = try decoder.container(keyedBy: GroupeItemKeys.self)
//            id = try value.decode(Int.self, forKey: .id)
//            name = try value.decode(String.self, forKey: .name)
//            photo50 = try value.decode(String.self, forKey: .photo50)
//        }
//    }

class Group: Object, Codable, Identifiable {
    @objc dynamic var id: Int = 0
//    @objc dynamic var isClosed: Int = 0
//    @objc dynamic var isAdvertiser: Int = 0
    @objc dynamic var type: String = ""
//    @objc dynamic var isMember: Int = 0
    @objc dynamic var photo50: String = ""
//    @objc dynamic var photo200: String = ""
//    @objc dynamic var activity: String = "N/A"
//    @objc dynamic var isAdmin: Int = 0
//    @objc dynamic var photo100: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var screenName: String = ""

enum CodingKeys: String, CodingKey {
        case id
//        case isClosed = "is_closed"
//        case isAdvertiser = "is_advertiser"
        case type
//        case isMember = "is_member"
        case photo50 = "photo_50"
//        case photo200 = "photo_200"
//        case activity
//        case isAdmin = "is_admin"
//        case photo100 = "photo_100"
        case name
        case screenName = "screen_name"
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
