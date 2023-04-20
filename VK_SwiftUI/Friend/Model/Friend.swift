//
//  Friend.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

struct FriendModel: Identifiable, Hashable {
    var id = UUID()
    
    let name: String
    let date: String
    let photoAvatar: String
    let photos: [String]?
}
