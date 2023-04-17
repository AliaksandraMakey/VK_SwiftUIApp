//
//  ContentView.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI


struct ContentView: View {
    @EnvironmentObject var authentication: Authentication
    @State private var selectedTab: Tab = .newspaper
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack {
            // Image and name User
            UserHeader()
                .padding(.top, -10)
            NavigationView {
                ZStack {
                    VStack {
                        TabView(selection: $selectedTab) {
                            ForEach(Tab.allCases, id: \.rawValue) { tab in
                                HStack {
                                    switch selectedTab {
                                    case .person:
                                        FriendTableView(friends: friendArray)
                                    case .newspaper:
                                        NewsTableView(news: newsArray)
                                    case .folder:
                                        GroupTableView(group: groupArray)
                                    }
                                }
                                .tag(tab)
                            }
                        }
                    }
                    
                    VStack {
                        Spacer()
                        CustomTabBar(selectedTab: $selectedTab)
                    }
                }
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
