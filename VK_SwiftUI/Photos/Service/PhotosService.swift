//
//  PhotosService.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import Foundation
import Alamofire
import SwiftUI

//import SwiftyJSON
protocol PhotoService {
    func getPhotos(userId: Int, completion: @escaping([Photo])->())
}

class PhotosAPI: PhotoService {

    @ObservedObject var session = Session.shared

    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?


    // MARK: - DTO Вызов фото друзей
    func getPhotos(userId: Int, completion: @escaping([Photo])->()) {
        let method = "/photos.getAll"
        let url = baseUrl + method

            self.params = [
            "owner_id": ("\(userId)"),
            "access_token": session.token,
            "count": "2",
            "photo_sizes": "1",
            "album_id": "wall",
            "v": "5.131"
        ]
//        params["count"] = "2"


        AF.request(url, method: .get, parameters: params).responseData {response in
            self.request = response.request?.description

            guard let jsonData = response.data else { return }

            do {
            let data = try JSONDecoder().decode(GetPhotoResponse.self, from: jsonData)

                let friendsPhotosArray = data.response.items

                completion(friendsPhotosArray)
            } catch {
                print(error)
            }
        }
    }

}
