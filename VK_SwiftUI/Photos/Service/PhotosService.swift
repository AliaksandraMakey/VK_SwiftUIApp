//
//  PhotosService.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import Foundation
import Alamofire
import SwiftUI

// MARK: - PhotosAPI
class PhotosAPI: PhotoService {
    // properties
    @ObservedObject var session = Session.shared
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    
    // getFriends
    func getPhotos(userId: Int, completion: @escaping([Photo])->()) {
        let method = "/photos.getAll"
        let url = baseUrl + method
        // parameters
        self.params = [
            "owner_id": ("\(userId)"),
            "access_token": session.token,
            "count": "2",
            "photo_sizes": "1",
            "album_id": "wall",
            "v": session.version
        ]
        // request
        AF.request(url, method: .get, parameters: params).responseData {response in
            self.request = response.request?.description
            
            guard let jsonData = response.data else { return }
            
            do {
                let data = try JSONDecoder().decode(GetPhotoResponse.self, from: jsonData)
                // friendsPhotosArray
                let friendsPhotosArray = data.response.items
                
                completion(friendsPhotosArray)
            } catch {
                print(error)
            }
        }
    }
    
}
