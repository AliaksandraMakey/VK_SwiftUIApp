//
//  GroupTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

struct GroupTableView: View {
    @ObservedObject var viewModel: GroupViewModel
    
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        NavigationView {
            List(viewModel.detachedGroups.sorted(by: {$0.name < $1.name})) { group in
                GroupTableCell(group: group) {
                    Image(group.photo50)
                    Text(group.name)
                
                }
//                   }
//            List(viewModel.groups.sorted(by: {$0.name < $1.name})) { group in
//                GroupTableCell(group: group) {
//                    Image(group.photo50)
//                    Text(group.name)
//
//                }
            } .onAppear { viewModel.fetch()
            }
            .navigationTitle("Group")
        }
    }
}

struct GroupeTableView_Previews: PreviewProvider {
    static var previews: some View {
        GroupTableView(viewModel: GroupViewModel(api: GroupsAPI(), realmService: RealmService()))
    }
}
