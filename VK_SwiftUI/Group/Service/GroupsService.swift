//
//  GroupsService.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import Alamofire
import SwiftUI
import RealmSwift
import SwiftyJSON

// MARK: - GroupsAPI
class GroupsAPI: GroupService {
    // properties
    @ObservedObject var session = Session.shared
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    // getGroups
    func getGroups(completion: ((Swift.Result<[Group], Error>) -> Void)? = nil) {
        let method = "/groups.get"
        let url = baseUrl + method
        // parameters
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "count": "20",
            "fields": "name, photo_50, photo_100",
            "extended": "1",
            "v": session.version
        ]
        // request
        AF.request(url, method: .get, parameters: params).responseData { response in
            self.request = response.request?.description
            
            guard let jsonData = response.data else { return }
            
            do {
                _ = try JSONDecoder().decode(GetGroupResponse.self, from: jsonData)
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                // groups
                let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                
                completion?(.success(groups))
            } catch {
                print(error)
            }
        }
    }
}

