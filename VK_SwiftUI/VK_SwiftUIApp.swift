//
// VK_SwiftUIApp.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI

@main
struct VK_SwiftUIApp: App {
    var body: some Scene {
        
        WindowGroup {
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
                .navigationBarTitle("", displayMode: .inline)
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
                .foregroundColor(Color.black)
                .edgesIgnoringSafeArea([.top, .bottom])
            }
        }
    }
}
