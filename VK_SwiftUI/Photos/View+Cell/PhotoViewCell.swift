//
//  PhotoViewCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 13/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - PhotoViewCell
struct PhotoViewCell: View {
    // properties
    var photo: Photo
    // init
    init(photo: Photo) {
        self.photo = photo
    }
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                // Image
                    WebImage(url: URL(string: photo.sizes.last?.url ?? ""))
                // dimension setting
                    .resizable()
                    .shadow(radius: 3)
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .aspectRatio(contentMode: .fit)
                Spacer()
                // Like button
                CustomLikeButton()
                    .frame(width: proxy.size.width)
            }
        }
    }
}
