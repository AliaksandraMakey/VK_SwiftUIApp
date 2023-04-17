//
//  FriendTableCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

struct FriendTableCell<Content: View>: View {
    let content: Content
    let friend: FriendModel
    @State private var showingSheet = false
    
    init(friend: FriendModel,
         @ViewBuilder content: ()-> Content) {
        self.friend = friend
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Grid {
                    Image(friend.photoAvatar)
                        .imageFrameForCellModifier()
                        .padding(.leading, -10)
                }
                Grid {
                    Text(friend.name)
                        .font(.title)
                    Text("b-day in \(friend.date)")
                        .foregroundColor(Color.gray)
                    Button("") {
                        showingSheet.toggle()
                    } .padding()
                        .sheet(isPresented: $showingSheet) {
                            CollectionViewCell(friend: friend) {
                                ForEach(0...(friend.photos!.count), id: \.self) { index in
                                    ZStack {
                                        Image("\(friend.photos?[index])")
                                    }
                                }
                            }
                        }
                }
                
                .padding(.leading, -20)
                .frame(width: 250, height: 100)
                // добавить переход на экран CollectionViewCell + показать фото
            }
        }
    }
}
