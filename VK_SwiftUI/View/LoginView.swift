//
//  LoginView.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var loginViewModel = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    var body: some View {
        // VStack
        VStack {
            ScreenView()
                .ignoresSafeArea(edges: .bottom)
                .frame(height: 800)
            // VStack
            VStack {
                // TextField
                TextField("Your email", text: $loginViewModel.user.email)
                    .keyboardType(.emailAddress)
                Divider()
                //                Spacer()
                // SecureField
                SecureField("Password", text: $loginViewModel.user.password)
                Divider()
                
                if loginViewModel.showProgressView {
                    ProgressView()
                }
                // Button
                Button("Log in") {
                    loginViewModel.login { success in
                        authentication.updateValidation(success: success)
                    }
                }
                .foregroundColor(.black)
                .disabled(loginViewModel.loginDisabled)
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            }
            .autocapitalization(.none)
            .font(.system(size: 20, weight: .medium, design: .monospaced))
            .offset(y: -250)
            .padding(.bottom, -150)
            //            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .disabled(loginViewModel.showProgressView)
            .alert(item: $loginViewModel.error) { error in
                Alert(title: Text("Invlid Login"), message:
                        Text (error.localizedDescription))
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

