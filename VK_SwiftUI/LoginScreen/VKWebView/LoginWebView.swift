//
//  LoginWebView.swift
//  VK_SwiftUI
//
//  Created by aaa on 19/04/2023.
//

import SwiftUI
import WebKit

struct LoginWebView: UIViewRepresentable {
   static let webView: WKWebView = WKWebView()
    @ObservedObject var session = Session.shared
   
    fileprivate let navigationDelegate = WebViewNavigationDelegate()
    
    
    func makeUIView(context: Context) -> WKWebView {
        LoginWebView.webView.navigationDelegate = navigationDelegate
        return LoginWebView.webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let request = buildAuthRequest() {
            if session.token == "" {
                uiView.load(request)
            } else {return}
        }
    }
    
    private func buildAuthRequest() -> URLRequest? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "oauth.vk.com"
        components.path = "/authorize"
        components.queryItems = [
            URLQueryItem(name: "client_id", value: "51623977"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "270342"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
            ]
            
        return components.url.map { URLRequest(url: $0) }
    }
}
