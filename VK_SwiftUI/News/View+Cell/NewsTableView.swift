//
//  NewsTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

// MARK: - NewsTableView
struct NewsTableView: View {
    // properties
    var news = [NewsModel]()
    var body: some View {
//        NavigationView {
            List(news) { item in
                TableNewsWithText(news: item) {
                    Image(item.photoAvatar)
                    Text(item.ouner)
                    Text(item.text)
                }
//            }
//            .navigationTitle("News")
        }
    }
}
// MARK: - NewsTableView_Previews
struct NewsTableView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTableView(news: newsArray)
    }
}
