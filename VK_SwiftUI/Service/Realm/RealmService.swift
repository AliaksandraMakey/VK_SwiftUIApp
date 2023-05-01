//
//  RealmService.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import SwiftUI
import RealmSwift

// MARK: - RealmService
class RealmService: AnyRealmService {
    // save
    func save<T: Object>(
        items: [T],
        configuration: Realm.Configuration = .deleteIfMigration,
        update: Realm.UpdatePolicy = .modified
    ) throws {
        let realm = try Realm(configuration: configuration)
        print(configuration.fileURL ?? "")
        try realm.write {
            realm.add(items, update: update)
        }
    }
    // get Results
    func get<T: Object>(
        _ type: T.Type,
        configuration: Realm.Configuration = .deleteIfMigration
    ) throws -> Results<T> {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        return realm.objects(type)
    }
    // get Array
    func get<T: Object>(
        _ type: T.Type,
        configuration: Realm.Configuration = .deleteIfMigration
    ) throws -> Array<T> {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        return realm.objects(type).map { $0.detached() }
    }
    // delete
    func delete<T: Object>(
        object: T,
        configuration: Realm.Configuration = .deleteIfMigration
    ) throws {
        print(configuration.fileURL ?? "")
        let realm = try Realm(configuration: configuration)
        try realm.write {
            realm.delete(object)
        }
    }
}
