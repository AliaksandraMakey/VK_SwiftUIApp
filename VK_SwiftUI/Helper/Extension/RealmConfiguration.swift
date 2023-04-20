//
//  RealmConfiguration.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//


import RealmSwift

extension Realm.Configuration {
    
    static let deleteIfMigration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
}
