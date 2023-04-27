//
//  FriendTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

struct FriendTableView: View {
    @ObservedObject var viewModel: FriendViewModel
    
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
//        NavigationView {
        
            List(viewModel.friends.sorted(by: {$0.lastName < $1.lastName})) { friend in
           
                FriendTableCell(friend: friend) {
                    Image(friend.photo100 ?? "")
                    Text("\(friend.firstName) \(friend.lastName)")
//                    Text("\(friend.birthDay)")
                }
            }
            .onAppear { viewModel.fetchFriend()}
//            .navigationTitle("Friend")
//        }
    }
}

struct FriendTableView_Previews: PreviewProvider {
    static var previews: some View {
        FriendTableView(viewModel: FriendViewModel(api: FriendsAPI()))
    }
}

