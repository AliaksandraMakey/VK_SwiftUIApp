//
//  GroupTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

struct GroupTableView: View {
    var group = [GroupModel]()
    var body: some View {
        NavigationView {
            List(group) { item in
                GroupTableCell(group: item) {
                    Image(item.photoAvatar)
                    Text(item.name)
                    Text(item.date)
                }
            } .navigationTitle("Group")
        }
       
    }
}

struct GroupeTableView_Previews: PreviewProvider {
    static var previews: some View {
        GroupTableView(group: groupArray)
    }
}
