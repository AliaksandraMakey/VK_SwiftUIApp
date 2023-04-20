//
//  UserHeader.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

struct UserHeader: View {
    var user = User()
    var body: some View {
        HStack() {
            Grid {
                Image(user.photoAvatar)
                    .imageCornerModifier()
                    .frame(width: 85.0, height: 85.0)
                    .padding(.leading, -140)
            }
            Grid {
                Text(user.name)
                    .font(.largeTitle)
                Text("в сети")
                    .foregroundColor(.gray)
            }
            .padding(.leading, -90)
            .frame(width: 80, height: 80)
        }
        
    }
}

struct UserHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserHeader()
    }
}

