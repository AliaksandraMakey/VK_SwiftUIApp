//
//  GroupViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import SwiftUI
import RealmSwift

// MARK: - GroupViewModel
class GroupViewModel: ObservableObject {
    // properties
    let api: GroupService
    let realmService: AnyRealmService
    let objectWillChange = ObjectWillChangePublisher()
    private(set) lazy var groups: Results<Group>? = try?
    
    realmService.get(Group.self, configuration: .deleteIfMigration)
    var detachedGroups: [Group] { groups?.map { $0.detached() } ?? [] }
    private var notificationToken: NotificationToken?
    
    // init
    init(api: GroupService, realmService: AnyRealmService) {
        self.api = api
        self.realmService = realmService
        
        notificationToken = groups?.observe { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
    // fetchGroup
    public func fetchGroup() {
        api.getGroups { [weak self] result in
            switch result {
            case .success(let groups):
                try? self?.realmService.save(items: groups, configuration: .deleteIfMigration, update: .modified)
            case .failure(let error):
                print(error)
            }
        }
    }
    // deinit
    deinit {
        notificationToken?.invalidate()
    }
}
