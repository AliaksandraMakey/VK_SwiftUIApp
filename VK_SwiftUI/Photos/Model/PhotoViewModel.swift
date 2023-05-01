//
//  PhotoViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import SwiftUI

// MARK: - PhotoViewModel
class PhotoViewModel: ObservableObject {
    // properties
    let api: PhotoService
    let userId: Friend
    @Published var photos: [Photo]?
    // init
    init(userId: Friend, api: PhotoService) {
        self.userId = userId
        self.api = api
    }
    // fetchPhotos
    public func fetchPhotos() {
        api.getPhotos(userId: userId.id) { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
        }
    }
}
