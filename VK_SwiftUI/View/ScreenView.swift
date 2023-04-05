//
//  ScreenView.swift
//  VK_SwiftUI
//
//  Created by aaa on 05/04/2023.
//

import SwiftUI

struct ScreenView: View {
    var body: some View {
        ZStack {
            Image("screen1")
                .resizable()
                .opacity(0.5)
                .ignoresSafeArea()
            LogoView()
                .frame(height: 150)
                .offset(y: -140)
                .padding(.bottom, -150)
                
        }
    }
}

struct ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ScreenView()
    }
}
