//
//  LoginView.swift
//  VK_SwiftUI
//
//  Created by aaa on 04/04/2023.
//

import SwiftUI
import Combine

struct LoginView: View {
    @StateObject private var loginViewModel = LoginModel()
    @EnvironmentObject var authentication: Authentication
    @State private var shouldShowLogo: Bool = true
    
    private let keyboardIsOnPublisher = Publishers.Merge( NotificationCenter.default.publisher(for: UIResponder.keyboardWillChangeFrameNotification)
        .map { _ in true },
                                                          
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        .map { _ in false }
    )
        .removeDuplicates()
    
    
    //TODO: Добавить ScrolView и выезд клавиатуры
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                if shouldShowLogo {
                    LogoView()
                        .frame(height: 150)
                        .offset(y: -50)
                        .padding()
                }
                VStack {
                    TextField("Your email", text: $loginViewModel.user.email)
                        .keyboardType(.emailAddress)
                    Divider()
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
            .frame(height: 900)
            .background(Image("screen1")
                .resizable()
               )
        }
        .ignoresSafeArea(edges: .top)
        
        .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
            withAnimation(Animation.easeInOut(duration: 0.5)) {
                self.shouldShowLogo = !isKeyboardOn }
        }
        .onTapGesture { UIApplication.shared.endEditing()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

