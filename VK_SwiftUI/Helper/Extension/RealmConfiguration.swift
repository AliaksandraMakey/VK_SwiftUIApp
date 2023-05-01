//
//  RealmConfiguration.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import RealmSwift

// MARK: - extension Realm Configuration
extension Realm.Configuration {
    // properties
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
}
