//
//  AnyRealmService.swift
//  VK_SwiftUI
//
//  Created by aaa on 01/05/2023.
//

import SwiftUI
import RealmSwift

// MARK: - protocol AnyRealmService
protocol AnyRealmService {
    // save
    func save<T: Object>(items: [T],
                         configuration: Realm.Configuration,
                         update: Realm.UpdatePolicy) throws
    // get Results
    func get<T: Object>(_ type: T.Type,
                        configuration: Realm.Configuration) throws -> Results<T>
    // get Array
    func get<T: Object>(_ type: T.Type,
                        configuration: Realm.Configuration) throws -> [T]
    // delete
    func delete<T: Object>(object: T,
                           configuration: Realm.Configuration) throws
}
