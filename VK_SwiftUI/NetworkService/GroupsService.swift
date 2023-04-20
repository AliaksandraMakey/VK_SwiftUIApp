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
    func getGroups(completion: @escaping (([Group]) -> Void))
}

class GroupsAPI: GroupService {
    
    @ObservedObject var session = Session.shared
    
    let baseUrl = "https://api.vk.com/method"
    var params: Parameters = [:]
    var request: String?
    
    func getGroups(completion: @escaping (([Group]) -> Void)) {
        let method = "/groups.get"
        let url = baseUrl + method
        
        self.params = [
            "client_id": session.cliendId,
            "user_id": session.userId,
            "access_token": session.token,
            "v": session.version
        ]
  
        params["extended"] = "1"
        params["fields"] = "name, photo_50"
        params["count"] = "10"
        
        AF.request(url, method: .get, parameters: params).responseData { response in
            self.request = response.request?.description
            
            print("вызов групп пользователя")
            //            print( response.result)
//            print(response.data?.prettyJSON)
            
            guard let jsonData = response.data else { return }
            
            do {
                
                let usersGroupContainer = try JSONDecoder().decode(GetGroupResponse.self, from: jsonData)
                
                let itemsData = try JSON(jsonData)["response"]["items"].rawData()
                let groups = try JSONDecoder().decode([Group].self, from: itemsData)
                
                completion(groups)
            } catch {
                print(error)
            }
        }
    }
}
