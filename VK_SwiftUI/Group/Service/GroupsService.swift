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

protocol GroupService {
    func getGroups(completion: ((Swift.Result<[Group], Error>) -> Void)?)
}

class GroupsAPI: GroupService {
    
    @ObservedObject var session = Session.shared
    
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    
    func getGroups(completion: ((Swift.Result<[Group], Error>) -> Void)? = nil) {
        let method = "/groups.get"
        let url = baseUrl + method
        
        self.params = [
            "client_id": "51623977",
            "user_id": session.userId,
            "access_token": session.token,
            "count": "20",
            "fields": "name, photo_50, photo_100",
            "extended": "1",
            "v": "5.131"
        ]
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            self.request = response.request?.description
            
            
            guard let jsonData = response.data else { return }
            
            do {
                let usersGroupContainer = try JSONDecoder().decode(GetGroupResponse.self, from: jsonData)
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                
                completion?(.success(groups))
            } catch {
                print(error)
            }
        }
    }
}

