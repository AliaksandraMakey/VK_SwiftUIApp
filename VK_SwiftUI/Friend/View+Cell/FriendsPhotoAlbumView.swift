//
//  FriendsPhotoAlbumView.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI

// MARK: - FriendsPhotoAlbumView
struct FriendsPhotoAlbumView: View {
    // properties
    @ObservedObject var viewModel: PhotoViewModel
    @State private var photoRowHeight: CGFloat? = nil
    @State private var selection: Int? = nil
    let columns = [
        GridItem(.flexible(minimum: 0, maximum: .infinity)),
        GridItem(.flexible(minimum: 0, maximum: .infinity))
    ]
    // init
    init(viewModel: PhotoViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            VStack {
                WebImageBuilder {
                    WebImage(url: URL(string: viewModel.userId.photo100 ?? ""))
                }
                Text("\((viewModel.userId.firstName )) \(viewModel.userId.lastName )")
                    .lineLimit(1)
                    .font(.title)
            }
            GeometryReader { geometry in
                ScrollView(.vertical) {
                    // Collection Cell setting
                    LazyVGrid(columns: columns, alignment: .center) {
                        if let photos = viewModel.photos {
                            ForEach(photos) { photo in
                                PhotoViewCell(photo: photo)
                                    .frame(height: geometry.size.width/2)
                                    .frame(height: photoRowHeight)
                            }
                        }
                    }
                }
            }
            .onAppear { viewModel.fetchPhotos()
            }
        }
    }
}
