//
//  ActivityIndicator.swift
//  VK_SwiftUI
//
//  Created by aaa on 27/04/2023.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    @Binding var isAnimating: Bool
    // Формирует UIView на основе переданных данных из SwiftUI.
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView()
        return view
    }
    // Вызывается в случае обновления вью из SwiftUI.
    func updateUIView(_ activityIndicator: UIActivityIndicatorView, context: Context) {
        if isAnimating { activityIndicator.startAnimating()
        } else {
            activityIndicator.stopAnimating()
        }
    }
    // Используется при удалении UIView и позволяет выполнить «чистку» используемых данных.
    static func dismantleUIView(_ uiView: UIActivityIndicatorView, coordinator: ()) {
        uiView.stopAnimating()
    }
}
