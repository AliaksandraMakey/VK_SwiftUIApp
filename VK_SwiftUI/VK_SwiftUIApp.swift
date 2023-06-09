//
// VK_SwiftUIApp.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI

// MARK: - VK_SwiftUIApp
@main
struct VK_SwiftUIApp: App {

    var body: some Scene {
        WindowGroup {
            // Navigation stack
            NavigationStack {
                VStack {
                    NavigationLink(destination:  LoginWebView()) {
                        Text("Login Web View")
                    }
                    Divider()
                    NavigationLink(destination:  ContentView()) {
                        Text("Login View")
                    }
                }
                //  TableView example, how it's works.
                .tabViewStyle(PageTabViewStyle())
                .rotationEffect(Angle(degrees: 0))
                // navigation bar
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea([.top, .bottom])
            }
            
        }
    }
}
