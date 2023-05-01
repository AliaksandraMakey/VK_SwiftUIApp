//
//  LoginViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import Foundation

// MARK: - LoginModel
class LoginModel: ObservableObject {
    // properties
    @Published var user = User()
    @Published var showProgressView = false
    @Published var error: Authentication .AuthenticationError?

    var loginDisabled: Bool {
        user.email.isEmpty || user.password.isEmpty
    }
    // login
    func login(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        APIService.shared.login(user: user) { [unowned self] (result: Result<Bool, Authentication.AuthenticationError>) in
            showProgressView = false
            switch result {
            case .success:
                completion(true)
            case .failure(let authenticationError):
                user = User()
                error = authenticationError
                completion(false)
            }
        }
    }
}
