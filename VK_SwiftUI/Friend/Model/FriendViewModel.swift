//
//  FriendViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import SwiftUI
import RealmSwift

// MARK: - FriendViewModel
class FriendViewModel: ObservableObject {
    // properties
    let api: FriendService
    @Published var friends: [Friend] = []
    // init
    init(api: FriendService) {
        self.api = api
    }
    // fetchFriend
    public func fetchFriend() {
        api.getFriends { [weak self] friends in
            guard let self = self else { return }
            self.friends = (friends?.response.items)!
        }
    }
}
