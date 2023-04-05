//
//  LogoView.swift
//  VK_SwiftUI
//
//  Created by aaa on 05/04/2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("logo")
            .resizable()
             .frame(width: 200.0, height: 200.0)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.black, lineWidth: 10)
            }
            .shadow(radius: 20)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
    }
}
