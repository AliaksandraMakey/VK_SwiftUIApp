//
//  GroupTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

// MARK: - GroupTableView
struct GroupTableView: View {
    // properties
    @ObservedObject var viewModel: GroupViewModel
    // init
    init(viewModel: GroupViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
//        NavigationView {
        
        // TableView
            List(viewModel.detachedGroups.sorted(by: {$0.name < $1.name})) { group in
                // Cell
                GroupTableCell(group: group) {
                    Image(group.photo100)
                    Text(group.name)
                }
//            }
            .onAppear { viewModel.fetchGroup()}
//            .navigationTitle("Group")
        }
    }
}
// MARK: - GroupeTableView_Previews
struct GroupeTableView_Previews: PreviewProvider {
    static var previews: some View {
        GroupTableView(viewModel: GroupViewModel(api: GroupsAPI(), realmService: RealmService()))
    }
}
