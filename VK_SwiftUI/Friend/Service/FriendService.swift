//
//  FriendService.swift
//  VK_SwiftUI
//
//  Created by aaa on 26/04/2023.
//

import Alamofire
import SwiftUI
import SwiftyJSON

// MARK: - FriendsAPI
class FriendsAPI: FriendService {
    // properties
    @ObservedObject var session = Session.shared
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    // getFriends
    func getFriends(completion: @escaping (GetFriendResponse?) -> ()) {
        let method = "/friends.get"
        let url = baseUrl + method
        // parameters
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "count": "5",
            "fields": "bdate, photo_100",
            "v": session.version
        ]
        // request
        AF.request(url, method: .get, parameters: params).responseData{ response in
            self.request = response.request?.description

            guard let jsonData = response.data else { return }

            do {
                // friends
                let friends = try JSONDecoder().decode(GetFriendResponse.self, from: jsonData)
          
                completion(friends)
            } catch {
                print(error)
            }
        }
    }
}
