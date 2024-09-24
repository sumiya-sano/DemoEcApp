//
//  Password.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/23.
//

import Foundation

struct Password {
    private var password: String
    
    enum PasswordError: Error {
        case invalidPassword(String)
    }
    
    init(password: String) throws {
        guard Password.isValid(password: password) else {
            throw PasswordError.invalidPassword("英数字以外の文字が使われています")
        }
        self.password = password
    }
    
    static func isValid(password: String) -> Bool {
        return !password.isEmpty && !password.contains(where: { "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~".contains($0) })
    }
}


