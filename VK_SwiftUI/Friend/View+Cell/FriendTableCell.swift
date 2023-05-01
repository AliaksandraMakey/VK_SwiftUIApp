//
//  FriendTableCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - FriendTableCell
struct FriendTableCell<Content: View>: View {
    // properties
    let content: Content
    let friend: Friend
    @State private var showingSheet = false
    // init
    init(friend: Friend,
         @ViewBuilder content: ()-> Content) {
        self.friend = friend
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Grid {
                    WebImageBuilder {
                        WebImage(url: URL(string: friend.photo100 ?? ""))
                    }
                    .padding(.leading, +20)
                }
                Grid {
                    VStack {
                        Text("\(friend.firstName) \(friend.lastName)")
                        //                        Text("\(friend.birthDay)")
                    }
                    .font(.title)
                    .foregroundColor(Color.gray)
                    
                    Button("") {
                        showingSheet.toggle()
                    } .padding()
                        .sheet(isPresented: $showingSheet) {
                            FriendsPhotoAlbumView(viewModel: PhotoViewModel(userId: friend, api: PhotosAPI()))

                        }
                }
                // dimension setting for first VStack
                .padding(.leading, -20)
                .frame(width: 250, height: 100)
            }
        }
    }
}
