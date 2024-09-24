//
//  User.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/23.
//

import Foundation

struct User {
    let mailAddress: MailAddress
    let password: Password
    
    init(mailaddress: String, password: String) throws {
        self.mailAddress = try MailAddress(mailaddress: mailaddress)
        self.password = try Password(password: password)
    }
}
