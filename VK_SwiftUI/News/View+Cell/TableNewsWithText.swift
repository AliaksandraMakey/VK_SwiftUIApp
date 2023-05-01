//
//  TableViewCell.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

// MARK: - NewsTableView
struct TableNewsWithText<Content: View>: View {
    // properties
    let content: Content
    let news: NewsModel
    // init
    init(news: NewsModel,
         @ViewBuilder content: ()-> Content) {
        self.news = news
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Grid {
                    ImageBuilder {
                        // Image
                        Image(news.photoAvatar)
                    }
                        .padding(.leading, -10)
                }
                Grid {
                    // Text
                    Text(news.ouner)
                        .font(.title)
                    // Text
                    Text("в сети")
                        .foregroundColor(Color.gray)
                }
                // dimension setting
                .padding(.leading, -20)
                .frame(width: 200, height: 100)
            }
            Spacer()
            // Text
            Text(news.text)
                .padding(.leading, -10)
            Spacer()
            
            //FIXME: обработать добавление фото
            HStack {
                if news.photos != nil {
                    // Image
                    Image(news.photos![0])
                        .sizeForNewsPhotos()
                    // Image
                    Image(news.photos![1])
                        .sizeForNewsPhotos()
                } else {
                    Spacer()
                }
            }
        }
    }
}
