//
//  ProtocolTabBarElementView.swift
//  VK_SwiftUI
//
//  Created by aaa on 27/04/2023.
//

import SwiftUI

// MARK: - TabBarElementView
protocol TabBarElementView: View {
    associatedtype Content
    // properties
    var content: Content { get set }
    var tabBarElementItem: TabBarElementItem { get set }
}
