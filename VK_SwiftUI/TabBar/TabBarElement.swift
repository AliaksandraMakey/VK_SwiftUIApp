//
//  TabBarElement.swift
//  VK_SwiftUI
//
//  Created by aaa on 27/04/2023.
//

import SwiftUI

// MARK: - TabBarElement
struct TabBarElement: TabBarElementView {
    // properties
    internal var content: AnyView
    var tabBarElementItem: TabBarElementItem
    // init
    init<Content: View>(tabBarElementItem: TabBarElementItem,
    @ViewBuilder _ content: () -> Content) {
        self.tabBarElementItem = tabBarElementItem
        self.content = AnyView(content())
    }

    var body: some View { self.content }
}
