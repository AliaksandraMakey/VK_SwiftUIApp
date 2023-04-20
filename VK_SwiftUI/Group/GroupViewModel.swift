//
//  GroupViewModel.swift
//  VK_SwiftUI
//
//  Created by aaa on 20/04/2023.
//

import SwiftUI

class GroupsViewModel: ObservableObject {

    let api: GroupsService
    let objectWillChange = ObjectWillChangePublisher()

    @Published var groups: [Group] = []

    init(api: GroupsService) {
        self.api = api
    }


    public func fetch() {

        api.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groups = groups
        }
    }
}
