//
//  FriendTableCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct FriendTableCell<Content: View>: View {
    let content: Content
    let friend: Friend
    @State private var showingSheet = false
    
    init(friend: Friend,
         @ViewBuilder content: ()-> Content) {
        self.friend = friend
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Grid {
                    WebImage(url: URL(string: friend.photo100 ?? ""))
                            .clipShape(Circle())
                            .shadow(radius: 5)
                            .overlay {
                                Circle().stroke(.black, lineWidth: 1)
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
                            PhotoViewCell(friend: friend, viewModel: PhotoViewModel(userId: friend, api: PhotosAPI()))
                        }
                }
                .padding(.leading, -20)
                .frame(width: 250, height: 100)
            }
        }
    }
}
