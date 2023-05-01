//
//  GroupTableCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//


import SwiftUI
import SDWebImageSwiftUI

// MARK: - GroupTableCell
struct GroupTableCell<Content: View>: View {
    // properties
    let content: Content
    let group: Group
    // init
    init(group: Group,
         @ViewBuilder content: ()-> Content) {
        self.group = group
        self.content = content()
    }
  
    var body: some View {
        // FIXME: Расположить аватарки Групп по центру
        HStack {
            WebImageBuilder {
                    WebImage(url: URL(string: group.photo100))
                }
                .padding(.leading, 10)
            Spacer()
            Grid(alignment: .center){
                Text(group.name)
                // dimension setting
                    .frame(width: 200, height: 100)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.gray)
            }
            .padding(.leading, 20)
        }
    }
}
