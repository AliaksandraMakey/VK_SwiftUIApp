//
//  ContentView.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI


struct ContentView: View {
    @State private var shouldShowMainView: Bool = false
    @ObservedObject var session = Session.shared
    @StateObject var authentication = Authentication()
    
    var body: some View {
           
        ZStack {
//            if authentication.isValidated {
                TabBarView()
//                    .environmentObject(authentication)
//            } else {
//                LoginView()
//                    .environmentObject(authentication)
//            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
