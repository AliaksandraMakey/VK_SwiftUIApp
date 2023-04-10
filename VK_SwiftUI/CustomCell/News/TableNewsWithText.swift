//
//  TableViewCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

struct TableNewsWithText<Content: View>: View {
    let content: Content
    let news: NewsModel
    init(news: NewsModel,
         @ViewBuilder content: ()-> Content) {
        self.news = news
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Grid {
                    Image(news.photoAvatar)
                        .imageCornerModifier()
                        .frame(width: 60.0, height: 60.0)
                        .padding(.leading, -10)
                }
                Grid {
                    Text(news.ouner)
                        .font(.title)
                    Text("в сети")
                        .foregroundColor(Color.gray)
                }
                .padding(.leading, -20)
                .frame(width: 100, height: 100)
            }
            Spacer()
            Text(news.text)
                .padding(.leading, -10)
            Spacer()
            
            //FIXME: обработать добавление фото
            HStack {
                if news.photos != nil {
                    Image(news.photos![0])
                        .resizable()
                        .frame(width: 140.0, height: 140.0)
                    Image(news.photos![1])
                        .resizable()
                        .frame(width: 140.0, height: 140.0)
                } else {
                    Spacer()
                }
            }
        }
    }
}
