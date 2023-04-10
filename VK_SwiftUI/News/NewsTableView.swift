//
//  NewsTableView.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

struct NewsTableView: View {
    var news = [NewsModel]()
    var body: some View {
        List(news) { item in
            TableNewsWithText(news: item) {
                Image(item.photoAvatar)
                Text(item.ouner)
                Text(item.text)
            }
        }
    }
}

struct NewsTableView_Previews: PreviewProvider {
    static var previews: some View {
        NewsTableView(news: newsArray)
    }
}
