//
//  LoginUsecase.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/23.
//

import Foundation

//completion=非同期処理結果を返すクロージャ
//@escapingはクロージャ実行後も値を保持し、関数のスコープ外でも使用可能

class LoginUsecase {
    func login(mailAddress: String, password: String, completion: @escaping (String) -> Void) {
        do {
            let user = try User(mailaddress: mailAddress, password: password)
            LoginApi.login(user: user) { response in
                completion("ログイン成功")
            }
        } catch let error as MailAddress.MailAddressError {
            completion(error.localizedDescription)
        } catch let error as Password.PasswordError {
            completion(error.localizedDescription)
        } catch {
            completion("Unexpected error")
        }
    }
}
