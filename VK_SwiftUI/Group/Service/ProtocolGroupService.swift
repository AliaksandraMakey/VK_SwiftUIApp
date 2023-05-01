//
//  ProtocolGroupService.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import Foundation

// MARK: - GroupService protocol
protocol GroupService {
    // getGroups
    func getGroups(completion: ((Swift.Result<[Group], Error>) -> Void)?)
}
