//
//  LoginViewModel.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/24.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var mailAddress: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoginSuccessful: Bool = false
    
    private var loginUsecase = LoginUsecase()
    
    func login() {
        loginUsecase.login(mailAddress: mailAddress, password: password) { [weak self] result in //[weak self]は循環参照を防ぐ。は？
            DispatchQueue.main.async {
                if result == "ログイン成功" {
                    self?.isLoginSuccessful = true
                }
            }
        }
    }
}
