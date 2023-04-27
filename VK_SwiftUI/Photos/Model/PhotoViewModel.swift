//
//  PhotoViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import SwiftUI

class PhotoViewModel: ObservableObject {

    let api: PhotoService
    let userId: Friend

    @Published var photos: [Photo] = []

    init(userId: Friend, api: PhotoService) {
        self.userId = userId
        self.api = api
    }

    public func fetchPhotos() {
        api.getPhotos(userId: userId.id) { [weak self] photos in
            guard let self = self else { return }
            self.photos = photos
        }

    }
}
