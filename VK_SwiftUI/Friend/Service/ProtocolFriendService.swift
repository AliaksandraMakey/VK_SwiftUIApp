//
//  ProtocolFriendService.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import Foundation

// MARK: - FriendService
protocol FriendService {
    // getFriends
    func getFriends(completion: @escaping (GetFriendResponse?) -> ())
}
