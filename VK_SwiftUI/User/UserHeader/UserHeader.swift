//
//  UserHeader.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

// MARK: - UserHeader
struct UserHeader: View {
    // properties
    var user = User()
    
    var body: some View {
        HStack() {
            Grid {
                // User's avatar
                ImageBuilder {
                    Image(user.photoAvatar)
                }
                .padding(.leading, -140)
                .frame(width: 85.0, height: 85.0)
                
            }
            Grid {
                // User's name
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
// MARK: - UserHeader_Previews
struct UserHeader_Previews: PreviewProvider {
    static var previews: some View {
        UserHeader()
    }
}

