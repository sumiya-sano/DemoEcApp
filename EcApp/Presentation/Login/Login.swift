//
//  Login.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/22.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var showPopUp = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("メールアドレス")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Text("「@」,「.」以外の特殊文字は使用不可")
                        .font(.title3)
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    TextField("メールアドレスを入れてください", text: $viewModel.mailAddress)
                        .keyboardType(.emailAddress)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    Text("PASSWORD")
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Text("英数字で入力してください")
                        .font(.title3)
                        .foregroundColor(Color.gray)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    SecureField("パスワードを入れてください", text: $viewModel.password)
                        .textFieldStyle(.roundedBorder)
                        .padding()
                    
                    
                    
                    Button(action: {
                        viewModel.login()
                        showPopUp = true
                    }) {
                        Text("ログイン")
                            .font(.title)
                            .frame(width: 160, height: 60)
                            .accentColor(Color.white)
                            .background(Color(red: 0.0, green: 0.6196, blue: 0.5921))
                            .cornerRadius(.infinity)
                    }
                }
                if showPopUp {
                    Text("ログイン成功")
                        .frame(width: 300, height: 200)
                        .font(.title2)
                        .foregroundColor(Color(red: 0.0, green: 0.6196, blue: 0.5921))
                        .padding()
                        .background(Color.white.opacity(0.9))
                        .cornerRadius(8)
                        .shadow(radius: 10)
                        .transition(.opacity)
                        .animation(.easeInOut, value: showPopUp)
                }
                
                NavigationLink(destination: SearchResult(), isActive: $viewModel.isLoginSuccessful){
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    LoginView()
}

