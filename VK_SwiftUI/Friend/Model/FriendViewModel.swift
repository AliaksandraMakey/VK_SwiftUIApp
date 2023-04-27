//
//  FriendViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import SwiftUI
import RealmSwift


class FriendViewModel: ObservableObject {
    
    let api: FriendService
    
    @Published var friends: [Friend] = []
    
    init(api: FriendService) {
        self.api = api
    }
    public func fetchFriend() {
        api.getFriends { [weak self] friends in
            guard let self = self else { return }
            self.friends = (friends?.response.items)!
        }
    }
}
