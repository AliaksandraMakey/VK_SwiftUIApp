//
//  Session.swift
//  VK_SwiftUI
//
//  Created by aaa on 19/04/2023.
//

import SwiftUI
class Session: ObservableObject {

    static let shared = Session()

    private init() {}

    @Published var isAuthorized: Bool = false
    @Published var token = ""
    @Published var userId = ""
    @Published var expiresInDate: Date?
    @Published var version = "5.68"
    @Published var cliendId = "51619940"
}
