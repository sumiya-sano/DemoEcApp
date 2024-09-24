//
//  MailAddress.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/23.
//

import Foundation

struct MailAddress {
    private var mailaddress: String
    
    enum MailAddressError: Error {
        case invalidEmail(String)
    }
    
    init(mailaddress: String) throws {
        guard MailAddress.isValid(email: mailaddress) else {
            throw MailAddressError.invalidEmail("正しいメールアドレスを入力してください")
        }
        self.mailaddress = mailaddress
    }
    
    static func isValid(email: String) -> Bool {
        return !email.isEmpty && email.contains("@") && email.contains(".") && !email.contains(where: {"!#$%&'()*+,/:;<>?[\\]^`{|}".contains($0)})
    }
}
