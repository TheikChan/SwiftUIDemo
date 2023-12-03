//
//  LoginView.swift
//  SwiftUIDemo
//
//  Created by Theik Chan on 28/11/2023.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                /// User name
                Section {
                    TextField("User name", text: $viewModel.name)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } footer: {
                    Text(viewModel.nameMessage).foregroundColor(.red)
                }
                
                /// Password
                Section {
                    SecureField("Password", text: $viewModel.password)
                    SecureField("Confirm password", text: $viewModel.confirmPassword)
                } footer: {
                    Text(viewModel.passwordMessage).foregroundColor(.red)
                }
                
                /// Login Button
                Section {
                    Button("Login") {
                        debugPrint("Logged in")
                    }.disabled(!viewModel.isValid)
                }
            }.navigationBarTitle("Login Form")
        }
    }
}

#Preview {
    LoginView()
}
