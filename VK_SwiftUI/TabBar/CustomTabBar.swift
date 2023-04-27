//
//  CustomTabBar.swift
//  VK_SwiftUI
//
//  Created by aaa on 12/04/2023.
//


import SwiftUI

struct CustomTabBarController: UIViewControllerRepresentable {
    
    var controllers: [UIViewController]
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = UITabBarController()
        controller.viewControllers = controllers
        controller.delegate = context.coordinator
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType,
                                context: Context) {
        
        uiViewController.tabBarController?.setViewControllers(controllers, animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITabBarControllerDelegate {
        var mainTabBar: CustomTabBarController
        
        init(_ tabBarController: CustomTabBarController) {
            mainTabBar = tabBarController
        }
    }
}




