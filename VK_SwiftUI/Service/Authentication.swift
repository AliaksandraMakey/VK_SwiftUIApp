//
//  Authentication.swift
//  VK_SwiftUI
//
//  Created by aaa on 05/04/2023.
//

import SwiftUI

// MARK: - Authentication
class Authentication: ObservableObject {
    // properties
    @Published var isValidated = false
    
    // updateValidation
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
    // MARK: AuthenticationError
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials:
                return NSLocalizedString("Either your email or password are incorrect. Please try again", comment: "")
            }
        }
    }
}
