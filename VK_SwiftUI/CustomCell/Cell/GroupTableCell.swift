//
//  GroupTableCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//


import SwiftUI

struct GroupTableCell<Content: View>: View {
    let content: Content
    let group: GroupModel
    init(group: GroupModel,
         @ViewBuilder content: ()-> Content) {
        self.group = group
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Grid {
                    Image(group.photoAvatar)
                        .imageFrameForCellModifier()
                        .padding(.leading, -10)
                }
                Grid {
                    Text(group.name)
                        .font(.title)
                    Text("update in \(group.date)")
                        .foregroundColor(Color.gray)
                }
                .padding(.leading, -20)
                .frame(width: 250, height: 100)
            }
        }
    }
}
