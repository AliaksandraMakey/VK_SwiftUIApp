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
                    .padding(.leading, -110)
            }
            Grid {
                Text(user.name)
                    .font(.largeTitle)
                Text("в сети")
            }  .padding(.leading, -70)
                .frame(width: 100, height: 100)
        }
    }
}

struct UserHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserHeader()
    }
}

