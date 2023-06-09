//
//  WebViewNavigationDelegate.swift
//  VK_SwiftUI
//
//  Created by aaa on 19/04/2023.
//

import SwiftUI
import WebKit
import RealmSwift

//MARK: - WebViewNavigationDelegate
class WebViewNavigationDelegate: NSObject, WKNavigationDelegate {
    // properties
    @ObservedObject var session = Session.shared
    
    // webView navigation Response
    func webView(_ webView: WKWebView,
                 decidePolicyFor navigationResponse: WKNavigationResponse,
                 decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html" ,
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        // parameters
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                
                return dict
            }
        
        guard let token = params["access_token"],
              let userIdString = params["user_id"],
              let _ = Int(userIdString)
        else {
            decisionHandler(.allow)
            return
        }
        print("TOKEN ---> \(token)")
        // save token
        session.token = token
        session.userId = userIdString
        session.isAuthorized = true
        
        //            UserDefaults.standard.set(token, forKey: "vkToken")
        //            NotificationCenter.default.post(name: NSNotification.Name("vkTokenSaved"), object: self)
        decisionHandler(.cancel)
    }
}

