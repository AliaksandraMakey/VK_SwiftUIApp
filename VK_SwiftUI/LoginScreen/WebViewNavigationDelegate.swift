//
//  WebViewNavigationDelegate.swift
//  VK_SwiftUI
//
//  Created by aaa on 19/04/2023.
//

import SwiftUI
import WebKit

class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    
    @ObservedObject var session = Session.shared
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([ String: String ](), { partialResult, param in
                var dictionary = partialResult
                let key = param[0]
                let value = param[1]
                dictionary[key] = value
                return dictionary
            })
        
        guard
            let token = params["access_token"],
            let userIDString = params["user_id"],
            let expiresInString = params["expires_in"],
            let userID = Int(userIDString),
            let expiresIn = Int(expiresInString)
        else { return }
        
        print("TOKEN ---> \(token)")
        print(userID)
        session.token = token
        session.userId = userID
        session.isAuthorized = true
        
        
        decisionHandler(.cancel)
    }
}

