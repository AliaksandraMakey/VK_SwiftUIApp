//
//  CustomTabBar.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//

import SwiftUI

// MARK: - CustomTabBarController
struct CustomTabBarController: UIViewControllerRepresentable {
    // properties
    var controllers: [UIViewController]
    
    // makeUIViewController
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UITabBarController()
        controller.viewControllers = controllers
        controller.delegate = context.coordinator
        
        return controller
    }
    
    // updateUIViewController
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
        uiViewController.tabBarController?.setViewControllers(controllers, animated: true)
    }
    
    // makeCoordinator
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // MARK: Coordinator
    class Coordinator: NSObject, UITabBarControllerDelegate {
        // properties
        var mainTabBar: CustomTabBarController
        
        // init
        init(_ tabBarController: CustomTabBarController) {
            mainTabBar = tabBarController
        }
    }
}




