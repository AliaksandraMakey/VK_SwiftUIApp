//
//  GroupViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import Foundation
import RealmSwift

class GroupViewModel: ObservableObject {

    let api: GroupService
    let objectWillChange = ObjectWillChangePublisher()

    @Published var groups: [Group] = []

    init(api: GroupService) {
        self.api = api
    }

    public func fetch() {

        api.getGroups { [weak self] groups in
            guard let self = self else { return }
            print(groups)
            self.groups = groups
        }
    }
}
//class GroupViewModel: ObservableObject {
//
//    let api: GroupsService
//    let realmService: AnyRealmService
//    let objectWillChange = ObjectWillChangePublisher()
//    private(set) lazy var groups: Results<Group>? = try? realmService.get(Group.self, configuration: .deleteIfMigration)
//
//    var detachedGroups: [Group] { groups?.map { $0.detached() } ?? [] }
//
//    private var notificationToken: NotificationToken?
//    @Published var groups: [Group] = []
//    init(api: GroupsService, realmService: AnyRealmService) {
//        self.api = api
//        self.realmService = realmService
//
//        notificationToken = groups?.observe { [weak self] _ in
//            self?.objectWillChange.send()
//        }
//    }
//    public func fetch() {
//        print("Groups requested")
//        api.getGroups { [weak self] result in
//            switch result {
//            case .success(let groups):
//                try? self?.realmService.save(items: groups, configuration: .deleteIfMigration, update: .modified)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    deinit {
//        notificationToken?.invalidate()
//    }
//}
