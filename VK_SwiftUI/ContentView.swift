//
//  ContentView.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        VStack {
            // Image and name User
            UserHeader()
            
            NavigationView {
                VStack {
                    NewsTableView(news: newsArray)
                }
                .navigationTitle("News")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Log out") {
                            authentication.updateValidation(success: false)
                        }
                        .foregroundColor(Color.black)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
