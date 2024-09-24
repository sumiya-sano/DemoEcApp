//
//  Price.swift
//  EcApp
//
//  Created by 佐野澄哉 on 2024/09/24.
//

import Foundation

struct Price: Codable {
    var price: String
    
    init(price: String) {
        self.price = "\(price)円"
    }
}
