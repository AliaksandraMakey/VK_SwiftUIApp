//
//  PhotoViewCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 13/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI


struct PhotoViewCell: View {
    @ObservedObject var viewModel: PhotoViewModel
       var friend: Friend

       init(friend: Friend, viewModel: PhotoViewModel) {
           self.friend = friend
           self.viewModel = viewModel
       }

    let widht = (UIScreen.main.bounds.width) - 10
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(0..<(viewModel.photos.count), id: \.self) { index in
                            // TODO: Add error handling
                                VStack {
                                    WebImage(url: URL(string: (viewModel.photos[index].sizes.last?.url) ?? ""))
//                                        .imageCornerModifier()
                                        .frame(width: widht, height: widht)
                                    CustomLikeButton()
                                }
                }
            }
        }
    }
}
