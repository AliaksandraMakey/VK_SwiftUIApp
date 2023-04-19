//
//  APIService.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func login(user: User, completion: @escaping ((Result<Bool, Authentication.AuthenticationError>)-> Void)) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if user.password == "12" {
                completion(.success(true))
            } else {
                completion(.failure(.invalidCredentials))
            }
        }
    }
}
