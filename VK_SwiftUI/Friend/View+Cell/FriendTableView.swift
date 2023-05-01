//
//  FriendTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

// MARK: - FriendTableView
struct FriendTableView: View {
    // properties
    @ObservedObject var viewModel: FriendViewModel
    // init
    init(viewModel: FriendViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
//        NavigationView {
        
        // TableView
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
// MARK: - FriendTableView_Previews
struct FriendTableView_Previews: PreviewProvider {
    static var previews: some View {
        FriendTableView(viewModel: FriendViewModel(api: FriendsAPI()))
    }
}

