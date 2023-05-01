//
//  UITabBarWrapper.swift
//  VK_SwiftUI
//
//  Created by aaa on 27/04/2023.
//

import SwiftUI

// MARK: - UITabBarWrapper
struct UITabBarWrapper: View {
    // properties
    var controllers: [UIHostingController<TabBarElement>]
    // init
    init(_ elements: [TabBarElement]) {
        self.controllers = elements.enumerated().map {
            let hostingController = UIHostingController(rootView: $1)
            
            hostingController.tabBarItem = UITabBarItem(
                title: $1.tabBarElementItem.title,
                image: UIImage.init( systemName: $1.tabBarElementItem.systemImageName),
                tag: $0)
            
            return hostingController
        }
    }

    var body: some View {
        CustomTabBarController(controllers: self.controllers)
    }
}
