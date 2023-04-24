//
//  CollectionViewCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 13/04/2023.
//

import SwiftUI


struct CollectionViewCell<Content: View>: View {
    let content: Content
    let friend: FriendModel
    
    init(friend: FriendModel,
         @ViewBuilder content: ()-> Content) {
        self.friend = friend
        self.content = content()
    }
    
    let columns: Int = 2
    var rows: Int {
        (friend.photos?.count ?? 0)/2
    }
    let widht = (UIScreen.main.bounds.width) - 10
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<(friend.photos?.count ?? 0), id: \.self) { index in
                            // TODO: Add error handling
                            if friend.photos?.count != nil {
                                VStack {
                                    Image("\(friend.photos![index])")
                                        .imageCornerModifier()
                                        .frame(width: widht, height: widht)
                                    CustomLikeButton()
                                }
                     
                    }
                }
            }
        }
    }
}
