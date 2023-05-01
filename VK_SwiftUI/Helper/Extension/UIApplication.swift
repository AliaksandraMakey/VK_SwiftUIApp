//
//  Extension.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import UIKit

// MARK: - extension UIApplication
extension UIApplication {
    // endEditing
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
