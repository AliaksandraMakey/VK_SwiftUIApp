//
//  GroupTableCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//


import SwiftUI
import SDWebImageSwiftUI

struct GroupTableCell<Content: View>: View {
    let content: Content
    let group: Group
    init(group: Group,
         @ViewBuilder content: ()-> Content) {
        self.group = group
        self.content = content()
    }
  
    var body: some View {
        // FIXME: Расположить аватарки Групп по центру
        HStack {
            Grid{
                WebImage(url: URL(string: group.photo100))
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .shadow(radius: 10)
                    .overlay {
                        Circle().stroke(.black, lineWidth: 1)
                    }
            }
            .padding(.leading, 10)
            Spacer()
            Grid(alignment: .center){
                Text(group.name)
                    .frame(width: 200, height: 100)
                    .font(.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.gray)
            }
            .padding(.leading, 20)
        }
    }
}
