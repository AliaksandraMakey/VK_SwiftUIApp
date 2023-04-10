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
    
    //TODO: Добавить ScrolView и выезд клавиатуры
    var body: some View {
        // VStack
        VStack {
            LogoView()
                .frame(height: 150)
                .offset(y: -50)
                .padding()
            // VStack
            VStack {
                // TextField
                TextField("Your email", text: $loginViewModel.user.email)
                    .keyboardType(.emailAddress)
                Divider()
                // SecureField
                SecureField("Password", text: $loginViewModel.user.password)
                Divider()
                
                if loginViewModel.showProgressView {
                    ProgressView()
                }
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
            .offset(y: 50)
            .padding(.bottom, -150)
            .padding()
            .disabled(loginViewModel.showProgressView)
            .alert(item: $loginViewModel.error) { error in
                Alert(title: Text("Invlid Login"), message:
                        Text (error.localizedDescription))
            }
        }
        .frame(height: 830)
        // избавилась от доп сущности и перенесла настройку background. Увидела такой метод использования в уроке.
        .background(Image("screen1")
            .resizable()
            .ignoresSafeArea(edges: .top))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

