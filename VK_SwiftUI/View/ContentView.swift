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
        NavigationView {
            VStack {
                Text("Authentication was successful")
                    .font(.title)
                Image(systemName: "star")
            }
            .padding()
            .navigationTitle("Back")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Log out") {
                        authentication.updateValidation(success: false)
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
