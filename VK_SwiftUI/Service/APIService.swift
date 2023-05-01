//
//  APIService.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import Foundation

// MARK: - APIService
class APIService {
    // shared
    static let shared = APIService()
    // login
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
