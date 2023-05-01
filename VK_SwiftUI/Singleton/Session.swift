//
//  Session.swift
//  VK_SwiftUI
//
//  Created by aaa on 19/04/2023.
//

import SwiftUI

// MARK: - Session
class Session: ObservableObject {
    // shared
    static let shared = Session()
    // init
    private init() {}
    // properties
    @Published var isAuthorized: Bool = false
    @Published var token = ""
    @Published var userId = ""
    @Published var expiresInDate: Date?
    @Published var version = "5.131"
    @Published var cliendId = "51619940"
    
}
