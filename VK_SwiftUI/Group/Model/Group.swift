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
    struct GetGroupResponse: Codable {
        let response: GroupResponse
    }
    
    // MARK: - Response
    struct GroupResponse: Codable {
        let count: Int
        let items: [Group]
    }
    
    // MARK: - Item
    struct Group: Codable, Identifiable {
        let id: Int
        let name: String
        let photo50: String
        
        enum GroupeItemKeys: String, CodingKey {
                case id, name
                case photo50 = "photo_50"
        }
        public init(from decoder: Decoder) throws {
            let value = try decoder.container(keyedBy: GroupeItemKeys.self)
            id = try value.decode(Int.self, forKey: .id)
            name = try value.decode(String.self, forKey: .name)
            photo50 = try value.decode(String.self, forKey: .photo50)
        }
    }
