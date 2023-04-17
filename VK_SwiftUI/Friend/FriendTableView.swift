//
//  FriendTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

struct FriendTableView: View {
    var friends = [FriendModel]()
    
    var body: some View {
        NavigationView {
            List(friends) { item in
                FriendTableCell(friend: item) {
                    Image(item.photoAvatar)
                    Text(item.name)
                    Text(item.date)
                }
            } .navigationTitle("Friend")
        }
    }
}

struct FriendTableView_Previews: PreviewProvider {
    static var previews: some View {
        FriendTableView(friends: friendArray)
    }
}

