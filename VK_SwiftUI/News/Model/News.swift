//
//  File.swift
//  VK_SwiftUI
//
//  Created by aaa on 10/04/2023.
//

import SwiftUI

struct NewsModel: Identifiable {
    var id = UUID()
    
    let ouner: String
    let text: String
    let date: String
    let photoAvatar: String
    let photos: [String]?
}


